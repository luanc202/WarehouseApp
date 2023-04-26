-- SQLite
-- Excluindo dados da tabela CUSTOMERS
DELETE FROM CUSTOMERS;

-- Excluindo todos os registros que não possuem email
DELETE FROM CUSTOMERS WHERE EMAIL IS NULL;

-- Excluindo o cliente de ID 6
DELETE FROM CUSTOMERS WHERE ID = 6;

SELECT * FROM CUSTOMERS;