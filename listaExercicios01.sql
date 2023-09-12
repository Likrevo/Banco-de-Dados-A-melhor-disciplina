SELECT titulo FROM livros;

-- Second
SELECT nome FROM autores WHERE nascimento <= '1900-01-01';

-- Third
SELECT titulo, autor_id, nome FROM livros l 
JOIN autores a ON a.id = l.autor_id WHERE a.nome = 'J.K. Rowling';

-- Fourth
SELECT aluno_id, nome, curso FROM alunos a
LEFT JOIN matriculas m ON m.id  = a.id WHERE curso = "Engenharia de Software";
