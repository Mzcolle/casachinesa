<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Helpers\Core as Helper;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Models\Wallet;

class MinesGameController extends Controller
{
    /**
     * Obter o saldo da carteira do usuário
     */
    public function getBalance()
    {
        $user = Auth::user();
        $wallet = Wallet::where('user_id', $user->id)->first();
        Log::info('wallet '. $wallet);

        return response()->json([
            'success' => true,
            'balance' => $wallet->balance,
            'balance_bonus' => $wallet->balance_bonus ?? 0
        ]);
    }

    /**
     * Processar uma aposta no jogo de minas
     */
    public function placeBet(Request $request)
    {
        // Validação
        $validated = $request->validate([
            'bet_amount' => 'required|numeric|min:0.1',
            'mines_count' => 'required|integer|min:1|max:24',
        ]);

        try {
            $user = Auth::user();
            $betAmount = $validated['bet_amount'];
            $minesCount = $validated['mines_count'];

            Log::info('Usuário realizando aposta em Mines:', [
                'user_id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'bet_amount' => $betAmount,
                'mines_count' => $minesCount
            ]);

            $wallet = Wallet::where('user_id', $user->id)->first();
            Log::info('wallet '. $wallet);
            
            // Verificar se o usuário tem saldo suficiente
            if (($wallet->balance + $wallet->balance_bonus) < $betAmount) {
                return response()->json([
                    'success' => false,
                    'message' => 'Saldo insuficiente'
                ], 400);
            }

            // Descontar o valor da aposta (usando o Helper)
            $changeBonus = Helper::DiscountBalance($wallet, $betAmount);
            Log::info('changeBonus'. $changeBonus);

            // Registrar a transação
            Transaction::create([
                'user_id' => $user->id,
                'amount' => -$betAmount,
                'type' => 'mines_bet',
                'status' => 'completed',
                'metadata' => json_encode([
                    'mines_count' => $minesCount,
                    'bet_amount' => $betAmount
                ])
            ]);

            return response()->json([
                'success' => true,
                'new_balance' => $wallet->balance,
                'new_bonus' => $wallet->balance_bonus
            ]);

        } catch (\Exception $e) {
            Log::error('Erro no MinesGameController (placeBet): ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Ocorreu um erro ao processar sua aposta'
            ], 500);
        }
    }

    /**
     * Processar um ganho no jogo de minas
     */
    public function win(Request $request)
    {
        // Validação
        $validated = $request->validate([
            'bet_amount' => 'required|numeric|min:0.1',
            'multiplier' => 'required|numeric|min:1',
            'mines_count' => 'required|integer|min:1|max:24',
            'revealed_count' => 'required|integer|min:0'
        ]);

        try {
            $user = Auth::user();
            $betAmount = $validated['bet_amount'];
            $multiplier = $validated['multiplier'];
            $minesCount = $validated['mines_count'];
            $revealedCount = $validated['revealed_count'];
            
            $winAmount = $betAmount * $multiplier;

            Log::info('Usuário ganhou em Mines:', [
                'user_id' => $user->id,
                'bet_amount' => $betAmount,
                'multiplier' => $multiplier,
                'win_amount' => $winAmount,
                'mines_count' => $minesCount,
                'revealed_count' => $revealedCount
            ]);

            // Adicionar o valor ganho ao saldo
            $wallet = Wallet::where('user_id', $user->id)->first();
            Log::info('wallet '. $wallet);
            
            $wallet->increment('balance', $winAmount);
            $wallet->save();

            // Registrar a transação
            Transaction::create([
                'user_id' => $user->id,
                'amount' => $winAmount,
                'type' => 'mines_win',
                'status' => 'completed',
                'metadata' => json_encode([
                    'bet_amount' => $betAmount,
                    'multiplier' => $multiplier,
                    'mines_count' => $minesCount,
                    'revealed_count' => $revealedCount
                ])
            ]);

            return response()->json([
                'success' => true,
                'new_balance' => $wallet->balance,
                'new_bonus' => $wallet->balance_bonus
            ]);

        } catch (\Exception $e) {
            Log::error('Erro no MinesGameController (win): ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Ocorreu um erro ao processar seu ganho'
            ], 500);
        }
    }

    /**
     * Registrar uma perda no jogo de minas
     */
    public function lose(Request $request)
    {
        // Validação
        $validated = $request->validate([
            'bet_amount' => 'required|numeric|min:0.1',
            'mines_count' => 'required|integer|min:1|max:24'
        ]);

        try {
            $user = Auth::user();
            $betAmount = $validated['bet_amount'];
            $minesCount = $validated['mines_count'];

            Log::info('Usuário perdeu em Mines:', [
                'user_id' => $user->id,
                'bet_amount' => $betAmount,
                'mines_count' => $minesCount
            ]);

            // Registrar a transação (a perda já foi contabilizada no placeBet)
            Transaction::create([
                'user_id' => $user->id,
                'amount' => 0,
                'type' => 'mines_lose',
                'status' => 'completed',
                'metadata' => json_encode([
                    'bet_amount' => $betAmount,
                    'mines_count' => $minesCount
                ])
            ]);

            return response()->json([
                'success' => true
            ]);

        } catch (\Exception $e) {
            Log::error('Erro no MinesGameController (lose): ' . $e->getMessage());
            
            return response()->json([
                'success' => false,
                'message' => 'Ocorreu um erro ao registrar sua jogada'
            ], 500);
        }
    }
}