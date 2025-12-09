import { NextFunction, Request, Response } from "express"

export const intermediario = (req: Request, res: Response, next: NextFunction) => {
    console.log('Passei pelo intermediário')

    if(req.params.nome === 'sair') {
        return res.send('A requisição foi respondida no intermediário, antes de chegar no controlador')
    }

    next()
}

export const intermediarioGeral = (req: Request, res: Response, next: NextFunction) => {
    console.log('Passou no intermediario geral')

    next()
}