DROP DATABASE primeiro_projeto

USE MASTER
GO

CREATE DATABASE primeiro_projeto
GO

USE primeiro_projeto
GO

CREATE TABLE Cores (

	codigo int not null primary key identity,
	nome   varchar(50) not null
)
GO

INSERT INTO Cores VALUES ('Verde')

SELECT * FROM Cores

INSERT INTO Cores Values 
('Azul'), ('Vermelho'), ('Branco')

BEGIN TRAN /* ABRE UMA TRANSAÇÃO NO BANCO */
DELETE FROM Cores
ROLLBACK /* FECHA E INVALIDA A TRANSAÇÃO */

DELETE FROM Cores WHERE codigo > 4

---------- CRIANDO TABELA DE MODELOS ---------

CREATE TABLE Modelos (
	codigo int not null primary key identity,
	descricao varchar(50) not null		
)
GO

INSERT INTO Modelos VALUES
('Gol'), 
('Fox'),
('Civic')

SELECT * FROM Modelos

----------- CRIANDO TABELA DE VEICULOS -----------
CREATE TABLE Veiculos (
	placa VARCHAR(10) NOT NULL primary key,
	cor_codigo INT NOT NULL REFERENCES Cores,
	modelo_codigo INT NOT NULL REFERENCES Modelos
)
GO

INSERT INTO Veiculos VALUES ('AAA-1010', 1, 3)
GO

INSERT INTO Veiculos VALUES ('BBB-2020', 1, 3)

SELECT * FROM Cores
SELECT * FROM Modelos
SELECT * FROM Veiculos

--------------- CRIAR A TABELA DE VAGAS ---------
CREATE TABLE Vagas (
	numero INT NOT NULL PRIMARY KEY IDENTITY,
	status INT NULL
)
GO

INSERT INTO Vagas VALUES (1), (1), (1)
GO

SELECT * FROM Vagas

------- CRIAR TABELA DE ENTRADAS -------
CREATE TABLE Entradas (
	num INT NOT NULL PRIMARY KEY IDENTITY,
	data_hora_chegada DATETIME NOT NULL,
	data_hora_saida DATETIME NULL,
	total DECIMAL(10,2) NULL, -- 10 digitos ao todo e 2 para depois da virgula
	veiculo_placa VARCHAR(10) NOT NULL REFERENCES Veiculos,
	vaga_numero INT NOT NULL REFERENCES Vagas

)
GO

INSERT INTO Entradas 
(data_hora_chegada, veiculo_placa, vaga_numero) VALUES (GETDATE(), 'AAA-1010', 2)

--- ATUALIZAR A VAGA QUE FOI PREENCHIDA ---
UPDATE Vagas SET status = 0 WHERE numero = 2

SELECT * FROM Entradas

