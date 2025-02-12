[![JavaScript](https://img.shields.io/badge/-JavaScript-%23F7DF1E?logo=javascript&logoColor=%23000)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Cucumber](https://img.shields.io/badge/-Cucumber-%2332CD32?logo=cucumber&logoColor=%23FFF)](https://cucumber.io/)
[![Dotenv](https://img.shields.io/badge/-Dotenv-%23A0A0A0?logo=dotenv&logoColor=%23FFF)](https://github.com/motdotla/dotenv)
[![Supertest](https://img.shields.io/badge/-Supertest-%23FF69B4?logo=supertest&logoColor=%23FFF)](https://github.com/visionmedia/supertest)
[![Superagent](https://img.shields.io/badge/-Superagent-%2339C5C0?logo=superagent&logoColor=%23FFF)](https://github.com/visionmedia/superagent)
[![Chai](https://img.shields.io/badge/-Chai-%23F39C12?logo=chai&logoColor=%23FFF)](https://www.chaijs.com/)

# CNseg - RNPA Auto
Testes no domínio de serviços RNPA Auto V2:

### Setup

#### 1 - Setup inicial
Configuração do ambiente, instalar:

```
  node >= 18.20.4 
```

Pode-se utilizar o gerenciador de sua preferência, mas como recomandação, faça a instalação pelo o NVM. Tutorial de instalção do [Node.js](https://nodejs.org/en/download/package-manager).

#### 2 - Instalar as extensões no Visual Studio Code

- [Cucumber Autocomplete](https://marketplace.visualstudio.com/items?itemName=alexkrechik.cucumberautocomplete)
- [VScode ESlint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Gherkin Align Table](https://marketplace.visualstudio.com/items?itemName=AlanCole.gherkintablealign)

#### 3 - Clone o projeto 'cnseg-tst-rnpa-auto-v2'

```
git clone git@bitbucket.org:afonso_moreira/cnseg-tst-rnpa-auto-v2.git
```

#### 4 - Instalar dependências
Para instalar as dependências do projeto, execute o seguinte comando:
```
npm install
```

#### Execução dos testes
#### 1 - Acesse a raiz do projeto
```
cd /cnseg-tst-rnpa-auto-v2
```
#### 2 - Execute os testes por ambiente
As variáveis de ambiente estão configuradas por meio da dependência dotenv. Por isso, para facilitar na hora de executar e depurar os testes, utilize os scripts de teste dispovíveis no `package.json`.

Os ambientes disponíveis para o projeto são:
```
  Ambiente local: npm run local
  Ambiente de desenvolvimento: npm run dev
  Ambiente de homologação: npm run hmlg
```
Pode ser desejado realizar uma execução por tag do Cucumber também. Para isso defina o valor da variável TAGS com a tag desejada, antes de executar os scripts citados anteriormente. Exemplo:
```
TAGS=@regressao npm run dev
```
Geração de relatório do cucumber em html após os testes:
```
npm run generate-report
```
Para visualizar, basta abrir o relatório gerado no diretório `/report`
#### 3 - Execução por tag @regressao
```
@regressao - execução de todos os testes no ambiente de testing - cenários de sucesso e falhas. (Caso não informado na variável de ambiente será executado a tag @regressao como default)
@e2e - execução dos testes end-to-end.
@ignore - não executa o cenário com esta tag.
```
### Depuração dos testes com VS Code
#### Debug pelo Visual Studio Code:
```
  1. Abrir a view "Run", por meio do menu `View > Run` (também é possível acessá-la por meio do atalho `Ctrl + Shift + D`).
  2. Com a view "Run" aberta, selecionar a configuração "Run Script: debug" (cujas definições encontram-se em `.vscode/lauch.js`).
  3. Clicar no botão "Start Debugging" (por padrão, o script de debug irá executar os cenários anotados com a tag @debug no ambiente de testing, para   alterar essas configurações basta editar o script "debug" no `package.json`).
```
**Lembrete:** Antes de subir um commit para o repositório, lembre-se de remover as tags usadas para a depuração.
#### Debug pelo Terminal JS do Visual Studio Code:
```
  1. Abrir o terminal do VS Code e selecionar a aba "TERMINAL"
  2. Clicar no menu "+v" no topo do lado direito (Launch profile)
  3. Selecionar o terminal JavaScript Debug Terminal
  4. Executar o debug com o comando: ENV=dev TAGS=@regressao npm run debug
```
**Obs:** O parâmetro ENV e TAGS são opcionais, por padrão o ENV sempre será sempre o ambiente de desemvolvimento e a TAGS será debug.
