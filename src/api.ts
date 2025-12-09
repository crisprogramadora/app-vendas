import 'dotenv/config'
import Express = require('express')
import controladores = require('./controladores')
import { intermediario, intermediarioGeral } from './intermediarios'

const app = Express()

app.use(Express.json())

app.use(intermediarioGeral)

app.get('/clientes', intermediario, controladores.listaClientes)

app.get('/clientes/:id', controladores.clientesPorId)

app.get('/clientes', controladores.buscarClientesQuery)

app.listen(process.env.PORT)

