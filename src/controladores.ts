import express = require('express')

const clientes = [
    { id: 1, nome: 'Cliente A' },
    { id: 2, nome: 'Cliente B' },
    { id: 3, nome: 'Cliente C' }
];

export const listaClientes = (req: express.Request, res: express.Response) => {
    console.log(clientes)
    return res.send('Servidor online')
}

export const clientesPorId = (req: express.Request, res: express.Response) => {
    const { id } = req.params
    const cliente = clientes.find((cliente) => {
        return cliente.id === Number(id)
    })

     if (!cliente) {
        return res.send('Cliente não encontrado')
    }
    
    return res.send(cliente)
}

export const buscarClientesQuery = (req: express.Request, res: express.Response) => {
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
