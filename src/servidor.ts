import 'dotenv/config'
import express from 'express'

const servidor = express()

const clientes = [
    { id: 1, nome: 'Cliente A' },
    { id: 2, nome: 'Cliente B' },
    { id: 3, nome: 'Cliente C' }
];

servidor.get('/clientes', (req, res) => {
    console.log(clientes)
    return res.send('Servidor online')
})

servidor.get('/clientes/:id', (req, res) => {
    const { id } = req.params
    const cliente = clientes.find((cliente) => {
        return cliente.id === Number(id)
    })

    if (!cliente) {
        return res.send('Cliente não encontrado')
    }
    
    return res.send(cliente)
})

servidor.listen(process.env.PORT)

