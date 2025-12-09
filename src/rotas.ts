import { Router } from "express";
import { intermediario, intermediarioGeral } from "./intermediarios";
import { buscarClientesQuery, cadastrar, detalhar, listar } from "./controladores/clientes";

const rotas = Router()

// rotas.use(intermediarioGeral)

rotas.get('/clientes', listar)

rotas.get('/clientes/:id', detalhar)

rotas.post('/clientes', cadastrar)

rotas.get('/clientes', buscarClientesQuery)

export default rotas
 