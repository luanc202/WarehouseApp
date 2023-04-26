-- SQLite
-- Cirando tabela de Cargos

CREATE TABLE POSITIONS (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    DESCRIPTION VARCHAR(200) NOT NULL
);

-- Inserindo dados na tabela de Positions

INSERT INTO POSITIONS (DESCRIPTION)
VALUES ('Gerente'), ('Vendedor'), ('Desenvolvedor');

SELECT * FROM POSITIONS;