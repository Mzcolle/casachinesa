<?php

namespace App\Traits\Gateways;

use App\Helpers\Core;
use App\Models\Deposit;
use App\Models\Gateway;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Notifications\NewDepositNotification;
use Exception;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

trait BsPayTrait
{
    protected static string $uriBsPay;
    protected static string $clienteIdBsPay;
    protected static string $clienteSecretBsPay;

    private static function generateCredentialsBsPay()
    {
        $setting = Gateway::first();
        if (!empty($setting)) {
            self::$uriBsPay = rtrim($setting->bspay_uri, '/') . '/';
            self::$clienteIdBsPay = $setting->bspay_cliente_id;
            self::$clienteSecretBsPay = $setting->bspay_cliente_secret;
        }
    }

    // ✅ DEPÓSITO
    public function requestQrcodeBsPay($request)
    {
        try {
            $setting = Core::getSetting();

            $rules = [
                'amount' => ['required', 'numeric', 'min:' . $setting->min_deposit, 'max:' . $setting->max_deposit],
                'cpf' => ['required', 'string', 'min:11']
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            self::generateCredentialsBsPay();

            $user = auth('api')->user();
            $postbackUrl = url('/api/brmasterpay/callback');

            $payload = [
                'client_id'     => self::$clienteIdBsPay,
                'client_secret' => self::$clienteSecretBsPay,
                'nome'          => $user->name ?? 'Cliente',
                'cpf'           => preg_replace('/[^0-9]/', '', $request->input('cpf')),
                'valor'         => number_format((float) $request->input('amount'), 2, '.', ''),
                'descricao'     => 'Depósito via Pix',
                'urlnoty'       => $postbackUrl
            ];

            Log::info('Enviando payload BSPay', $payload);

            $response = Http::withHeaders([
                'Content-Type' => 'application/json',
            ])->post(self::$uriBsPay . 'pix/qrcode', $payload);

            $data = $response->json();
            Log::info('Resposta BSPay', ['response' => $data]);

            if (isset($data['external_reference'])) {
                $token = self::generateTransactionBsPay(
                    $data['external_reference'],
                    $request->input("amount"),
                    $request->input('accept_bonus') ?? false
                );

                self::generateDepositBsPay($data['external_reference'], $request->input("amount"));

                return response()->json([
                    'status'        => true,
                    'idTransaction' => $data['external_reference'],
                    'pixCode'       => $data['pix_qr_code'],
                    'qrcode'        => $data['pixCode'],
                    'token'         => $token
                ]);
            } else {
                return response()->json(['error' => 'Erro ao gerar QR Code', 'details' => $data], 500);
            }
        } catch (Exception $e) {
            Log::error('Erro interno ao gerar QR Code BSPay: ' . $e->getMessage());
            return response()->json(['error' => 'Erro interno'], 500);
        }
    }

    private static function generateDepositBsPay($paymentId, $amount)
    {
        $userId = auth('api')->user()->id;
        $wallet = Wallet::where('user_id', $userId)->first();

        Deposit::create([
            'payment_id' => $paymentId,
            'user_id'    => $userId,
            'amount'     => $amount,
            'type'       => 'pix',
            'currency'   => $wallet->currency,
            'symbol'     => $wallet->symbol,
            'status'     => 0
        ]);
    }

    private static function generateTransactionBsPay($paymentId, $amount, $accept_bonus = false)
    {
        $setting = Core::getSetting();
        $token = bin2hex(random_bytes(16));

        Transaction::create([
            'payment_id'    => $paymentId,
            'user_id'       => auth('api')->user()->id,
            'payment_method'=> 'pix',
            'price'         => $amount,
            'currency'      => $setting->currency_code,
            'status'        => 0,
            'accept_bonus'  => $accept_bonus,
            'token'         => $token,
        ]);

        return $token;
    }

    public static function finalizePaymentBsPay($idTransaction): bool
    {
        $transaction = Transaction::where('payment_id', $idTransaction)->first();

        if (empty($transaction)) {
            Log::error("Transação não encontrada para payment_id: {$idTransaction}");
            return false;
        }

        if ($transaction->status == 1) {
            Log::info("Transação {$idTransaction} já foi processada.");
            return true;
        }

        $setting = Core::getSetting();
        $user = User::find($transaction->user_id);
        $wallet = Wallet::where('user_id', $transaction->user_id)->first();

        if (!$wallet) {
            Log::error("Carteira não encontrada para o usuário ID: {$transaction->user_id}");
            return false;
        }

        $checkTransactions = Transaction::where('user_id', $transaction->user_id)->where('status', 1)->count();
        if ($checkTransactions == 0 && $transaction->accept_bonus) {
            $bonus = Core::porcentagem_xn($setting->initial_bonus, $transaction->price);
            $wallet->increment('balance_bonus', $bonus);

            if (!$setting->disable_rollover) {
                $wallet->update(['balance_bonus_rollover' => $bonus * $setting->rollover]);
            }
        }

        if (!$setting->disable_rollover) {
            $wallet->increment('balance_deposit_rollover', ($transaction->price * intval($setting->rollover_deposit)));
        }

        Core::payBonusVip($wallet, $transaction->price);

        if ($setting->disable_rollover) {
            $wallet->increment('balance_withdrawal', $transaction->price);
        } else {
            $wallet->increment('balance', $transaction->price);
        }

        $transaction->update(['status' => 1]);

        $deposit = Deposit::where('payment_id', $idTransaction)->first();
        if ($deposit && $deposit->status == 0) {
            $deposit->update(['status' => 1]);
        }

        $admins = User::where('role_id', 0)->get();
        foreach ($admins as $admin) {
            $admin->notify(new NewDepositNotification($user->name, $transaction->price));
        }

        Log::info("Transação {$idTransaction} processada com sucesso.");
        return true;
    }

    // ✅ SAQUE BSPAY
    public function transferPixBrMasterPay(array $params): array
{
    try {
        self::generateCredentialsBsPay();

        $payload = [
            'client_id'     => self::$clienteIdBsPay,
            'client_secret' => self::$clienteSecretBsPay,
            'nome'          => $params['nome'] ?? $params['cpf'],
            'cpf'           => preg_replace('/[^0-9]/', '', $params['cpf']),
            'valor'         => number_format((float) $params['amount'], 2, '.', ''),
            'chave_pix'     => $params['pix_key'],
            'urlnoty'       => url('/brmasterpay/callback'), // 🔥 ✅ Callback enviado
            'pin'           => $params['pin'] ?? '0000',
        ];

        \Log::info('➡️ Enviando solicitação de saque para BR Master Pay', $payload);

        $response = \Http::asForm()->post(rtrim(self::$uriBsPay, '/') . '/pix/payments', $payload);

        $data = $response->json();

        \Log::info('⬅️ Resposta do saque BR Master Pay', ['response' => $data]);

        if (isset($data['statusCode']) && $data['statusCode'] == 200) {
            return [
                'status'  => true,
                'message' => $data['message'] ?? 'Transferência enviada com sucesso',
                'data'    => $data,
            ];
        } else {
            return [
                'status'  => false,
                'message' => $data['message'] ?? 'Erro na solicitação de saque',
                'data'    => $data,
            ];
        }
    } catch (\Exception $e) {
        \Log::error('❌ Erro na solicitação de saque BR Master Pay: ' . $e->getMessage());
        return [
            'status'  => false,
            'message' => 'Erro interno: ' . $e->getMessage(),
        ];
    }
}



}
