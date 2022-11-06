CREATE DATABASE produto_pedido
GO
USE produto_pedido
GO

CREATE TABLE produto(
codigo				INT				NOT NULL,
nome				VARCHAR(25)		NOT NULL,
valorUnitario		DECIMAL(7,2)	NOT NULL,
qtdEstoque			INT				NOT NULL,
descricao			VARCHAR(25)		NOT NULL,
fornecedor_codigo	INT				NOT NULL
PRIMARY KEY(codigo),
FOREIGN KEY(fornecedor_codigo) REFERENCES fornecedor(codigo))
GO
CREATE TABLE fornecedor(
codigo				INT				NOT NULL,
nome				VARCHAR(25)		NOT NULL,
atividade			VARCHAR(25)		NOT NULL,
telefone			INT				NOT NULL
PRIMARY KEY(codigo))
GO
CREATE TABLE cliente(
codigo				INT				NOT NULL,
nome				VARCHAR(25)		NOT NULL,
logradouro			VARCHAR(25)		NOT NULL,
num					INT				NOT NULL,
telefone			INT				NOT NULL,
data_nasc			DATETIME		NOT NULL
PRIMARY KEY(codigo))
GO
CREATE TABLE pedido(
codigo				INT				NOT NULL,
cliente_codigo		INT				NOT NULL,
produto_codigo		INT				NOT NULL,
qtd					INT				NOT NULL,
previsaoEntrega		DATETIME		NOT NULL
FOREIGN KEY(cliente_codigo) REFERENCES cliente(codigo),
FOREIGN KEY(produto_codigo) REFERENCES produto(codigo))

INSERT INTO fornecedor VALUES
(1001,	'Estrela',	'Brinquedo',	41525898),
(1002,	'Lacta',	'Chocolate',	42698596),
(1003,	'Asus',	'Informática',	52014596),
(1004,	'Tramontina',	'Utensílios Domésticos',	50563985),
(1005,	'Grow',	'Brinquedos',	47896325),
(1006,	'Mattel',	'Bonecos',	59865898)


INSERT INTO produto VALUES
(1,	'Banco Imobiliário',	65.00,	15,	'Versão Super Luxo',	1001),
(2,	'Puzzle 5000 peças',	50.00,	5,	'Mapas Mundo',	1005),
(3,	'Faqueiro',	350.00,	0,	'120 peças',	1004),
(4,	'Jogo para churrasco',	75.00,	3,	'7 peças',	1004),
(5,	'Tablet',	750.00,	29,	'Tablet',	1003),
(6,	'Detetive',	49.00,	0,	'Nova Versão do Jogo',	1001),
(7,	'Chocolate com Paçoquinha',	6.00,	0,	'Barra',	1002),
(8,	'Galak',	5.00,	65,	'Barra',	1002)

INSERT INTO cliente VALUES
(33601,	'Maria Clara',	'R. 1° de Abril',	870,	96325874,	'2000-08-15'),
(33602,	'Alberto Souza',	'R. XV de Novembro',	987,	95873625,	'1985-02-02'),
(33603,	'Sonia Silva',	'R. Voluntários da Pátria',	1151,	75418596,	'1957-08-23'),
(33604,	'José Sobrinho',	'Av. Paulista',	250,	85236547,	'1986-12-09'),
(33605,	'Carlos Camargo',	'Av. Tiquatira',	9652,	75896325,	'1971-03-25')

INSERT INTO pedido VALUES
(99001,	33601,	1,	1,	'2012-06-07'),
(99001,	33601,	2,	1,	'2012-06-07'),
(99001,	33601,	8,	3,	'2012-06-07'),
(99002,	33602,	2,	1,	'2012-06-09'),
(99002,	33602,	4,	3,	'2012-06-09'),
(99003,	33605,	5,	1,	'2012-06-15')

SELECT pe.qtd, pr.valorUnitario, (pr.valorUnitario * pe.qtd) AS valor_total
FROM pedido pe, cliente cl, produto pr
WHERE pe.cliente_codigo = cl.codigo
		AND pr.codigo = pe.produto_codigo
			AND cl.nome = 'Maria Clara'


SELECT pr.nome FROM fornecedor fo, produto pr
WHERE fo.codigo = pr.fornecedor_codigo
		AND fo.atividade = 'Brinquedo'

UPDATE produto
SET valorUnitario = valorUnitario * 0.90
WHERE descricao = 'Barra'

UPDATE produto
SET qtdEstoque = 10
WHERE nome = 'Faqueiro'

SELECT nome FROM cliente
WHERE DATEDIFF(YEAR, data_nasc, GETDATE()) > 40

SELECT nome, telefone FROM fornecedor
WHERE atividade = 'Brinquedo' 
		OR atividade = 'Chocolate'

SELECT nome,
CASE WHEN valorUnitario < 50.00
THEN (valorUnitario * 0.75)
END as desconto
FROM produto
WHERE valorUnitario < 50.00

SELECT nome,
CASE WHEN valorUnitario > 100.00
THEN valorUnitario * 1.10
END AS aumento
FROM produto
WHERE valorUnitario > 100.00

SELECT pr.valorUnitario * 0.85 AS desconto FROM pedido pe, produto pr
WHERE pr.codigo = pe.produto_codigo
		AND pe.codigo = 99001

SELECT DISTINCT pe.codigo, cl.nome, DATEDIFF(YEAR, data_nasc, GETDATE()) AS idade
FROM pedido pe, cliente cl
WHERE pe.cliente_codigo = cl.codigo
























