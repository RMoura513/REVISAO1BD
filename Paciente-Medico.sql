CREATE DATABASE paciente_medico
GO
USE paciente_medico
GO

CREATE TABLE paciente(
cpf				VARCHAR(11)				NOT NULL,
nome			VARCHAR(20)		NOT NULL,
rua				VARCHAR(20)		NOT NULL,
num				INT				NOT NULL,
bairro			VARCHAR(20)		NOT NULL,
telefone		INT				NULL,
data_nasc		DATETIME		NOT NULL
PRIMARY KEY(cpf))
GO
CREATE TABLE medico(
codigo			INT				NOT NULL,
nome			VARCHAR(20)		NOT NULL,
especialidade	VARCHAR(20)		NOT NULL
PRIMARY KEY(codigo))
GO
CREATE TABLE pontuario(
data_pontuario	DATETIME		NOT NULL,
paciente_cpf	VARCHAR(11)		NOT NULL,
medico_codigo	INT				NOT NULL,
diagnostico		VARCHAR(25)		NOT NULL,
medicamento		VARCHAR(20)		NOT NULL
PRIMARY KEY(data_pontuario),
FOREIGN KEY(paciente_cpf) REFERENCES paciente(cpf),
FOREIGN KEY(medico_codigo) REFERENCES medico(codigo))


INSERT INTO paciente VALUES
(35454562890, 'José Rubens', 'Campos Salles', 2750, 'Centro', 21450998, '1954-10-18'),
(29865439810, 'Ana Claudia', 'Sete de Setembro', 178, 'Centro', 97382764, '1960-05-29'),
(82176534800, 'Marcos Aurélio',	'Timóteo Penteado',	236, 'Vila Galvão', 68172651, '1980-09-24'),
(12386758770, 'Maria Rita',	'Castello Branco', 7765, 'Vila Rosália', NULL, '1975-03-30'),
(92173458910, 'Joana de Souza',	'XV de Novembro', 298,	'Centro', 21276578,	'1944-04-24')

INSERT INTO medico VALUES
(1, 'Wilson Cesar', 'Pediatra'),
(2, 'Marcia Matos', 'Geriatra'),
(3, 'Carolina Oliveira', 'Ortopedista'),
(4, 'Vinicius Araujo', 'Clinico Geral')

INSERT INTO pontuario VALUES

('2020-09-10', 35454562890,	2, 'Reumatismo', 'Celebra'),
('2020-09-11', 92173458910,	2, 'Renite', 'Alérgica	Allegra'),
('2020-09-12', 29865439810,	1, 'Inflamação de garganta', 'Nimesulida'),
('2020-09-13', 35454562890,	2, 'H1N1', 'Tamiflu'),
('2020-09-14', 82176534800,	4, 'Gripe',	'Resprin'),
('2020-09-15', 12386758770,	3,	'Braço Quebrado', 'Dorflex + Gesso')


SELECT nome, rua + ' ' + rua + ' ' + CAST(num AS CHAR(5)) + ' ' + bairro AS endereco_completo FROM paciente
WHERE DATEDIFF(YEAR, data_nasc, GETDATE()) > 50
       

SELECT especialidade FROM medico
WHERE nome LIKE '%Carolina%'

SELECT medicamento FROM pontuario
WHERE diagnostico = 'Reumatismo'

SELECT po.diagnostico, po.medicamento FROM paciente pa, pontuario po
WHERE pa.cpf = po.paciente_cpf
		AND pa.nome = 'José Rubens'

SELECT DISTINCT me.nome, SUBSTRING(me.especialidade, 1, 3) + '.' AS especialidade  FROM medico me, paciente pa, pontuario po
WHERE pa.cpf = po.paciente_cpf
		AND me.codigo = po.medico_codigo
			AND pa.nome = 'José Rubens'

SELECT DISTINCT SUBSTRING(pa.cpf, 1, 3) + '.' + SUBSTRING(pa.cpf, 3, 3) + '.'  + SUBSTRING(pa.cpf, 6, 3) + '-'  + SUBSTRING(pa.cpf, 9, 2) AS cpf,
pa.nome, rua + ' ' + pa.rua + ' ' + CAST(pa.num AS CHAR(5)) + ' ' + pa.bairro AS endereco_completo,
CASE WHEN telefone IS NULL
THEN '-'
ELSE CAST(telefone AS VARCHAR(8))
END as telefone
FROM pontuario po, paciente pa, medico me
WHERE me.codigo = po.medico_codigo
		AND pa.cpf = po.paciente_cpf
			AND me.nome LIKE '%Vinicius%'

SELECT DATEDIFF(DAY, po.data_pontuario, GETDATE()) AS dias FROM paciente pa, pontuario po
WHERE pa.cpf = po.paciente_cpf
		AND pa.nome LIKE '%Maria%'

UPDATE paciente
SET telefone = 98345621
WHERE nome = 'Maria Rita'

UPDATE paciente
SET rua = 'Voluntários da Pátria'
WHERE nome = 'Joana de Souza'

UPDATE paciente
SET num = 1980
WHERE nome = 'Joana de Souza'

UPDATE paciente
SET bairro = 'Jd. Aeroporto'
WHERE nome = 'Joana de Souza'

