CREATE DATABASE cliente_produto
GO
USE cliente_produto
GO



CREATE TABLE cliente(
cpf			VARCHAR(11)		NOT NULL,
nome		VARCHAR(20)	NOT NULL,
telefone	INT			NOT NULL
PRIMARY KEY(cpf))
GO
CREATE TABLE produto(
codigo			INT				NOT NULL,
descricao		VARCHAR(50)		NOT NULL,
fornecedor_id	INT				NOT NULL,
preco			DECIMAL(7,2)	NOT NULL
PRIMARY KEY(codigo),
FOREIGN KEY(fornecedor_id) REFERENCES fornecedor(id))
GO
CREATE TABLE fornecedor(
id				INT				NOT NULL,
nome			VARCHAR(20)		NOT NULL,
logradouro		VARCHAR(25)		NOT NULL,
num				INT				NOT NULL,
complemento		VARCHAR(20)		NOT NULL,
cidade			VARCHAR(15)		NOT NULL
PRIMARY KEY(id))
GO
CREATE TABLE venda(
codigo			INT				NOT NULL,
produto_codigo	INT				NOT NULL,
cliente_cpf		VARCHAR(11)		NOT NULL,
qtd				INT				NOT NULL,
valorTotal		DECIMAL(7,2)	NOT NULL,
data_venda		DATETIME		NOT NULL
FOREIGN KEY(produto_codigo) REFERENCES produto(codigo),
FOREIGN KEY(cliente_cpf) REFERENCES cliente(cpf))


INSERT INTO cliente VALUES
(34578909290, 'Julio Cesar', 82736541),
(25186533710, 'Maria Antonia', 87652314),
(87627315416, 'Luiz Carlos', 61289012),
(79182639800, 'Paulo Cesar', 90765273)

INSERT INTO fornecedor VALUES
(1, 'LG	Rod.', 'Bandeirantes',	70000, 'Km 70', 'Itapeva'),
(2,	'Asus',	'Av. Nações Unidas',	10206, 'Sala 225', 'São Paulo'),
(3,	'AMD',	'Av. Nações Unidas',	10206, 'Sala 1095', 'São Paulo'),
(4,	'Leadership',	'Av. Nações Unidas',	10206, 'Sala 87', 'São Paulo'),
(5,	'Inno', 'Av. Nações Unidas',	10206, 'Sala 34', 'São Paulo')

INSERT INTO produto VALUES
(1,	'Monitor 19 pol.', 1, 449.99),
(2,	'Netbook 1GB Ram 4 Gb HD', 2, 699.99),
(3,	'Gravador de DVD - Sata', 1, 99.99),
(4,	'Leitor de CD', 1, 49.99),
(5,	'Processador - Phenom X3 - 2.1GHz',	3, 349.99),
(6, 'Mouse', 4, 19.99),
(7,	'Teclado', 4, 25.99),
(8,	'Placa de Video - Nvidia 9800 GTX - 256MB/256 bits', 5, 599.99)

INSERT INTO venda VALUES
(1, 1, '25186533710', 1, 449.99, '2009-09-03'),
(1,	4, '25186533710', 1, 49.99, '2009-09-03'),
(1,	5, '25186533710', 1, 349.99, '2009-09-03'),
(2,	6, '79182639800', 4, 79.96, '2009-09-06'),
(3,	8, '87627315416', 1, 599.99, '2009-09-06'),
(3,	3, '87627315416', 1, 99.99, '2009-09-6'),
(3,	7, '87627315416', 1, 25.99, '2009-09-06'),
(4, 2, '34578909290', 2, 1399.98, '2009-08-09')


SELECT CONVERT(CHAR(10), data_venda, 103) as data_venda FROM venda
WHERE codigo = 4

ALTER TABLE fornecedor
ADD telefone			INT			NULL

UPDATE fornecedor
SET telefone = 72165371
WHERE id = 1

UPDATE fornecedor
SET telefone = 87153738
WHERE id = 2

UPDATE fornecedor
SET telefone = 36546289
WHERE id = 4

SELECT nome, logradouro + ' ' + CAST(num AS CHAR(5)) + ' ' + complemento + ' '
+ cidade AS endereco_completo, telefone
FROM fornecedor
ORDER BY nome ASC

SELECT DISTINCT pr.descricao, ve.qtd, ve.valorTotal FROM venda ve, produto pr, cliente cl
WHERE ve.cliente_cpf = cl.cpf
		AND ve.produto_codigo = pr.codigo
			AND cl.nome = 'Julio Cesar'

SELECT DISTINCT CONVERT(CHAR(10), ve.data_venda, 103) AS data_venda, ve.valorTotal FROM venda ve, produto pr, cliente cl
WHERE ve.cliente_cpf = cl.cpf
		AND ve.produto_codigo = pr.codigo
			AND cl.nome = 'Paulo Cesar'

SELECT DISTINCT descricao, preco FROM produto
ORDER BY descricao DESC







