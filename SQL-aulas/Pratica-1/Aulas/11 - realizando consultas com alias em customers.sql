-- SQLite
-- Realizando consultas com o SELECT

-- Consultando todos os clientes da tabela CUSTOMERS
SELECT * FROM CUSTOMERS;

-- Consultando os nomes e emails de todos os clientes
SELECT EMAIL, NAME FROM CUSTOMERS;

-- Utilizando o recurso de ALIAS para alterar a exibição da colunas
SELECT ID AS 'Código do Cliente',
NAME AS 'Nome',
LASTNAME AS 'Sobrenome' FROM CUSTOMERS;

-- Inserindo novo cliente
INSERT INTO CUSTOMERS (NAME, LASTNAME, EMAIL, STREET_ADDRESS, CITY, STATE, ZIP)
  VALUES ('Carlos', 'Roberto', 'carlobe@mail.com', 'Rua Lopes, 11', 'Cajamar', 'SP', 06530700);

-- Consultando os clientes que moram em Cajamar
SELECT ID AS 'Código', NAME AS 'Nome', LASTNAME AS 'Sobrenome'
FROM CUSTOMERS WHERE CITY = 'Cajamar' OR CITY = 'São Paulo';