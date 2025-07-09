<?php
use App\Http\Controllers\Gateway\BsPayController;
use Illuminate\Support\Facades\Route;

Route::prefix('brmasterpay')->group(function () {
    Route::post('qrcode-pix', [BsPayController::class, 'getQRCodePix']);
    Route::post('callback', [BsPayController::class, 'callbackMethod']);
    Route::post('consult-status-transaction', [BsPayController::class, 'consultStatusTransactionPix']);
    Route::post('test-callback', [BsPayController::class, 'testCallback']);
});

