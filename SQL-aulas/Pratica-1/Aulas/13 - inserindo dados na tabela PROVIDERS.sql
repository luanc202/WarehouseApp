-- SQLite
-- Inserindo dados na tabela Providers (Fornecedores)

INSERT INTO PROVIDERS (NAME, REGISTER_NUMBER, EMAIL, STREET_ADDRESS, CITY, STATE, ZIP)
    VALUES ('Microsoft', '26,261.109/0001-40', 'contato@microsoft.com', 'Rua Raimundo da Silva 28', 'São Paulo', 'SP', '01234567'),
    ('Multilaser', '22,241.129/0001-45', 'contato@multilsaser.com', 'Av. Faria Lima 28', 'São Paulo', 'SP', '07734767'),
    ('Apple', '21,221.159/0001-41', 'contato@apple.com', 'Av. Roque Petro 21', 'São Paulo', 'SP', '04736867');

SELECT * FROM PROVIDERS;