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
		
	-- RESTRICOES --
	CONSTRAINT pk_tecnicos PRIMARY KEY(pessoa_codigo),
	CONSTRAINT fk_pessoas_tecnicos FOREIGN KEY(pessoa_codigo) REFERENCES pessoas,
	CONSTRAINT ck_valor_diaria CHECK(valor_diaria > 0)

)
GO

CREATE TABLE funcionarios
(
	pessoa_codigo INT NOT NULL,
	salario DECIMAL(10,2) NOT NULL,
	especialidade_codigo INT NOT NULL,

	--- RESTRICOES ---
	CONSTRAINT pk_funcionarios PRIMARY KEY(pessoa_codigo),
	CONSTRAINT fk_pessoas_funcionarios FOREIGN KEY(pessoa_codigo) REFERENCES pessoas,
	CONSTRAINT ck_funcionario_salario CHECK(salario > 0),
	CONSTRAINT fk_especialidades_funcionarios FOREIGN KEY(especialidade_codigo) REFERENCES especialidades

)
GO

CREATE TABLE equipamentos
(
	codigo INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	obs VARCHAR(MAX) NULL,
	status INT NULL,
	tipo_codigo INT NOT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_equipamentos PRIMARY KEY(codigo),
	CONSTRAINT ck_equipamentos_status CHECK(status >=1 AND status <=10),
	CONSTRAINT fk_tipos_equipamentos FOREIGN KEY(tipo_codigo) REFERENCES tipos
)
GO

CREATE TABLE locacoes
(

	nr INT NOT NULL IDENTITY,
	data_inicio datetime NOT NULL,
	data_termino datetime NULL,
	total DECIMAL(10,2) NULL,
	status INT NULL,
	cliente_codigo INT NOT NULL,
	funcionario_codigo INT NOT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_locacoes PRIMARY KEY(nr),
	CONSTRAINT ck_locacoes_total CHECK(total > 0),
	CONSTRAINT ck_locacoes_datas CHECK (data_termino >= data_inicio),
	CONSTRAINT ck_locacoes_status CHECK (status in(1, 2, 3)),
	CONSTRAINT fk_clientes_locacoes FOREIGN KEY(cliente_codigo) REFERENCES clientes,
	CONSTRAINT fk_funcionarios_locacoes FOREIGN KEY(funcionario_codigo) REFERENCES funcionarios
)
GO

CREATE TABLE os
(
	nr INT NOT NULL IDENTITY,
	data_chamado datetime NOT NULL,
	data_termino datetime NULL,
	status INT NULL,
	locacao_nr INT NOT NULL,
	tecnico_codigo INT NULL,
	funcionario_codigo INT NOT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_os PRIMARY KEY(nr),
	CONSTRAINT ck_os_status CHECK(status IN (1, 2, 3, 4, 5)),
	CONSTRAINT ck_os_datas CHECK(data_termino > data_chamado),
	CONSTRAINT fk_locacao_os FOREIGN KEY(locacao_nr) REFERENCES locacoes,
	CONSTRAINT fk_tecnicos_os FOREIGN KEY(tecnico_codigo) REFERENCES tecnicos,
	CONSTRAINT fk_funcionarios_os FOREIGN KEY(funcionario_codigo) REFERENCES funcionarios
)
GO

CREATE TABLE parcelas
(
	locacao_nr INT NOT NULL,
	nr INT NOT NULL,
	data_vencimento date NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	data_pagamento date NULL,
	valor_pago DECIMAL(10,2) NULL,
	juros DECIMAL(10,2) NULL,
	multa DECIMAL(10,2) NULL,

	-- RESTRICOES --
	CONSTRAINT pk_parcelas PRIMARY KEY(locacao_nr, nr),
	CONSTRAINT fk_locacoes_parcelas FOREIGN KEY (locacao_nr) REFERENCES locacoes
)
GO

CREATE TABLE locacoes_equipamentos
(
	locacao_nr INT NOT NULL,
	equipamento_codigo INT NOT NULL,

	-- RESTRICOES --
	CONSTRAINT pk_locacoes_equipa PRIMARY KEY(locacao_nr, equipamento_codigo),
	CONSTRAINT fk_locacoes_loca_equipa FOREIGN KEY(locacao_nr) REFERENCES locacoes,
	CONSTRAINT fk_equipamentos_loca_equipa FOREIGN KEY(equipamento_codigo) REFERENCES equipamentos
)
GO