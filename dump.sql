INSERT INTO
    "Clientes" (
        id,
        nome,
        telefone
    )
VALUES
    (1, 'Maggie England', '43985-3644'),
    (2, 'Reuben Perry', '24225-7866'),
    (3, 'Cruz Pruitt', '58588-8597'),
    (4, 'September Russo', '10680-9575'),
    (5, 'Carter Bishop', '38321-7980'),
    (6, 'Aimee Lindsay', '52847-2831'),
    (7, 'Minerva Barber', '23457-1662'),
    (8, 'Aiko Hoffman', '43366-7176'),
    (9, 'Alden Gregory', '34453-1732'),
    (10, 'Seth Watkins', '71561-2934');

INSERT INTO
    "Fiadores" (id_cliente, nome, telefone)
VALUES
    (1, 'Neil Mcmahon', '69858-5184'),
    (2, 'Hanna Rhodes', '58867-6939'),
    (3, 'Patrick Soto', '46795-0281'),
    (4, 'Alfonso Marsh', '56692-6144'),
    (5, 'Emmanuel Holden', '34029-9733'),
    (6, 'Leah Gross', '63386-5563'),
    (7, 'Rina Santiago', '27533-1366'),
    (8, 'Mari Martin', '38831-5637'),
    (9, 'Nadine Diaz', '68645-4437'),
    (10, 'Quamar Joseph', '28803-9715');

INSERT INTO
    "Veiculo" (id_cliente, marca_modelo, cor, placa)
VALUES
    (1, 'Fiat Palio', 'cinza', 'WTP4888'),
    (2, 'Fiat Mobi', 'vermelho', 'OGM8828'),
    (3, 'Toyota Etios', 'prata', 'FXP4679'),
    (4, 'Honda Fit', 'preto', 'DPS7259'),
    (5, 'Honda CG 150', 'preto', 'MCF3336'),
    (6, 'Honda CG 160', 'vermelho', 'MJK8747'),
    (7, 'Honda CG 125', 'cinza', 'QHJ3178'),
    (8, 'Honda CG 160', 'prata', 'FQB2861'),
    (9, 'Yamaha YBR 150', 'preto', 'FYI7714'),
    (10, 'Yamaha YBR 125', 'preto', 'NMQ9716');

INSERT INTO
    "Contratos" (
        id_cliente,
        modalidade,
        vencimento,
        valor_parcela,
        total_parcelas,
        saldo_devedor
    )
VALUES
    (1, 'semanal', 'segunda', 235.00, 0, 0),
    (2, 'mensal', 10, 415.00, 40, 50000.00),
    (3, 'mensal', 22, 540.00, 85, 65000.00),
    (4, 'mensal', 13, 360.00, 70, 70000.00),
    (5, 'semanal', 'sábado', 320.00, 0, 0),
    (6, 'semanal', 'quarta', 450.00, 0, 0),
    (7, 'mensal', 9, 570.00, 64, 65000.00),
    (8, 'mensal', 24, 700.00, 93, 90000.00),
    (9, 'semanal', 'segunda', 520.00, 0, 0),
    (10, 'mensal', 24, 640.00, 59, 65000.00);

INSERT INTO
    "Historico_pagamentos" (
        id_contrato,
        data_pagamento,
        juros,
        valor_pago,
        referencia
    )
VALUES
    (
        1,
        '2025-11-20',
        0,
        110.00,
        'Pagamento semanal parcial'
    ),
    (
        2,
        '2025-11-20',
        0,
        300.00,
        'Pagamento Parcial parcela 30'
    ),
    (3, '2025-12-02', 0, 540.00, 'Parcela 15'),
    (4, '2025-12-02', 0, 360.00, 'Parcela 18'),
    (
        1,
        '2025-1-22',
        0,
        125.00,
        'Restante Pagamento semanal'
    ),
    (5, '2025-12-02', 0, 320.00, 'Pagamento semanal'),
    (
        2,
        '2025-11-25',
        0,
        115.00,
        'Restante Pagamento parcela 30'
    ),
    (4, '2026-01-02', 0, 360.00, 'Parcela 19'),
    (9, '2025-12-02', 0, 520.00, 'Pagamento semanal'),
    (6, '2025-12-02', 0, 450.00, 'Pagamento semanal');

INSERT INTO
    "Historico_pagamentos" (
        id_contrato,
        data_pagamento,
        juros,
        valor_pago,
        referencia
    )
VALUES
    (1, '2025-11-27', 0, 235.00, 'Pagamento semanal'),
    (
        2,
        '2025-12-20',
        0,
        415.00,
        'Pagamento parcela 31'
    ),
    (3, '2026-01-02', 0, 540.00, 'Parcela 16');

-- inserir um novo registro
INSERT INTO
    "Clientes" (id, nome, telefone)
VALUES
    (11, 'Annie England', '43984-3644'),
    (12, 'John Perry', '24227-7866');

-- atualizar um registro
UPDATE
    "Historico_pagamentos"
SET
    data_pagamento = '2025-11-22'
WHERE
    id_transacao = 5;

-- atualizar vários registros de uma vez
UPDATE
    "Contratos"
SET
    saldo_devedor = '0.00'
WHERE
    saldo_devedor is null;

-- deletar um registro
DELETE from
    "Historico_pagamentos"
WHERE
    id_transacao = 13;