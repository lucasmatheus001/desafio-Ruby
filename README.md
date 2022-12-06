# Bem-vindo(a) ao BizConsult!

<h4 align="center"> 🚧 BizConsult Em construção... 🚧 </h4>

### Pré-requisitos 

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas: [Git](https://git-scm.com), [Node.js](https://nodejs.org/en/), [Yarn](https://yarnpkg.com/), [Ruby On Rails](https://guides.rubyonrails.org/getting_started.html) e [PostgreSQL](https://www.postgresql.org/) . Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/).

## Resumo

Este é uma sistema para gerenciamento de um banco, onde você consegue realizar todas as operações que conseguiria realizar em um caixa , como: depósito, saque, transferência, extrato e a própria consulta a aplicação.

## O que foi utilizado até o momento?

 1. Rails 7
 2. Yarn 1.22.4
 3. Node 16.22.4
 4. PostgreSQL
 5. Bootstrap 5.2.3
 6. Devise
 7. Enum
 8. Testes(Rspec, simpleCov, FactoryBot, Faker)
 9 . Pundit
 
## Principais funcionalidades

 - [x] Cadastro de usuário (perfil padrão *read*);
 - [x] Login;
 - [x] CRUD de usuários ;
 - [x] CRUD de Accounts (*admin*);
 - [x] realizar depósito ;
 - [x] realizar saque ;
 - [x] realizar Transferência ;
 - [x] Consultar Extrato por data de início e fim ;
 - [x] Visualizar Saldo;
 - [x] Validações em Transferência;

## Pendências

 - [x] Documentação geral do sistema (README);
 - [x] melhorar as seeds
 - [x] melhorar os testes
 - [x] regras de negócios
 - [ ] Aplicar corretamente a internacionalização na aplicação;
 - [x] Implementação do CRUD de usuário;

## Instalando o projeto

Altere as credenciais do banco em `config/database.yml`, em desenvolvimento e test já estão definidas as seguintes configurações:

 - Host: localhost
 - Porta: 5432
 - Usuário: `DATABASE_USER`
 - Senha: `DATABASE_PASSWORD`
 - Databases: *desafio_Ruby_development* e *desafio_Ruby_test*

Para executar o projeto localmente, execute os seguintes comandos:

    git clone git@github.com:lucasmatheus001/desafio-Ruby.git
    cd desafio-Ruby
    bundle install
    yarn install
    rails db:create
    rails db:migrate
    rails db:seed (para popular o banco de dados)

Serão cadastrados alguns Usuários e contas de banco para exemplificação . Credencias de acesso:

  - E-mail: jhonnydepp@gmail.com | senha: 123456
  - E-mail: tomhanks@gmail.com" | senha: 123456

## Executando o projeto
Depois de instalar o projeto, execute os seguintes comandos:

    cd desafio-Ruby
    rails s ou bin/dev

Abra seu navegador e acesse http://localhost:3000/

A seguinte página será exibida:

![Tela de Login da aplicação](https://imgur.com/DFE7pxx.png)

![Tela de Login da aplicação](https://imgur.com/g3BqxZl.gif)

Acesse o sistema com um dos usuários abaixo ou se preferir acesse a opção cadastrar e faça o cadastro de um novo usuário .
 - E-mail: jhonnydepp@gmail.com | senha: 123456
 - E-mail: tomhanks@gmail.com" | senha: 123456
 
 
Por fim, a tela inicial do sistema fala um pouco sobre aplicação e os servições oferecidos . Na parte de Dashboard o cliente consegue ver os dados referents a sua conta e realizar operações no menu interativo, como (saque,transferência, depósito, editar perfil).


## Executando testes

    
    rails db:migrate RAILS_ENV=test (executa as migration pra criar os models para testes)
    rspec 
Será gerado as migration dos models dos testes existentes e em seguida alguns testes serão rodados.
    
