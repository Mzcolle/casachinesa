<?php

namespace App\Filament\Admin\Widgets;

use App\Models\User;
use App\Models\GGRGames;
use App\Models\GGRGamesDrakon;
use App\Models\GGRGamesFiver;
use App\Models\GgrGamesWorldSlot;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Helpers\Core as Helper;

class StatsOverview extends BaseWidget
{
    protected static ?int $sort = 2;
    protected static ?string $pollingInterval = '15s';
    protected static bool $isLazy = true;

    /**
     * @return array|Stat[]
     */
    protected function getStats(): array
    {
        // Dados de apostas
        $totalApostas = GGRGames::sum('balance_bet') +
                        GGRGamesDrakon::sum('balance_bet') +
                        GGRGamesFiver::sum('balance_bet') +
                        GgrGamesWorldSlot::sum('balance_bet');
        
        $totalGanhos = GGRGames::sum('balance_win') +
                       GGRGamesDrakon::sum('balance_win') +
                       GGRGamesFiver::sum('balance_win') +
                       GgrGamesWorldSlot::sum('balance_win');
        
        $totalPerdas = $totalApostas - $totalGanhos;
        $ggr = $totalPerdas - $totalGanhos;

        // Dados de usuários
        $totalUsuarios = User::count();
        $totalUsuariosHoje = User::whereDate('created_at', Carbon::today())->count();
        $totalUsuariosSemana = User::whereBetween('created_at', [
            Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()
        ])->count();

        // Cálculos de performance
        $winRate = $totalApostas > 0 ? round(($totalGanhos / $totalApostas) * 100, 2) : 0;
        $growthRateToday = $this->calculateGrowthRate($totalUsuariosHoje, $totalUsuarios);
        $growthRateWeek = $this->calculateGrowthRate($totalUsuariosSemana, $totalUsuarios);

        return [
             Stat::make('Usuários', '') // Segundo parâmetro vazio
            ->extraAttributes([
                'class' => 'col-span-full',
                'style' => 'grid-column: 1 / -1;
                            background: transparent;
                            box-shadow: none;
                            padding: 0.5rem 1rem;
                            margin-bottom: -0.5rem;
                            font-weight: 600;
                            font-size: 0.875rem;
                            color: #6b7280;
                            text-transform: uppercase;
                            letter-spacing: 0.05em;
                            border-bottom: 1px solid #e5e7eb;' // Linha divisória opcional
            ]),
            // Seção de Usuários
            Stat::make('Total de Usuários', $totalUsuarios)
                ->description("{$growthRateWeek}% crescimento semanal")
                ->descriptionIcon($growthRateWeek >= 0 ? 'heroicon-m-users' : 'heroicon-m-user-minus')
                ->chart($this->getUserChartData())
                ->chartColor('primary')
                ->color('primary')
                ->extraAttributes([
                    'class' => 'dashboard-card',
                    'style' => 'background: linear-gradient(135deg, rgba(99,102,241,0.1) 0%, rgba(99,102,241,0.2) 100%); 
                                border-left: 4px solid rgb(99,102,241);
                                border-radius: 8px;'
                ]),

            Stat::make('Novos Hoje', $totalUsuariosHoje)
                ->description("{$growthRateToday}% do total")
                ->descriptionIcon($totalUsuariosHoje > 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($totalUsuariosHoje > 0 ? 'success' : 'danger')
                ->extraAttributes([
                    'class' => 'dashboard-card',
                    'style' => 'background: linear-gradient(135deg, rgba(16,185,129,0.1) 0%, rgba(5,150,105,0.2) 100%);
                                border-left: 4px solid rgb(16,185,129);
                                border-radius: 8px;'
                ]),

            Stat::make('Esta Semana', $totalUsuariosSemana)
                ->description('Novos cadastros')
                ->descriptionIcon('heroicon-m-calendar')
                ->color('info')
                ->extraAttributes([
                    'class' => 'dashboard-card',
                    'style' => 'background: linear-gradient(135deg, rgba(59,130,246,0.1) 0%, rgba(59,130,246,0.2) 100%);
                                border-left: 4px solid rgb(59,130,246);
                                border-radius: 8px;'
                ]),
  Stat::make('Movimentação dos Usuários', '') // Segundo parâmetro vazio
            ->extraAttributes([
                'class' => 'col-span-full',
                'style' => 'grid-column: 1 / -1;
                            background: transparent;
                            box-shadow: none;
                            padding: 0.5rem 1rem;
                            margin-bottom: -0.5rem;
                            font-weight: 600;
                            font-size: 0.875rem;
                            color: #6b7280;
                            text-transform: uppercase;
                            letter-spacing: 0.05em;
                            border-bottom: 1px solid #e5e7eb;' // Linha divisória opcional
            ]),
            // Seção de Apostas
            Stat::make('Total Apostado', Helper::amountFormatDecimal($totalApostas))
                ->description('Valor total')
                ->descriptionIcon('heroicon-m-currency-dollar')
                ->color('warning')
                ->chart($this->getWeeklyData('balance_bet'))
                ->extraAttributes([
                    'class' => 'dashboard-card',
                    'style' => 'background: linear-gradient(135deg, rgba(245,158,11,0.1) 0%, rgba(245,158,11,0.2) 100%);
                                border-left: 4px solid rgb(245,158,11);
                                border-radius: 8px;'
                ]),

            Stat::make('Total Ganhos', Helper::amountFormatDecimal($totalGanhos))
                ->description("Taxa de vitória: {$winRate}%")
                ->descriptionIcon($winRate >= 50 ? 'heroicon-m-trophy' : 'heroicon-m-face-frown')
                ->color($winRate >= 50 ? 'success' : 'danger')
                ->extraAttributes([
                    'class' => 'dashboard-card',
                    'style' => 'background: linear-gradient(135deg, rgba(34,197,94,0.1) 0%, rgba(34,197,94,0.2) 100%);
                                border-left: 4px solid rgb(34,197,94);
                                border-radius: 8px;'
                ]),

            Stat::make('Total Perdas', Helper::amountFormatDecimal($totalPerdas))
                ->description('Perdas nos jogos')
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('danger')
                ->extraAttributes([
                    'class' => 'dashboard-card',
                    'style' => 'background: linear-gradient(135deg, rgba(239,68,68,0.1) 0%, rgba(239,68,68,0.2) 100%);
                                border-left: 4px solid rgb(239,68,68);
                                border-radius: 8px;'
                ]),
        ];
    }

    protected function calculateGrowthRate($new, $total): float
    {
        return $total > 0 ? round(($new / $total) * 100, 2) : 0;
    }

    protected function getUserChartData(): array
    {
        return [
            User::whereDate('created_at', Carbon::now()->subDays(6))->count(),
            User::whereDate('created_at', Carbon::now()->subDays(5))->count(),
            User::whereDate('created_at', Carbon::now()->subDays(4))->count(),
            User::whereDate('created_at', Carbon::now()->subDays(3))->count(),
            User::whereDate('created_at', Carbon::now()->subDays(2))->count(),
            User::whereDate('created_at', Carbon::now()->subDays(1))->count(),
            User::whereDate('created_at', Carbon::now())->count(),
        ];
    }

    protected function getWeeklyData($column): array
    {
        return [
            GGRGames::whereDate('created_at', Carbon::now()->subDays(6))->sum($column) +
            GGRGamesDrakon::whereDate('created_at', Carbon::now()->subDays(6))->sum($column) +
            GGRGamesFiver::whereDate('created_at', Carbon::now()->subDays(6))->sum($column) +
            GgrGamesWorldSlot::whereDate('created_at', Carbon::now()->subDays(6))->sum($column),
            
            // Repetir para os outros 6 dias
            // ...
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()->hasRole('admin');
    }
}