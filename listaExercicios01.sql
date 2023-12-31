SELECT titulo FROM livros;

-- Second
SELECT nome FROM autores WHERE nascimento <= '1900-01-01';

-- Third
SELECT titulo, autor_id, nome FROM livros l 
JOIN autores a ON a.id = l.autor_id WHERE a.nome = 'J.K. Rowling';

-- Fourth
SELECT aluno_id, nome, curso FROM alunos a
LEFT JOIN matriculas m ON m.id  = a.id WHERE curso = "Engenharia de Software";

-- Fifth
SELECT produto, SUM(receita) AS receita_total FROM vendas 
GROUP BY produto;

-- Sixth
SELECT nome, COUNT(autor_id) AS num_total_l_a FROM livros l 
JOIN autores a ON a.id = l.autor_id GROUP BY nome;

-- Seventh
SELECT curso, COUNT(a.id) AS quant_alunos FROM alunos a
JOIN matriculas m ON m.id = a.id GROUP BY curso;

-- Eighth
SELECT produto, AVG(receita) AS med_receita_prod FROM vendas
GROUP BY produto;

-- Ninth
CREATE VIEW receita_total AS 
SELECT produto, SUM(receita) AS receita_t_sup FROM vendas
GROUP BY produto;
SELECT * FROM receita_total WHERE receita_t_sup >= "10000.00";

-- Tenth
CREATE VIEW quant_livros AS
SELECT nome, COUNT(autor_id) AS total_l_a FROM livros l
JOIN autores a ON a.id = l.autor_id
GROUP BY nome;
SELECT * FROM quant_livros where total_l_a >= 2;

-- Eleventh
CREATE VIEW livros_e_autores AS
SELECT titulo, nome FROM livros l 
JOIN autores a ON a.id = l.autor_id;
SELECT * FROM livros_e_autores;

-- Não sei falar esse inglês mas é o 12
CREATE VIEW a_cu AS
SELECT nome, curso FROM alunos a
RIGHT JOIN matriculas m ON m.id = a.id;
SELECT * FROM a_cu;

-- Thirteenth eu acho
SELECT nome, titulo FROM autores a
LEFT JOIN livros l ON a.id = l.autor_id;

-- Fourteenth se o de cima estiver certo
SELECT nome, curso FROM alunos a
RIGHT JOIN matriculas m ON m.id = a.id;

-- Fifteenth
SELECT nome, curso FROM alunos a
INNER JOIN matriculas m ON m.id = a.id;

-- Sixteenth
SELECT nome AS nome_autor, COUNT(livros.id) AS quant_livros FROM autores 
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.id 
ORDER BY quant_livros 
DESC LIMIT 1;

-- Seventeenth
SELECT produto, SUM(receita) AS soma_rec FROM vendas 
GROUP BY produto HAVING sum(receita) = (
    SELECT min(total_da_receita FROM (
        SELECT produto, sum(receita) AS total_da_receita FROM vendas 
        GROUP BY produto 
    ) AS receita_por_produto
);

-- Nineteenth
SELECT alunos.id AS Aluno_ID, alunos.nome 
AS Nome_Aluno, COUNT(matriculas.id) 
AS Numero_de_Matriculas FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.id, alunos.nome;

-- Twentieth? Acabou o Telecurso 3000
SELECT produto, COUNT(produto) AS transaciones FROM vendas 
GROUP BY produto
ORDER BY transaciones
DESC LIMIT 1;
