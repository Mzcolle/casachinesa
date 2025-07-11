<?php

namespace App\Filament\Admin\Pages;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Section;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Support\Facades\Artisan;
use Livewire\WithFileUploads;


class AdvancedPage extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static string $view = 'filament.pages.advanced-page';

    protected static ?string $navigationLabel = 'Opções Avançada';

    protected static ?string $modelLabel = 'Opções Avançada';

    protected static ?string $title = 'Opções Avançada';

    protected static ?string $slug = 'advanced-options-pros';

    public ?array $data = [];
    public $output;

    /**
     * @dev @anonymous
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @return void
     */
    public function mount(): void
    {

    }

    /**
     * @param $type
     * @return void
     */
    public function loadProvider($type)
    {
        self::getProviderWorldslot($type);
        Notification::make()
            ->title('Sucesso')
            ->body('Provedores Carregados com sucesso')
            ->success()
            ->send();
    }


    /**
     * @return void
     */
    public function loadGames()
    {
        self::getGamesWorldslot();
        Notification::make()
            ->title('Sucesso')
            ->body('Jogos Carregados com sucesso')
            ->success()
            ->send();
    }




    /**
     * @return void
     */

    public function loadProviderEvergame()
    {
        self::getProviderEvergame();
        Notification::make()
            ->title('Sucesso')
            ->body('Provedores Carregados com sucesso')
            ->success()
            ->send();
    }


    /**
     * @return void
     */
    public function loadGamesEvergame()
    {
        self::getGamesEvergame();
        Notification::make()
            ->title('Sucesso')
            ->body('Jogos Carregados com sucesso')
            ->success()
            ->send();
    }
    /**
     * @return void
     */

    public function loadProviderDrakon()
    {
        self::getDrakonProvider();
        Notification::make()
            ->title('Sucesso')
            ->body('Provedores Carregados com sucesso')
            ->success()
            ->send();
    }


    /**
     * @return void
     */
    public function loadGamesDrakon()
    {
        self::getDrakonGames();
        Notification::make()
            ->title('Sucesso')
            ->body('Jogos Carregados com sucesso')
            ->success()
            ->send();
    }

    /**
     * @return void
     */

    public function loadProviderPlayConnect()
    {
        self::getPlayConnectProvider();
        Notification::make()
            ->title('Sucesso')
            ->body('Provedores Carregados com sucesso')
            ->success()
            ->send();
    }


    /**
     * @return void
     */
    public function loadGamesPlayConnect()
    {
        self::getPlayConnectGames();
        Notification::make()
            ->title('Sucesso')
            ->body('Jogos Carregados com sucesso')
            ->success()
            ->send();
    }



    public function upload()
    {

    }

    /**
     * @param array $data
     * @return array
     */
    protected function mutateFormDataBeforeCreate(array $data): array
    {

        return $data;
    }

    /**
     * @param Form $form
     * @return Form
     */
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Atualização')
                    ->description('Carregue aqui seu arquivo de atualização no formato zip')
                    ->schema([
                        FileUpload::make('update')
                    ])

            ])
            ->statePath('data');
    }

    /**
     * @return void
     */
    public function runMigrate()
    {
        if (env('APP_DEMO')) {
            Notification::make()
                ->title('Atenção')
                ->body('Você não pode realizar está alteração na versão demo')
                ->danger()
                ->send();
            return;
        }

        // Executar o comando Artisan para rodar as migrations
        Artisan::call('migrate');

        // Você também pode adicionar a opção '--seed' para rodar os seeders, se necessário
        // Artisan::call('migrate --seed');

        // Obter a saída do comando, se necessário
        $this->output = Artisan::output();
        Notification::make()
            ->title('Sucesso')
            ->body('Migrações carregadas com sucesso')
            ->success()
            ->send();
    }

    /**
     * @return void
     */
    public function runMigrateWithSeed()
    {
        if (env('APP_DEMO')) {
            Notification::make()
                ->title('Atenção')
                ->body('Você não pode realizar está alteração na versão demo')
                ->danger()
                ->send();
            return;
        }

        // Executar o comando Artisan para rodar as migrations
        Artisan::call('migrate --seed');

        // Você também pode adicionar a opção '--seed' para rodar os seeders, se necessário
        // Artisan::call('migrate --seed');

        // Obter a saída do comando, se necessário
        $this->output = Artisan::output();
        Notification::make()
            ->title('Sucesso')
            ->body('Migrações carregadas com sucesso')
            ->success()
            ->send();
    }
}