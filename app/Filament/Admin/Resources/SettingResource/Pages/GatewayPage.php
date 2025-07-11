<?php

namespace App\Filament\Admin\Resources\SettingResource\Pages;

use App\Filament\Admin\Resources\SettingResource;
use App\Models\Setting;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use App\Models\AproveSaveSetting;

class GatewayPage extends Page implements HasForms
{
    use HasPageSidebar, InteractsWithForms;

    protected static string $resource = SettingResource::class;

    protected static string $view = 'filament.resources.setting-resource.pages.gateway-page';

    /**
     * @return string|Htmlable
     */
    public function getTitle(): string|Htmlable
    {
        return 'Gateways';
    }

    public Setting $record;
    public ?array $data = [];

    /**
     * @dev @anonymous
     * @param Model $record
     * @return bool
     */
    public static function canView(Model $record): bool
    {
        return auth()->user()->hasRole('admin');
    }

    /**
     * @dev anonymous - Meu instagram
     * @return void
     */
    public function mount(): void
    {
        $setting = Setting::first();
        $this->record = $setting;
        $this->form->fill($setting->toArray());
    }

    /**
     * @dev anonymous - Meu instagram
     * @return void
     */
    public function save()
    {
        try {
            if (env('APP_DEMO')) {
                Notification::make()
                    ->title('Atenção')
                    ->body('Você não pode realizar está alteração na versão demo')
                    ->danger()
                    ->send();
                return;
            }

            // Verificação da senha
            $approvalSettings = AproveSaveSetting::first();
            $inputPassword = $this->data['approval_password_save'] ?? '';

            if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                Notification::make()
                    ->title('Erro de Autenticação')
                    ->body('Senha incorreta. Por favor, tente novamente.')
                    ->danger()
                    ->send();
                return;
            }

            $setting = Setting::find($this->record->id);

            if ($setting->update($this->data)) {
                Cache::put('setting', $setting);

                Notification::make()
                    ->title('Dados alterados')
                    ->body('Dados alterados com sucesso!')
                    ->success()
                    ->send();

               // redirect(route('filament.admin.resources.settings.payment', ['record' => $this->record->id]));

            }
        } catch (Halt $exception) {
            return;
        }
    }

    private function getSectionStyle(string $color): array
    {
        return [
            'style' => "background: linear-gradient(135deg, rgba({$color}, 0.1) 0%, rgba({$color}, 0.2) 100%);
                      border-left: 4px solid rgb({$color});
                      border-radius: 8px;
                      padding: 1.5rem;"
        ];
    }

    /**
     * @dev anonymous - Meu instagram
     * @param Form $form
     * @return Form
     */
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Gateways')
                    ->description('Ativa ou desative seus gateway de Pagamento')
                    ->schema([
                        Select::make('default_gateway')
                            ->label('Gateway Padrão para Saque')
                            ->options([                               
                                'suitpay' => 'Suitpay',                                
                                'bspay' => 'BR Master Pay',
                                'digitopay' => 'Digitopay',
                                'ezzepay' => 'Ezzepay',
                            ])->columnSpanFull(),
                        Toggle::make('suitpay_is_enable')
                            ->label('SuitPay Ativo'),                            
                        Toggle::make('bspay_is_enable')
                            ->label('BR Master Pay Ativo'),
                        Toggle::make('digitopay_is_enable')
                            ->label('DigitoPay Ativo'),
                        Toggle::make('ezzepay_is_enable')
                            ->label('EzzePay Ativo'),
                    ])->columns(2)
                    ->extraAttributes($this->getSectionStyle('59, 130, 246')), // Azul

                Section::make('Digite a senha de confirmação')
                    ->description('Obrigatório digitar sua senha de confirmação!')
                    ->schema([
                        TextInput::make('approval_password_save')
                            ->label('Senha de Aprovação')
                            ->password()
                            ->required()
                            ->helperText('Digite a senha para salvar as alterações.')
                            ->maxLength(191),
                    ])->columns(3)
                    ->extraAttributes($this->getSectionStyle('239, 68, 68')) // Vermelho
            ])
            ->statePath('data');
    }
}