CREATE DATABASE cliente_carro
GO
USE cliente_carro
GO


CREATE TABLE cliente(
nome			VARCHAR(20)			NOT NULL,
logradouro		VARCHAR(30)			NOT NULL,
num				INT					NOT NULL,
bairro			VARCHAR(20)			NOT NULL,
telefone		VARCHAR(9)			NOT NULL,
placa_carro		VARCHAR(7)			NOT NULL
PRIMARY KEY(nome),
FOREIGN KEY(placa_carro) REFERENCES carro(placa))
GO
CREATE TABLE carro(
placa			VARCHAR(7)			NOT NULL,
marca			VARCHAR(10)			NOT NULL,
modelo			VARCHAR(10)			NOT NULL,
cor				VARCHAR(10)			NOT NULL,
ano				INT					NOT NULL
PRIMARY KEY (placa))
GO
CREATE TABLE peca(
codigo			INT					NOT NULL,
nome			VARCHAR(20)			NOT NULL,
valor			INT					NOT NULL
PRIMARY KEY (codigo))
GO
CREATE TABLE servico(
placa_carro		VARCHAR(7)			NOT NULL,
codigo_peca		INT					NOT NULL,
qtd				INT					NOT NULL,
valor			INT					NOT NULL,
data_servico	DATETIME			NOT NULL
PRIMARY KEY(data_servico),
FOREIGN KEY(codigo_peca) REFERENCES peca(codigo),
FOREIGN KEY(placa_carro) REFERENCES carro(placa))

INSERT INTO cliente VALUES
('João Alves', 'R. Pereira Barreto', 1258, 'Jd. Oliveiras', '2154-9658', 'DXO9876'),
('Ana Maria', 'R. 7 de Setembro', 259, 'Centro', '9658-8541', 'LKM7380'),
('Clara Oliveira', 'Av. Nações Unidas', 10254, 'Pinheiros', '2458-9658', 'EGT4631'),
('José Simões', 'R. XV de Novembro', 36, 'Água Branca', '7895-2459', 'BCD7521'),
('Paula Rocha', 'R. Anhaia', 548, 'Barra Funda', '6958-2548', 'AFT9087')

INSERT INTO carro VALUES
('AFT9087', 'VW', 'Gol', 'Preto', 2007),
('DXO9876', 'Ford', 'Ka', 'Azul', 2000),
('EGT4631', 'Renault', 'Clio', 'Verde', 2004),
('LKM7380', 'Fiat', 'Palio', 'Prata', 1997),
('BCD7521', 'Ford', 'Fiesta', 'Preto', 1999)

INSERT INTO peca VALUES
(1, 'Vela', 70),
(2, 'Correia Dentada', 125),
(3, 'Trambulador', 90),
(4, 'Filtro de Ar', 30)

INSERT INTO servico VALUES
('DXO9876', 1, 4, 280, '2020-08-01'),
('DXO9876', 4, 1, 30, '2020-08-01'),
('EGT4631', 3, 1, 90, '2020-08-02'),
('DXO9876', 2, 1, 125, '2020-08-07')

SELECT cl.telefone FROM cliente cl, carro ca
WHERE cl.placa_carro = ca.placa
		AND ca.cor = 'Azul'
			AND modelo = 'Ka'

SELECT placa FROM carro
WHERE ano < 2001

SELECT marca + ' ' + modelo + ' ' + cor FROM carro
WHERE ano > 2005

SELECT CAST(codigo AS CHAR(1)) + ' ' + nome FROM peca
WHERE valor < 80