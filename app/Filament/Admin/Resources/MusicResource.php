<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\MusicResource\Pages;
use App\Models\Music;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use App\Models\AproveSaveSetting;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\TextInput;

class MusicResource extends Resource
{
    protected static ?string $model = Music::class;

 //   protected static ?string $navigationIcon = 'heroicon-o-musical-note';
    protected static ?string $navigationLabel = 'Todas as Musicas';

    protected static ?string $modelLabel = 'Todas as Musicas';

    /**
     * @dev @anonymous
     * @return bool
     */
    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public static function form(Form $form): Form
    {
       return $form
    ->schema([
        Forms\Components\Section::make()
            ->description('')
            ->schema([
                Forms\Components\TextInput::make('Nome da música que vai aparecer pros usuários')
                    ->required()
                    ->maxLength(255),
                Forms\Components\FileUpload::make('path')
                    ->label('Envia Sua Música Aqui')
                    ->disk('public') // ou o disco que você configurou no seu config/filesystems.php
                    ->directory('music')
                    ->required()
                    ->acceptedFileTypes(['audio/mp3', 'audio/mpeg']) // Aceitar ambos os tipos de arquivo .mp3
                    ->helperText('Envie apenas arquivos no formato .mp3 !'), // Atualizar texto de ajuda
            ])->columns(2),
        
        // Seção separada para a senha de aprovação
        Forms\Components\Section::make('Senha de confirmação de Alterações')
            ->description('Digite sua senha de aprovação para confirmar as mudanças.')
            ->schema([
                Forms\Components\TextInput::make('approval_password_save')
                    ->label('Senha de Aprovação')
                    ->password()
                    ->required()
                    ->helperText('Digite a senha para salvar as alterações.')
                    ->maxLength(191),
            ])->columns(2),
    ]);


    }

    /**
     * @param Table $table
     * @return Table
     */
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('path')->label('File Path'),
                Tables\Columns\TextColumn::make('created_at')->dateTime(),
                Tables\Columns\TextColumn::make('updated_at')->dateTime(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->modalHeading('Confirme a exclusão em massa')
                        ->modalSubheading('Por favor, insira sua senha para confirmar a exclusão em massa.')
                        ->modalButton('Excluir Selecionados')
                        ->form([
                            TextInput::make('approval_password_bulk_delete')
                                ->password()
                                ->required()
                                ->label('Senha de Aprovação')
                                ->helperText('Digite a senha de aprovação para confirmar a exclusão em massa.')
                        ])
                        ->action(function ($records, array $data) {
                            // Verificação da senha
                            $approvalSettings = AproveSaveSetting::first();
                            $inputPassword = $data['approval_password_bulk_delete'] ?? '';

                            if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                                Notification::make()
                                    ->title('Erro de Autenticação')
                                    ->body('Senha incorreta. Por favor, tente novamente.')
                                    ->danger()
                                    ->send();
                                return;
                            }

                            // Exclui os registros selecionados se a senha estiver correta
                            foreach ($records as $record) {
                                $record->delete();
                            }

                            Notification::make()
                                ->title('Registros Excluídos')
                                ->body('Os registros selecionados foram excluídos com sucesso.')
                                ->success()
                                ->send();
                        }),
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMusic::route('/'),
            'create' => Pages\CreateMusic::route('/create'),
            'edit' => Pages\EditMusic::route('/{record}/edit'),
        ];
    }
}
