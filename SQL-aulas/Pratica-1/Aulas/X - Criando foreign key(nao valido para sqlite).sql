-- SQLite
-- Alterar a tabela de Funcionários, e adicionar um novo campo

ALTER TABLE EMPLOYEES ADD POSITION_ID INTEGER:

-- Definir um relacionamento de chave estrangeira com a tabela de Positions
ALTER TABLE EMPLOYEES ADD CONSTRAINT FK_POSITION_ID 
  FOREIGN KEY (POSITION_ID) REFERENCES POSITIONS (ID);

  