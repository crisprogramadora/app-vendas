import type { Request, Response } from 'express';

const clientes = [
    { id: 1, nome: 'Cliente A' },
    { id: 2, nome: 'Cliente B' },
    { id: 3, nome: 'Cliente C' }
];

export const listaClientes =  (req: Request, res: Response) => {
    console.log(req.query);
    return res.send('clientes localizados')
}

//     const cliente = clientes.find((cliente) => {
//         return cliente.id === id
//     })

//     if (!cliente) {
//     return res.send('Cliente não encontrado')
//     }

//     return res.send(cliente)
// }