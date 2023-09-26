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

-- Tres
DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN p_Categoria VARCHAR(100))
BEGIN
    SELECT Categoria_ID AS Id_Da_Categoria, COUNT(*) AS Quantidade_De_Livros FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria WHERE Nome = p_categoria) 
    GROUP BY Categoria_ID ORDER BY COUNT(Categoria_ID);
END
//
DELIMITER ;
CALL sp_ContarLivrosPorCategoria("Autoajuda");

-- Cuatro

-- Cinco
DELIMITER //
CREATE PROCEDURE sp_LivrosAteAno(IN p_lpano INT)
  BEGIN
    SELECT Titulo, Ano_Publicacao FROM Livro
    WHERE Ano_Publicacao <= p_lpano;
  END
//
DELIMITER ; 
CALL sp_LivrosAteAno(2004);

-- Seis
DELIMITER //
CREATE PROCEDURE sp_TitulosPorCategoria (IN p_Categoria VARCHAR(100))
BEGIN
    SELECT titulo FROM Livro 
    WHERE Categoria_ID = (SELECT Categoria_ID FROM Categoria 
    WHERE Nome = p_Categoria);
END
//
DELIMITER ;
CALL ssp_TitulosPorCategoria("Ficção Científica");

-- Siete

-- Ocho
DELIMITER //

CREATE PROCEDURE EncontrarAutorMaisAntigo()
BEGIN
    SELECT nome, Sobrenome
    FROM Autor
    WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM Autor);
END 
//
DELIMITER ;
CALL EncontrarAutorMaisAntigo();

-- Nueve
DELIMITER //
-- A cláusula DELIMITER define o delimitador para a definição da sp.
-- No caso, estamos usando "//" como delimitador em vez do padrão ";" para permitir múltiplas instruções.

CREATE PROCEDURE sp_ListarAutores()
BEGIN 
  -- CREATE PROCEDURE cria uma nova stored procedure chamada "sp_ListarAutores".

  -- BEGIN inicia o código da stored procedure.

  SELECT Nome, Sobrenome FROM Autor;
  -- Esta é a parte principal da sp.
  -- É uma instrução SQL que seleciona os campos "Nome" e "Sobrenome" da tabela "Autor".

END;
-- END marca o final do código da procedure.

//
-- Isso encerra a definição da sp usando o delimitador personalizado "//".
-- Após a definição da sp, você pode restaurar o delimitador padrão usando "DELIMITER ;".

-- Diez
DELIMITER //
CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
    FROM Livro
    JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID;
END //
DELIMITER ;
CALL sp_LivrosESeusAutores();
