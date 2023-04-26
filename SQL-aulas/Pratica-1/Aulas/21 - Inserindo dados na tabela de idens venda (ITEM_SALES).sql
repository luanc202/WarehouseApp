-- SQLite
-- Inserindo dados na tabela de itens venda (ITEM_SALES)

INSERT INTO ITEM_SALES (SALE_ID, PRODUCT_ID, QTD, SUBTOTAL)
  VALUES(1, 1, 1, 299.00),
  (2, 4, 1, 5999.99),
  (3, 5, 2, 25.80),
  (4, 6, 2, 799.80),
  (5, 7, 1, 2244.99),
  (6, 4, 1, 5999.99),
  (6, 2, 1, 199.9);


SELECT * FROM PRODUCTS;
SELECT * FROM ITEM_SALES;