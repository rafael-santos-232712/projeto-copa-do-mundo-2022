# projeto-copa-do-mundo-2022

Criar um novo arquivo
* Criar Repositorio
* Criar Codspace
* Criar pasta Back/Front
* Instalar rails (gem install rails)
* Criar App Backend(rails new NOME_DA_APLICAÇÃO --skip-git)
* Gerar scafolld 
* Resolveu bug do controller
* Colocar para funcionar
* Cadastrar scaffold time (rails g scaffold)
* Cadastrar scaffold Jogador fazendo ligação da tabela (belong_to: 'nome tabela')
* Testar para ver se estar funcionando
* Criar Tabela Partidas integrando a tabela times(rails g scaffold match team_house:belongs_to team_outside:belongs_to  )


Criando Frontend

*node -v
*npm -v

* Criar aplicação vue para o frontend:

![alt](/img-1.png)


* Instalar dependencias do Vue (cd pasta frontend/ npm install/ iniciar servidor(npm run dev)
* Ibstalar bootstrap-vue-next
    * Instalar biblioteca: npm i -S bootstrap bootstrap-vue-next
    * Importar em arquivo `main.js`
```js
//....

import BootstrapVueNext from 'bootstrap-vue-next'

import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-next/dist/bootstrap-vue-next.css'

const app = createApp(App)

app.use(BootstrapVueNext)

//....
```