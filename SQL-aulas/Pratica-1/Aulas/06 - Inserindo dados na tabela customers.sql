-- SQLite

-- Inserir dados na tabela Customers
INSERT INTO CUSTOMERS (NAME, LASTNAME, EMAIL, STREET_ADDRESS, CITY, STATE, ZIP)
  VALUES ('Caio', 'Pinheiro', 'caio@mail.com', 'Avenida Guararapes, 36', 'Recife', 'PE', 50000000);

-- Consultando todos os clientes da tabela CUSTOMERS
SELECT * FROM CUSTOMERS;

-- Inserindo múltiplos registros na tabela CUSTOMERS
INSERT INTO CUSTOMERS (NAME, LASTNAME, EMAIL, STREET_ADDRESS, CITY, STATE, ZIP)
  VALUES ('Antônio', 'Gomes', 'antono@mail.com', 'Rua Falcão, 18', 'São Paulo', 'SP', 06530700),
        ('Caio', 'Pinheiro', 'caio@mail.com', 'Avenida Guararapes, 36', 'Recife', 'PE', 50000000),
         ('Maria', 'Silva', 'maria@mail.com', 'Avenida Pastor Lima', 'Rio de Janeiro', 'RJ', 20000000),
          ('João', 'Silva', 'joao@mail.com', 'Edifício Comercial Matos', 'Rio de Janeiro', 'RJ', 20000000);