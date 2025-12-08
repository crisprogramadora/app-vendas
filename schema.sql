CREATE DATABASE app_vendas;

DROP TABLE IF EXISTS "Clientes";

CREATE TABLE "Clientes" (
    id SERIAL PRIMARY KEY,
    nome varchar(255) NOT NULL,
    telefone varchar(12) NOT NULL
);

DROP TABLE IF EXISTS "Fiadores";

CREATE TABLE "Fiadores" (
    id SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES "Clientes" (id),
    nome varchar(255) NOT NULL,
    telefone varchar(12) NOT NULL
);

DROP TABLE IF EXISTS "Veiculo";

CREATE TABLE "Veiculo" (
    id SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES "Clientes" (id),
    marca_modelo varchar(255) NOT NULL,
    cor varchar(12) default NULL,
    placa varchar(7)
);

DROP TABLE IF EXISTS "Contratos";

CREATE TABLE "Contratos" (
    id SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES "Clientes" (id),
    modalidade VARCHAR(15) NOT NULL,
    vencimento varchar(8) NOT NULL,
    valor_parcela NUMERIC(10, 2) NOT NULL,
    total_parcelas INTEGER default NULL,
    saldo_devedor NUMERIC(10, 2) default NULL
);

DROP TABLE IF EXISTS "Status_operacao";

CREATE TABLE "Status_operacao" (
    id SERIAL PRIMARY KEY,
    valor_pago NUMERIC(10, 2),
    operacao VARCHAR(20),
    usuario VARCHAR(50),
    status_antigo VARCHAR(50),
    status_novo VARCHAR(50)
);

DROP TABLE IF EXISTS "Historico_pagamentos";

CREATE TABLE "Historico_pagamentos" (
    id_transacao SERIAL PRIMARY KEY,
    id_contrato INTEGER REFERENCES "Contratos" (id),
    data_pagamento DATE NOT NULL DEFAULT CURRENT_DATE,
    juros NUMERIC(8, 2) DEFAULT 0.00,
    valor_pago NUMERIC(10, 2) NOT NULL,
    referencia VARCHAR(50)
);

-- CREATE
-- OR REPLACE FUNCTION atualizar_saldo_devedor() RETURNS TRIGGER AS $ $ BEGIN
-- UPDATE
--   "Pagamentos"
-- SET
--   saldo_devedor = saldo_devedor - (NEW.valor_pago - NEW.juros)
-- WHERE
--   id = NEW.id_pagamento;
-- RETURN NEW;
-- END;
-- $ $ LANGUAGE plpgsql;
-- CREATE
-- OR REPLACE FUNCTION auditar_historico_pagamentos() RETURNS TRIGGER AS $ $ DECLARE consInsertingConstant VARCHAR(20) := 'INSERT';
-- consUpdatingConstant VARCHAR(20) := 'UPDATE';
-- status_antigo_txt VARCHAR(50);
-- status_novo_txt VARCHAR(50);
-- BEGIN IF TG_OP = 'UPDATE' THEN status_antigo_txt := CASE
--   WHEN OLD.ativo THEN 'ATIVO'
--   ELSE 'INATIVO'
-- END;
-- ELSE status_antigo_txt := NULL;
-- END IF;
-- status_novo_txt := CASE
--   WHEN NEW.ativo THEN 'ATIVO'
--   ELSE 'INATIVO'
-- END;
-- INSERT INTO
--   "Status_operacao" (
--     valor_pago,
--     operacao,
--     usuario,
--     status_antigo,
--     status_novo
--   )
-- VALUES
--   (
--     NEW.valor_pago,
--     CASE
--       WHEN TG_OP = 'INSERT' THEN consInsertingConstant
--       ELSE consUpdatingConstant
--     END,
--     SESSION_USER,
--     status_antigo_txt,
--     status_novo_txt
--   );
-- RETURN NEW;
-- EXCEPTION
-- WHEN OTHERS THEN RAISE NOTICE 'AUDITORIA FALHOU. COD: %, MSG: %',
-- SQLSTATE,
-- SQLERRM;
-- RAISE;
-- END;
-- $ $ LANGUAGE plpgsql;
-- CREATE TRIGGER tr_atualizar_saldo
-- AFTER
-- INSERT
--   ON "Historico_pagamentos" FOR EACH ROW EXECUTE FUNCTION atualizar_saldo_devedor();
-- CREATE TRIGGER tr_auditar_pagamentos
-- AFTER
-- INSERT
--   OR
-- UPDATE
--   ON "Historico_pagamentos" FOR EACH ROW EXECUTE FUNCTION auditar_historico_pagamentos();