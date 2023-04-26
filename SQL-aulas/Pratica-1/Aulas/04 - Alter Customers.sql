-- SQLite

-- Alterando a tabela Customers
-- Adicionar uma coluna date_of_birth
ALTER TABLE CUSTOMERS ADD DATE_OF_BIRTH DATE;

-- Renomeando a coluna date_of_birth para date_birthday
ALTER TABLE CUSTOMERS RENAME COLUMN DATE_OF_BIRTH TO DATE_BIRTHDAY;

-- Excluindo a coluna date_birthday da tabela Customers
ALTER TABLE CUSTOMERS DROP COLUMN DATE_BIRTHDAY;