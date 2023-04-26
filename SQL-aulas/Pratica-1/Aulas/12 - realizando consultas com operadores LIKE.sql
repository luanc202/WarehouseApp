-- SQLite
-- Criando consultas com operador like

-- Consultando clientes que possuem a letra C no início do nome
SELECT * FROM CUSTOMERS WHERE NAME LIKE 'C%';

SELECT * FROM CUSTOMERS WHERE NAME LIKE '%s';

SELECT * FROM CUSTOMERS WHERE NAME LIKE '%r%';

SELECT * FROM CUSTOMERS WHERE NAME LIKE '__a%';