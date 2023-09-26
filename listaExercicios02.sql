-- Uno
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN 
  SELECT Nome, Sobrenome FROM Autor;
END;
//

DELIMITER ;
CALL sp_ListarAutores();

-- Dois
DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN p_Categoria VARCHAR(100))
BEGIN
    SELECT titulo FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_Categoria);
END
//
DELIMITER ;
CALL sp_LivrosPorCategoria("Romance");
CALL sp_LivrosPorCategoria("Autoajuda");
CALL sp_LivrosPorCategoria("Ficção Científica");
