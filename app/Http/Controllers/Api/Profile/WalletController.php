<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Helpers\Core;
use App\Models\Setting;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Withdrawal;
use App\Models\AffiliateWithdraw;
use App\Models\SuitPayPayment;
use App\Notifications\NewWithdrawalNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Filament\Notifications\Notification;
use App\Traits\Gateways\DigitoPayTrait;
use App\Traits\Gateways\BsPayTrait;
use App\Traits\Gateways\EzzepayTrait;
use App\Traits\Gateways\SuitPayTrait;

class WalletController extends Controller
{
    use BsPayTrait, SuitPayTrait, EzzepayTrait, DigitoPayTrait;

    public function index()
    {
        $wallet = Wallet::whereUserId(auth('api')->id())->where('active', 1)->first();
        return response()->json(['wallet' => $wallet], 200);
    }

    public function myWallet()
    {
        $wallets = Wallet::whereUserId(auth('api')->id())->get();
        return response()->json(['wallets' => $wallets], 200);
    }

    public function setWalletActive($id)
    {
        $checkWallet = Wallet::whereUserId(auth('api')->id())->where('active', 1)->first();
        if (!empty($checkWallet)) {
            $checkWallet->update(['active' => 0]);
        }

        $wallet = Wallet::find($id);
        if (!empty($wallet)) {
            $wallet->update(['active' => 1]);
            return response()->json(['wallet' => $wallet], 200);
        }
    }

    // ✅ Método de saque via painel admin
    public function withdrawalFromModal($id, Request $request)
    {
        $setting = Core::getSetting();
        $resultado = null;
        $tipo = $request->input("action");

        switch ($setting->default_gateway) {
            case 'suitpay':
                $withdrawal = Withdrawal::find($id);
                if ($tipo == "afiliado") {
                    $withdrawal = AffiliateWithdraw::find($id);
                }
                $withdrawal->update(['status' => 1]);

                $suitpayment = SuitPayPayment::create([
                    'withdrawal_id' => $withdrawal->id,
                    'user_id'       => $withdrawal->user_id,
                    'pix_key'       => $withdrawal->pix_key,
                    'pix_type'      => $withdrawal->pix_type,
                    'cpf'           => $withdrawal->cpf,
                    'amount'        => $withdrawal->amount,
                    'observation'   => 'Saque direto',
                ]);

                $parm = [
                    'pix_key'        => $withdrawal->pix_key,
                    'pix_type'       => $withdrawal->pix_type,
                    'cpf'            => $withdrawal->cpf,
                    'amount'         => $withdrawal->amount,
                    'suitpayment_id' => $suitpayment->id
                ];

                $resultado = self::suitPayPixCashOut($parm);
                break;

            case 'digitopay':
                $resultado = self::pixCashOutDigito($id, $tipo);
                break;

            case 'bspay':
                $resultado = self::pixCashOutBrMasterPay($id, $tipo);
                break;

            case 'ezzepay':
                $resultado = self::pixCashOutEzze($id, $tipo);
                break;
        }

        if ($resultado == true) {
            Notification::make()
                ->title('Saque solicitado')
                ->body('Saque solicitado com sucesso')
                ->success()
                ->send();
            return back();
        } else {
            Notification::make()
                ->title('Erro no saque')
                ->body('Erro ao solicitar o saque')
                ->danger()
                ->send();
            return back();
        }
    }

    // ✅ Saque via API BR Master Pay
    public function pixCashOutBrMasterPay($id, $tipo)
    {
        try {
            if ($tipo === "afiliado") {
                $withdrawal = AffiliateWithdraw::find($id);
            } else {
                $withdrawal = Withdrawal::find($id);
            }

            if (!$withdrawal) {
                return false;
            }

            $withdrawal->update(['status' => 1]);

            $response = $this->transferPixBrMasterPay([
                'pix_key'    => $withdrawal->pix_key,
                'cpf'        => $withdrawal->cpf,
                'nome'       => $withdrawal->cpf,
                'amount'     => $withdrawal->amount,
                'description'=> 'Saque realizado via BR Master Pay',
                'pin'        => '0000'
            ]);

            if ($response['status'] == true) {
                $withdrawal->update(['status' => 'paid']);
                return true;
            } else {
                \Log::error('Erro no saque BR Master Pay: ' . ($response['message'] ?? 'Sem mensagem'));
                return false;
            }

        } catch (\Exception $e) {
            \Log::error('Erro BR Master Pay saque: ' . $e->getMessage());
            return false;
        }
    }

