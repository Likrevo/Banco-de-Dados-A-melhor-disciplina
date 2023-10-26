--EX01
CREATE TRIGGER trg_depois_inserir_clientes 
AFTER INSERT ON Clientes
FOR EACH ROW INSERT INTO Auditoria(mensagem)
VALUES("Novo cliente adicionado");

--EX02
CREATE TRIGGER trg_antes_excluir_clientes 
BEFORE DELETE ON Clientes
FOR EACH ROW INSERT INTO Auditoria(mensagem)
VALUES("Cliente excluido");
