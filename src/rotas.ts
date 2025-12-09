import { Router } from "express";
import { intermediario, intermediarioGeral } from "./intermediarios";
import { buscarClientesQuery, detalhar, listar } from "./controladores/clientes";

const rotas = Router()

// rotas.use(intermediarioGeral)

rotas.get('/clientes', listar)

rotas.get('/clientes/:id', detalhar)

rotas.get('/clientes', buscarClientesQuery)

export default rotas
 