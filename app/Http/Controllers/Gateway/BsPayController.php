<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\Transaction;
use App\Models\Wallet;
use App\Models\User;
use App\Traits\Gateways\BsPayTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class BsPayController extends Controller
{
    use BsPayTrait;

    public function getQRCodePix(Request $request)
    {
        return self::requestQrcodeBsPay($request);
    }

    public function callbackMethod(Request $request)
    {
        Log::info('Processando o callback...');

        $data = $request->all();
        Log::info('Dados recebidos no callback: ' . json_encode($data));

        if (
            isset($data['external_reference']) &&
            strtolower($data['status']) === 'paid'
        ) {
            Log::info('Transação válida recebida! external_reference: ' . $data['external_reference']);

            if (self::finalizePaymentBsPay($data['external_reference'])) {
                Log::info('Pagamento finalizado com sucesso!');
                return response()->json(['status' => 'success'], 200);
            } else {
                Log::error('Falha ao finalizar o pagamento para external_reference: ' . $data['external_reference']);
                return response()->json(['error' => 'Falha ao processar pagamento'], 500);
            }
        }

        Log::error('Callback não processado corretamente.', $data);
        return response()->json(['error' => 'Callback não processado corretamente.'], 400);
    }
}
