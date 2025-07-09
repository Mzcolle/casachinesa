<?php

namespace App\Traits\Providers;

use App\Models\GamesKey;
use App\Models\Game;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

trait PlayFiverTrait
{
    protected static $secretPlayFiver;
    protected static $codePlayFiver;
    protected static $tokenPlayFiver;
    protected static $apiEndpoint = "https://api.fivergames.com";

    // 🔑 Obter credenciais
    private static function credencialFiverPlay()
    {
        $setting = GamesKey::first();
        self::$secretPlayFiver = $setting->playfiver_secret;
        self::$codePlayFiver = $setting->playfiver_code;
        self::$tokenPlayFiver = $setting->playfiver_token;
    }

    // ✅ Criar usuário na API FiverGames
    public static function createUserFiverGames($userCode, $balance = 0)
    {
        self::credencialFiverPlay();

        $postArray = [
            "agent_code"  => self::$codePlayFiver,
            "agent_token" => self::$tokenPlayFiver,
            "secret_key"  => self::$secretPlayFiver,
            "method"      => "user_create",
            "user_code"   => $userCode,
            "balance"     => (float)$balance,
        ];

        $response = Http::post(self::$apiEndpoint, $postArray);
        $data = $response->json();

        Log::info("FiverGames - Create User", [
            'request' => $postArray,
            'response' => $data
        ]);

        if (isset($data['status']) && $data['status'] == 1) {
            return true;
        }

        return false;
    }

    // 🎯 Iniciar jogo na API
    public static function playFiverLaunch($gameCode, $demo = false)
    {
        self::credencialFiverPlay();

        $game = Game::with('provider')->where("game_code", $gameCode)->first();

        if (!$game) {
            Log::error("PlayFiverTrait - Game não encontrado", ['game_code' => $gameCode]);
            return ["msg" => "Game não encontrado"];
        }

        if (!$game->provider || !$game->provider->code) {
            Log::error("PlayFiverTrait - Provider não encontrado", ['game_code' => $gameCode]);
            return ["msg" => "Provider não encontrado"];
        }

        $user = Auth::guard("api")->user();
        $balance = self::getBalancePlayFiver($user->id);

        // 🔥 Cria usuário na API (se não existir)
        self::createUserFiverGames($user->email, $balance);

        $postArray = [
            "agent_code"    => self::$codePlayFiver,
            "agent_token"   => self::$tokenPlayFiver,
            "secret_key"    => self::$secretPlayFiver,
            "method"        => "game_launch",
            "user_code"     => $user->email,
            "provider_code" => $game->provider->code,
            "game_code"     => $gameCode,
            "balance"       => $balance,
            "lang"          => "pt"
        ];

        Log::info("PlayFiverTrait - Enviando dados para lançar jogo", ['request' => $postArray]);

        $response = Http::post(self::$apiEndpoint, $postArray);
        $data = $response->json();

        Log::info("PlayFiverTrait - Resposta recebida", ['response' => $data]);

        if (isset($data['launch_url'])) {
            return ["launch_url" => $data['launch_url']];
        }

        Log::error("PlayFiverTrait - launch_url não encontrado na resposta", ['response' => $data]);
        return ["msg" => "Erro ao lançar o jogo"];
    }

    // 🔥 Webhook de atualização de saldo
    public static function webhookPlayFiverAPI(Request $request)
    {
        Log::info('Webhook PlayFiver - Recebido', $request->all());

        $userCode = $request->input('user_code');
        $balance = floatval($request->input('balance'));
        $amount = floatval($request->input('amount'));

        $user = User::where('email', $userCode)->first();

        if (!$user) {
            Log::error('Webhook PlayFiver - Usuário não encontrado', ['user_code' => $userCode]);
            return response()->json(['status' => 'error', 'msg' => 'INVALID_USER'], 404);
        }

        $wallet = $user->wallet;

        if (!$wallet) {
            Log::error('Webhook PlayFiver - Carteira não encontrada', ['user_code' => $userCode]);
            return response()->json(['status' => 'error', 'msg' => 'WALLET_NOT_FOUND'], 404);
        }

        // Atualiza exatamente o saldo que a API enviou
        $wallet->balance = $balance;
        $wallet->save();

        Log::info('Webhook PlayFiver - Saldo atualizado', [
            'user_code' => $userCode,
            'balance' => $balance,
            'amount' => $amount
        ]);

        return response()->json(['status' => 'success', 'msg' => 'Saldo atualizado com sucesso']);
    }

    // 🔍 Consulta de saldo na plataforma
    private static function getBalancePlayFiver($id)
    {
        $user = User::find($id);
        if ($user && $user->wallet) {
            return (float)$user->wallet->balance;
        } else {
            return 0;
        }
    }
}
