import { Router } from "express";
import { intermediario, intermediarioGeral } from "./intermediarios";
import { buscarClientesQuery, clientesPorId, listar } from "./controladores/clientes";

const rotas = Router()

rotas.use(intermediarioGeral)

rotas.get('/clientes', intermediario, listar)

rotas.get('/clientes/:id', clientesPorId)

rotas.get('/clientes', buscarClientesQuery)

export default rotas
 