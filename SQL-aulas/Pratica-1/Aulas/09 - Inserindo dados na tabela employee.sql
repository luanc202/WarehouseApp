-- SQLite
-- Inserir dados na tabela de emplyoees com chave estrangeira

INSERT INTO EMPLOYEES (NAME, LASTNAME, EMAIL, PASSWORD, POSITION_ID, STREET_ADDRESS, CITY, STATE, ZIP)
VALUES ('John', 'Doe', 'johndoe@email.com', 'qwed1223d', 1, 'Rua 1', 'São Paulo', 'SP', '12345-678'),
  ('Silvana', 'Gomes', 'silvana@email.com', 'fdsq2v423gh', 1, 'Rua das Flores', 'Sorocaba', 'SP', '12145-678'),
  ('Maria', 'Duarte', 'mariad@email.com', 'asvr23423532', 2, 'Rua dos Cravos', 'São Paulo', 'SP', '12325-678');

SELECT * FROM EMPLOYEES;

SELECT * FROM POSITIONS;