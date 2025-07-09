# Casa Chinesa - Projeto Laravel

## Instruções de Instalação

### Pré-requisitos
- PHP 8.3 ou superior
- Composer
- Node.js e npm
- MySQL

### Instalação

1. **Instalar dependências PHP:**
   ```bash
   composer install
   ```

2. **Instalar dependências Node.js:**
   ```bash
   npm install
   ```

3. **Configurar ambiente:**
   - Copie o arquivo `.env` e configure as credenciais do banco de dados MySQL
   - Configure: DB_CONNECTION=mysql, DB_DATABASE=chinesa_db, DB_USERNAME=root, DB_PASSWORD=password

4. **Criar banco de dados:**
   ```bash
   mysql -u root -p -e "CREATE DATABASE chinesa_db;"
   ```

5. **Importar dados do banco:**
   ```bash
   mysql -u root -p chinesa_db < database/platform.sql
   ```

6. **Gerar chave da aplicação:**
   ```bash
   php artisan key:generate
   ```

7. **Construir assets (opcional):**
   ```bash
   npm run build
   ```

8. **Iniciar servidor de desenvolvimento:**
   ```bash
   php artisan serve
   ```

### Dados Inclusos
- **1 usuário** cadastrado no sistema
- **101 jogos** configurados
- **Configurações** da plataforma "OndaGames Chinesa"
- **Banners e promoções** configurados

### Observações
- O projeto foi verificado e limpo de possíveis vulnerabilidades
- Todas as migrações foram corrigidas para compatibilidade com MySQL
- O banco de dados está populado com dados reais do sistema original
- Acesse `/admin` para o painel administrativo Filament

### Estrutura do Projeto
- **Backend:** Laravel 10 com Filament Admin Panel
- **Frontend:** Blade templates com Vite
- **Banco de dados:** MySQL com dados completos
- **Recursos:** Sistema de jogos, carteira digital, afiliados, baús, missões e VIP

