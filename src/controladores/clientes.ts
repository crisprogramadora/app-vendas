import { Request, Response } from "express";


type TClientes = {
    id: number
    nome: string
}

const clientes: TClientes []= [
    { id: 1, nome: 'Cliente A' },
    { id: 2, nome: 'Cliente B' },
    { id: 3, nome: 'Cliente C' }
    
]

export const listar = (req: Request, res: Response) => {
    return res.status(200).json(clientes)
}

export const clientesPorId = (req: Request, res: Response) => {
    const { id } = req.params
    const cliente = clientes.find((cliente) => {
        return cliente.id === Number(id)
    })

     if (!cliente) {
        return res.send('Cliente não encontrado')
    }
    
    return res.send(cliente)
}

export const buscarClientesQuery = (req: Request, res: Response) => {
    const { nome } = req.query
// no postman colocar  /clientes/buscar?nome=Cliente A
    if(!nome) {
        return res.send('parâmetro não encontrado')
    }

    const cliente = clientes.find ((cliente) => {
        return cliente.nome === nome
    })

    if (!cliente) {
        return res.send('Cliente não encontrado')
    } 
    return res.send(cliente)
}
