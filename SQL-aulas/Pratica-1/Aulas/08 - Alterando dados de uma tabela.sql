-- SQLite

-- Alterando os dados da coluna EMAIL para letras maiúsculas
UPDATE CUSTOMERS SET EMAIL = UPPER(EMAIL);

-- Alterando o sobrenome do cliente ID 5
UPDATE CUSTOMERS SET LASTNAME = 'Malheiros Duarte' WHERE ID = 5;