    // ✅ Método de saque via API padrão (usado pelo frontend)
    public function requestWithdrawal(Request $request)
    {
        try {
            $user = auth('api')->user();
            $setting = Setting::first();

            $rules = [
                'amount'   => ['required', 'numeric', 'min:' . $setting->min_withdrawal, 'max:' . $setting->max_withdrawal],
                'pix_key'  => 'required',
                'pix_type' => 'required',
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            if ($request->amount > $user->wallet->balance_withdrawal) {
                return response()->json(['error' => 'Você não tem saldo suficiente para sacar.'], 400);
            }

            $withdrawal = Withdrawal::create([
                'user_id'   => $user->id,
                'amount'    => $request->amount,
                'type'      => 'pix',
                'pix_key'   => $request->pix_key,
                'pix_type'  => $request->pix_type,
                'cpf'       => $user->cpf ?? $request->cpf,
                'currency'  => $user->wallet->currency,
                'symbol'    => $user->wallet->symbol,
                'status'    => 0,
            ]);

            $user->wallet->decrement('balance_withdrawal', $request->amount);

            $admins = User::where('role_id', 0)->get();
            foreach ($admins as $admin) {
                $admin->notify(new NewWithdrawalNotification($user->name, $request->amount));
            }

            return response()->json([
                'status'  => true,
                'message' => 'Saque realizado com sucesso.',
                'withdrawal' => $withdrawal
            ], 200);

        } catch (\Exception $e) {
            \Log::error('Erro no saque: ' . $e->getMessage());
            return response()->json(['error' => 'Erro ao realizar o saque.'], 500);
        }
    }

    // ✅ Atualiza bônus
    public function updateBonusIfNeeded()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        if ($wallet->balance_bonus == 0) {
            $wallet->balance_bonus_rollover = 0;
            $wallet->save();
            $messages[] = 'Bônus zerado e rollover atualizado.';
        }

        return response()->json(['messages' => $messages], 200);
    }

    // ✅ Transfere saldo para saque se necessário
    public function transferBalanceToWithdrawalIfNeeded()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        if ($wallet->balance_deposit_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance;
            $wallet->balance = 0;
            $wallet->save();
            $messages[] = 'Saldo transferido para saque com sucesso!';
        }

        return response()->json(['messages' => $messages], 200);
    }

    // ✅ Transfere bônus para saque se necessário
    public function transferBonusToWithdrawalIfNeeded()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        if ($wallet->balance_bonus_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance_bonus;
            $wallet->balance_bonus = 0;
            $wallet->save();
            $messages[] = 'Saldo do bônus transferido para saque com sucesso!';
        }

        return response()->json(['messages' => $messages], 200);
    }

    // ✅ Verifica e atualiza bônus, rollover e saldo
    public function checkAndUpdateBonus()
    {
        $userId = auth('api')->id();
        $wallet = Wallet::where('user_id', $userId)->first();

        if (!$wallet) {
            return response()->json(['error' => 'Carteira não encontrada'], 404);
        }

        $messages = [];

        if ($wallet->balance_bonus == 0) {
            $wallet->balance_bonus_rollover = 0;
            $wallet->save();
            $messages[] = 'Bônus zerado e rollover atualizado.';
        }

        if ($wallet->balance_deposit_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance;
            $wallet->balance = 0;
            $wallet->save();
            $messages[] = 'Saldo transferido para saque com sucesso!';
        }

        if ($wallet->balance_bonus_rollover == 0) {
            $wallet->balance_withdrawal += $wallet->balance_bonus;
            $wallet->balance_bonus = 0;
            $wallet->save();
            $messages[] = 'Saldo do bônus transferido para saque com sucesso!';
        }

        if (empty($messages)) {
            return response()->json(['message' => 'Nenhuma atualização necessária'], 200);
        }

        return response()->json(['messages' => $messages], 200);
    }
}
