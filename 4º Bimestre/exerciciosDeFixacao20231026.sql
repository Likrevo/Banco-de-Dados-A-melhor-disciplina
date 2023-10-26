--EX01
CREATE TRIGGER trg_depois_inserir_clientes 
AFTER INSERT ON Clientes
FOR EACH ROW INSERT INTO Auditoria(mensagem)
VALUES("Novo cliente adicionado");
