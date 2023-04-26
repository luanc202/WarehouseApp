-- SQLite
-- Inserindo dados na tabela de Vendas

INSERT INTO SALES (CUSTOMER_ID, EMPLOYEE_ID, DATE_SALE, TOTAL, DESCRIPTION)
  VALUES (5, 1, '2022-01-01', 299.90, 'Pagamento via PIX'),
  (8, 2, '2022-03-12', 5999.99, 'Pagamento via Cartão'),
  (9, 3, '2022-03-15', 25.80, 'Pagamento via Cartão'),
  (7, 3, '2022-03-15', 799.80, 'Pagamento via Cartão'),
  (5, 2, '2022-03-25', 2244.99, 'Pagamento via PIX');

INSERT INTO SALES (CUSTOMER_ID, EMPLOYEE_ID, DATE_SALE, TOTAL, DESCRIPTION)
  VALUES (8, 2, '2022-03-19', 6199.98, 'Pagamento via Cartão');

SELECT * FROM SALES;

SELECT * FROM EMPLOYEES;