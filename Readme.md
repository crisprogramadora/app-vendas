Passos da criação

1 - Docker compose;

2 - Arquivo schema para colocar os comando de criação do BD;

3 - Arquivo dump para colocar os comandos CRUD;

4 - Terminal = npm init para criar o package.json(preenchi apenas description, o restante apenas enter). Obs: se colocar npm init -y, não precisa preencher nada, é criado o package com dados padrão, se quiser alterar alguma coisa nele é só entrar no arquivo e alterar;

5 - Instalei a biblioteca Jest para fazer testes automatizados. Terminal: npm install -D jest
Obs: o -D é para instalar apenas no projeto em tempo de desenvolvimento;

6 - Criei um arquivo soma.js para fazer um teste, para ver se o jest está funcionando(function soma(numero1, numero2) {
return numero1 + numero2
}
module.exports = soma;

7 - Criei o arquivo soma.test.js, para rodar o comando(const soma = require('./soma');

test('soma dois números positivos', () => {
expect(soma(2, 3)).toBe(5);
}) );

8 - terminal = npx jest

9 - terminal = git init

10 - criar o arquivo .gitignore e colocar a pasta node_modules

11 - terminal = git add . e git commit -m "inicialização do docker compose, criação do banco de dados e instalação do Jest".

Posso agrupar testes: no arquivo soma.test:
const soma = require('./soma');

describe('Função soma', () => {

    test('soma dois números positivos', () => {
        expect(soma(2, 3)).toBe(5);
    });

    test('soma número positivo e negativo', () => {
        expect(soma(5, -2)).toBe(3);
    });

});

12 - criar servidor usando o Express(para fazer requisições HTTP)

- Terminal: npm install express;
- na pasta src, criar o arquivo api.ts(servidor);

- terminal = npm install -D typescript ts-node
  npx tsc --init(configura o typescript)
  npm install -D @types/express

  - tsconfig.json
    {
    "compilerOptions": {
    "rootDir": "src",
    "outDir": "dist",
    "module": "commonjs",
    "esModuleInterop": true,
    "target": "es2020",
    "types": [],
    "sourceMap": true,
    "declaration": true,
    "declarationMap": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "strict": true,
    "jsx": "react-jsx",
    "verbatimModuleSyntax": null,
    "isolatedModules": true,
    "noUncheckedSideEffectImports": true,
    "moduleDetection": "force",
    "skipLibCheck": true,
    }
    }

- terminal:
  npm install -D nodemon(evita ter que matar o servidor toda vez que faz uma alteração no código)

- package.json

  "type": "commonjs",
  "main": "dist/index.js",
  "scripts": {
  "dev": "nodemon --exec ts-node src/servidor.ts",
  "start": "node dist/servidor.js",
  "build": "tsc"

- npm install dotenv(biblioteca que lê e
  configura as variáveis de ambiente)

- na raiz do projeto, fora da pasta src:
  criar arquivo .env(para armazenar as variáveis de ambiente) e colocá-lo no gitignore:
  PORT=3000

\*\*\* no arquivo api.ts (servidor)

- No terminal = para rodar o servidor npm run dev

- Abre a extensão Postman do VS code = http://localhost:3000

13 - src criar arquivo controladores.ts
\*\*\*controladores.ts

14 - src criar arquivo intermediários.ts
\*\*\*intermediários.ts
