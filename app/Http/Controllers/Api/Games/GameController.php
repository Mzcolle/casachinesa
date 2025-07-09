<?php

namespace App\Http\Controllers\Api\Games;

use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Models\GameFavorite;
use App\Models\GameLike;
use App\Models\Provider;
use App\Models\Wallet;
use Illuminate\Http\Request;
use App\Helpers\Core as Helper;
use App\Traits\Providers\PlayFiverTrait;

class GameController extends Controller
{
    use PlayFiverTrait;

    /**
     * Lista todos os provedores e seus jogos.
     */
    public function index()
    {
        $providers = Provider::with(['games', 'games.provider'])
            ->whereHas('games')
            ->where('status', 1)
            ->orderBy('name', 'desc')
            ->get();

        return response()->json(['providers' => $providers]);
    }

    /**
     * Lista todos os jogos, com filtros por provedor, categoria ou busca.
     */
    public function allGames(Request $request)
    {
        $query = Game::query();
        $query->with(['provider', 'categories']);

        if (!empty($request->provider) && $request->provider != 'all') {
            $query->where('provider_id', $request->provider);
        }

        if (!empty($request->category) && $request->category != 'all') {
            $query->whereHas('categories', function ($categoryQuery) use ($request) {
                $categoryQuery->where('slug', $request->category);
            });
        }

        if (isset($request->searchTerm) && !empty($request->searchTerm) && strlen($request->searchTerm) > 2) {
            $query->whereLike(
                ['game_code', 'game_name', 'description', 'distribution', 'provider.name'],
                $request->searchTerm
            );
        } else {
            $query->orderBy('views', 'desc');
        }

        $games = $query
            ->where('status', 1)
            ->paginate(130)
            ->appends(request()->query());

        return response()->json(['games' => $games]);
    }

    /**
     * Lista os jogos em destaque.
     */
    public function featured()
    {
        $featured_games = Game::with('provider')
            ->where('is_featured', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['featured_games' => $featured_games]);
    }

    /**
     * Lista jogos de pescaria.
     */
    public function pescaria()
    {
        $pescaria_games = Game::with('provider')
            ->where('is_pescaria', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['pescaria_games' => $pescaria_games]);
    }

    /**
     * Lista jogos de blockchain.
     */
    public function blockchain()
    {
        $blockchain_games = Game::with('provider')
            ->where('is_blockchain', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['blockchain_games' => $blockchain_games]);
    }

    /**
     * Lista jogos de influenciadores.
     */
    public function influencer()
    {
        $influencer_games = Game::with('provider')
            ->where('is_influencer_mode', 1)
            ->where('status', 1)
            ->get();

        return response()->json(['influencer_games' => $influencer_games]);
    }

    /**
     * Inicia o jogo.
     */
    public function show(string $id)
    {
        $game = Game::with(['categories', 'provider'])
            ->where('status', 1)
            ->find($id);

        if (!$game) {
            return response()->json(['error' => 'Jogo não encontrado', 'status' => false], 404);
        }

        if (auth('api')->check()) {
            $wallet = Wallet::where('user_id', auth('api')->id())->first();

            if ($wallet && $wallet->total_balance > 0) {
                $game->increment('views');

                $token = Helper::MakeToken([
                    'id' => auth('api')->user()->id,
                    'game' => $game->game_code
                ]);

                switch ($game->distribution) {
                    case 'play_fiver':
                        $playfiver = self::playFiverLaunch($game->game_code, $game->only_demo);

                        if (isset($playfiver['launch_url'])) {
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => $playfiver['launch_url'],
                                'token' => $token
                            ]);
                        }

                        return response()->json(['error' => $playfiver, 'status' => false], 400);
                }
            }

            return response()->json([
                'error' => 'Você precisa ter saldo para jogar',
                'status' => false,
                'action' => 'deposit'
            ], 200);
        }

        return response()->json([
            'error' => 'Você precisa estar autenticado para jogar',
            'status' => false
        ], 400);
    }

    /**
     * Adiciona ou remove jogo dos favoritos.
     */
    public function toggleFavorite($id)
    {
        if (auth('api')->check()) {
            $checkExist = GameFavorite::where('user_id', auth('api')->id())
                ->where('game_id', $id)
                ->first();

            if ($checkExist) {
                $checkExist->delete();
                return response()->json(['status' => true, 'message' => 'Removido dos favoritos']);
            } else {
                GameFavorite::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);
                return response()->json(['status' => true, 'message' => 'Adicionado aos favoritos']);
            }
        }
    }

    /**
     * Adiciona ou remove like no jogo.
     */
    public function toggleLike($id)
    {
        if (auth('api')->check()) {
            $checkExist = GameLike::where('user_id', auth('api')->id())
                ->where('game_id', $id)
                ->first();

            if ($checkExist) {
                $checkExist->delete();
                return response()->json(['status' => true, 'message' => 'Removido dos likes']);
            } else {
                GameLike::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);
                return response()->json(['status' => true, 'message' => 'Adicionado aos likes']);
            }
        }
    }

    /**
     * Retorna jogos por provedor.
     */
    public function getGamesByProvider(Request $request)
    {
        $providerId = $request->input('provider_id');
        $perPage = $request->input('per_page', 6);

        $games = Game::where('provider_id', $providerId)
            ->where('status', 1)
            ->paginate($perPage);

        return response()->json($games);
    }

    /**
     * Webhook do PlayFiver.
     */
    public function webhookPlayFiver(Request $request)
    {
        return self::webhookPlayFiverAPI($request);
    }

    /**
     * Callback para rollback.
     */
    public function rollbackTransactionCallback(Request $request)
    {
        return response()->json(['message' => 'Callback de RollbackTransaction recebido com sucesso']);
    }
}
