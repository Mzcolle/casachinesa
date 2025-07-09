<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Gateway\BsPayController;

Route::prefix('bspay')->group(function () {

    // 🚀 Geração de QRCode Pix
    Route::post('qrcode-pix', [BsPayController::class, 'getQRCodePix']);

    // ✅ Webhook (Callback) para pagamento Pix
    Route::post('callback', [BsPayController::class, 'callbackMethod']);

    // 🔍 Consulta manual do status da transação Pix
    Route::post('consult-status-transaction', [BsPayController::class, 'consultStatusTransactionPix']);

    // 🧪 Teste de callback manual
    Route::post('test-callback', [BsPayController::class, 'testCallback']);

    // 🔄 Callback antigo (se quiser pode remover)
    Route::post('payment', [BsPayController::class, 'callbackMethodPayment']);

    // 🎯 Rotas protegidas para saque (só no painel admin)
    Route::middleware(['admin.filament', 'admin'])->group(function () {

        // ✅ Confirmar saque (action = user ou affiliate)
        Route::post('withdrawal/{id}/{action}', [BsPayController::class, 'withdrawalFromModal'])
            ->name('bspay.withdrawal');

        // ❌ Cancelar saque (action = user ou affiliate)
        Route::post('cancelwithdrawal/{id}/{action}', [BsPayController::class, 'cancelWithdrawalFromModal'])
            ->name('bspay.cancelwithdrawal');
    });
});
