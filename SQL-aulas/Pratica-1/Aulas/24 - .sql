-- SQLite
-- Funções de Agregação

-- Consultando o produto com maior preço
SELECT ID AS 'Código', DESCRIPTION AS 'Descrição', MAX(PRICE) AS 'Maior preço' FROM PRODUCTS;

-- Consultando o produto com menor preço
SELECT ID AS 'Código', DESCRIPTION AS 'Descrição', MIN(PRICE) AS 'Maior preço' FROM PRODUCTS;

-- Consultando a quantidade de produtos
SELECT COUNT(ID) AS 'Quantidade de produtos' FROM PRODUCTS;

-- Calculando o preço médio dos produtos
SELECT AVG(PRICE) AS 'Preço médio' FROM PRODUCTS;

-- Calculando o total do campo PRICE dos produtos
SELECT SUM(PRICE) AS 'Total' FROM PRODUCTS;