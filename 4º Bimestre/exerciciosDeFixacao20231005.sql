DELIMITER //

CREATE FUNCTION total_livros_por_genero(p_genero VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE livro_genero VARCHAR(255);
    DECLARE cursor_livros CURSOR FOR
    SELECT genero
    FROM Livros;

    OPEN cursor_livros;
    FETCH NEXT FROM cursor_livros INTO livro_genero;
    WHILE @@FETCH_STATUS = 0 DO
        IF livro_genero = p_genero THEN
            SET total = total + 1;
        END IF;
        FETCH NEXT FROM cursor_livros INTO livro_genero;
    END WHILE;

    CLOSE cursor_livros;

    RETURN total;
END;
//

DELIMITER ;

-- 2

DELIMITER //
CREATE FUNCTION listar_livros_por_autor(p_primeiro_nome VARCHAR(255), p_ultimo_nome VARCHAR(255))
RETURNS TEXT
BEGIN
    DECLARE lista_livros TEXT DEFAULT '';

    SELECT GROUP_CONCAT(Livro.titulo SEPARATOR ', ')
    INTO lista_livros
    FROM Livro
    JOIN Livro_Autor ON Livro_Autor.livro_id = Livro.id
    JOIN Autor ON Livro_Autor.autor_id = Autor.id
    WHERE Autor.primeiro_nome = p_primeiro_nome AND Autor.ultimo_nome = p_ultimo_nome;

    RETURN lista_livros;
END;
//
DELIMITER ;

-- 3

DELIMITER //
CREATE FUNCTION atualizar_resumos()
BEGIN
    UPDATE Livro
    SET resumo = CONCAT(resumo, ' Este é um excelente livro!');
END;
//
DELIMITER ;

-- 4

DELIMITER //
CREATE FUNCTION media_livros_por_editora()
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE media DECIMAL(10, 2);

    SELECT AVG(num_livros) INTO media
    FROM (
        SELECT editora, COUNT(*) AS num_livros
        FROM Livros
        GROUP BY editora
    ) AS subquery;

    RETURN media;
END;
//
DELIMITER ;

-- 5

DELIMITER //
CREATE FUNCTION autores_sem_livros()
RETURNS TEXT
BEGIN
    DECLARE lista_autores TEXT DEFAULT '';

    SELECT GROUP_CONCAT(CONCAT(primeiro_nome, ' ', ultimo_nome) SEPARATOR ', ')
    INTO lista_autores
    FROM Autor
    WHERE id NOT IN (SELECT DISTINCT autor_id FROM Livro_Autor);

    RETURN lista_autores;
END;
//
DELIMITER ;
