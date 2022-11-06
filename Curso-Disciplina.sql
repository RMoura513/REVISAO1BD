CREATE DATABASE curso_disciplina
GO
USE curso_disciplina
GO

CREATE TABLE aluno(
ra			INT				NOT NULL,
nome		VARCHAR(15)		NOT NULL,
sobrenome	VARCHAR(15)		NOT NULL,
rua			VARCHAR(30)		NOT NULL,
num			INT				NOT NULL,
bairro		VARCHAR(30)		NOT NULL,
cep			INT				NOT NULL,
telefone	INT				NULL
PRIMARY KEY(ra))
GO
CREATE TABLE curso(
codigo		INT				NOT NULL,
nome		VARCHAR(20)		NOT NULL,
carga_hora	INT				NOT NULL,
turno		VARCHAR(10)		NOT NULL
PRIMARY KEY(codigo))
GO
CREATE TABLE disciplina(
codigo		INT				NOT NULL,
nome		VARCHAR(20)		NOT NULL,
carga_hora	INT				NOT NULL,
turno		VARCHAR(10)		NOT NULL,
semestre	INT				NOT NULL
PRIMARY KEY(codigo))

INSERT INTO aluno VALUES
(12345, 'Jos�', 'Silva', 'Almirante Noronha', 236, 'Jardim S�o Paulo', 1589000, 69875287),
(12346, 'Ana', 'Maria Bastos', 'Anhaia', 1568, 'Barra Funda', 3569000, 25698526),
(12347, 'Mario', 'Santos', 'XV de Novembro', 1841, 'Centro', 1020030, NULL),
(12348, 'Marcia', 'Neves', 'Volunt�rios da P�tria', 225, 'Santana', 2785090, 78964152)

INSERT INTO curso VALUES
(1, 'Inform�tica', 2800, 'Tarde'),
(2, 'Inform�tica', 2800, 'Noite'),
(3, 'Log�stica', 2650, 'Tarde'),
(4, 'Log�stica', 2650, 'Noite'),
(5, 'Pl�sticos', 2500, 'Tarde'),
(6, 'Pl�sticos', 2500, 'Noite')

INSERT INTO disciplina VALUES
(1, 'Inform�tica', 4, 'Tarde', 1),
(2, 'Inform�tica', 4, 'Noite', 1),
(3, 'Qu�mica', 4, 'Tarde', 1),
(4, 'Qu�mica', 4, 'Noite', 1),
(5, 'Banco de Dados I', 2, 'Tarde', 3),
(6, 'Banco de Dados I', 2, 'Noite', 3),
(7, 'Estrutura de Dados', 4, 'Tarde', 4),
(8, 'Estrutura de Dados', 4, 'Noite', 4)


SELECT nome + ' ' + sobrenome AS nome_completo FROM aluno

SELECT rua + ' ' + CAST(num AS CHAR(5)) + ' ' + bairro + CAST(cep AS CHAR(8)) AS endereco FROM aluno
WHERE telefone IS NULL

SELECT telefone FROM aluno
WHERE ra = 12348

SELECT nome, turno FROM curso
WHERE carga_hora = 2800

SELECT semestre FROM disciplina
WHERE nome = 'Banco de Dados I'
		AND turno = 'Noite'



