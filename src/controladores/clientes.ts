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

export function listar (req: Request, res: Response) {
    return res.status(200).json(clientes)
}

export function detalhar (req: Request, res: Response) {
    const { id } = req.params
    
    const cliente = clientes.find((item) => {
        return item.id === Number(id)
    })

     if (!cliente) {
        return res.status(404).json({
            mensagem: 'Cliente não encontrado'
        })
    }    
    return res.status(200).json(cliente)
}

export function cadastrar(req: Request, res: Response) {
    const { nome } = req.body

    const novoCliente = {
        id: clientes.length + 1,
        nome
    }
    clientes.push(novoCliente)

    return res.status(201).json(novoCliente)
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
