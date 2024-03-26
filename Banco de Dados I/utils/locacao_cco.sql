CREATE DATABASE locacao_cco
GO

USE locacao_cco
GO

CREATE TABLE especialidades
(
	codigo INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL

	-- RESTRICAO ---
	CONSTRAINT pk_especialidades PRIMARY KEY(codigo)
)
go

/*
alter table especialidades
drop [pk_especialidade]

alter table especialidades
add constraint pk_chavinha primary key(codigo)
*/

CREATE TABLE classificacoes
(
	codigo INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL

	-- Restrição -- 
	CONSTRAINT pk_classificacao PRIMARY KEY(codigo)
)
GO

-- select * from sys.tables

CREATE TABLE tipos
(
	codigo INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL,
	valor_diaria DECIMAL(10,2),
	status INT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_tipos PRIMARY KEY (codigo),
	CONSTRAINT ck_diaria CHECK (valor_diaria >= 0),
	CONSTRAINT ck_status CHECK (status IN (1,2,3,4))
)
GO

CREATE TABLE pessoas
(
	codigo INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(12) NOT NULL,
	status INT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_pessoas PRIMARY KEY (codigo),
	CONSTRAINT uq_cpf UNIQUE (CPF),
	CONSTRAINT ck_pess_status CHECK(status IN (0,1))
)
GO

CREATE TABLE emails
(
	pessoa_codigo INT NOT NULL,
	endereco VARCHAR(100) NOT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_emails PRIMARY KEY(pessoa_codigo, endereco), -- chave composta
	CONSTRAINT fk_pessoas_emails FOREIGN KEY(pessoa_codigo) REFERENCES pessoas
)
GO

CREATE TABLE telefones
(
	pessoa_codigo INT NOT NULL,
	numero VARCHAR(15) NOT NULL,

	--- RESTRICOES ---
	CONSTRAINT pk_telefones PRIMARY KEY(pessoa_codigo, numero),
	CONSTRAINT fk_pessoas_telefones FOREIGN KEY(pessoa_codigo) REFERENCES pessoas

)
GO

CREATE TABLE clientes
(
	pessoa_codigo INT NOT NULL, -- filho nao tem identity
	score INT NOT NULL,
	classificacao_codigo INT NOT NULL,

	-- RESTRICOES --
	 CONSTRAINT pk_clientes PRIMARY KEY(pessoa_codigo),
	 CONSTRAINT fk_pessoas_clientes FOREIGN KEY(pessoa_codigo) REFERENCES pessoas,
	 CONSTRAINT ck_store CHECK(score >= 0 AND score <= 1000),
	 CONSTRAINT fk_classificacoes_clientes FOREIGN KEY(classificacao_codigo) REFERENCES classificacoes

)
GO

CREATE TABLE tecnicos
(
	pessoa_codigo INT NOT NULL,
	valor_diaria DECIMAL(10,2) NOT NULL,



)
GO