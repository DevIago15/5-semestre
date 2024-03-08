create database vendas_cco
go

use vendas_cco
go

create table pessoas
(
	codigo int			not null identity,
	nome   varchar(50)  not null,
	cpf    varchar(12)  not null,
	status int,

	primary key(codigo),
	unique(cpf),
	check (status in (1,2,3,4)) 
)
go

create table clientes 
(
	pessoa_codigo int           not null,
	renda         decimal(10,2) not null,
	credito       money			not null,

	primary key(pessoa_codigo),
	check (renda > 0),
	check (credito > 0),
	foreign key(pessoa_codigo) references pessoas
)
go

create table vendedores
(	
	pessoa_codigo int           not null,
	salario       decimal(10,2) not null,

	primary key(pessoa_codigo),
	check (salario > 0),
	foreign key(pessoa_codigo) references pessoas
)
go

create table produtos
(
	codigo    int		    not null identity,
	descricao varchar(50)   not null,
	estoque   int		    not null,
	valor     decimal(10,2) not null,
	status    int,

	primary key(codigo),
	check (estoque >= 0),
	check (valor > 0),
	check (status >= 1 and status <= 10)
)
go

create table pedidos
(
    nr    int	         not null,
	data  datetime       not null,
	valor decimal(10,2),
	status int,
	cliente_codigo  int  not null,
	vendedor_codigo int  not null,

	primary key(nr),
	check (valor > 0),
	check (status in (1,2,3,4,5)),
	foreign key(cliente_codigo) references clientes,
	foreign key(vendedor_codigo) references vendedores
)
go

create table itens_pedidos
(
   pedido_numero  int   not null,
   produto_codigo int   not null,
   qtd_vendida    int   not null,
   preco_vendido  money not null,
   
   primary key(pedido_numero, produto_codigo),
   foreign key(pedido_numero) references pedidos,
   foreign key(produto_codigo) references produtos,
   check (qtd_vendida > 0),
   check (preco_vendido > 0)
)
go

INSERT INTO produtos values
('Lápis', 1000, 2, 1)
GO

CREATE PROCEDURE cadProd
(
	@descricao varchar(50),
	@estoque int,
	@preco decimal(10, 2)
	-- status sera sempre 1 de disponivel
)
as
begin
	INSERT INTO produtos values
	(@descricao, @estoque, @preco, 1)
end

-- TESTE --
exec cadProd 'Caderno', 1000, 20
GO

EXEC cadProd 'Caneta', 500, 3
go

EXEC cadProd 'Borracha', 200, 4
GO

EXEC cadProd 'Estojo', 50, 21
GO
SELECT * FROM produtos
GO

CREATE PROCEDURE cadCli
(
	 @nome varchar(50),
	 @cpf varchar(12),
	 @renda decimal(10,2)
)
as
begin
	INSERT INTO pessoas VALUES (@nome, @cpf, 1)
	INSERT INTO clientes values 
	(@@IDENTITY, @renda, @renda*0.25)
end
GO

-- TESTE
exec cadCli 'Clebin', '1010', 5000
GO

SELECT * FROM pessoas
SELECT * FROM clientes
GO

CREATE PROCEDURE cadVen
(
	 @nome varchar(50),
	 @cpf varchar(12),
	 @salario decimal(10,2)
)
as
begin
	INSERT INTO pessoas VALUES (@nome, @cpf, 1)
	INSERT INTO vendedores values 
	(@@IDENTITY, @salario)
end
GO

-- TESTE
EXEC cadVen 'Fernando', '2020', 2500
SELECT * FROM pessoas
SELECT * FROM vendedores


CREATE PROCEDURE cadPed
(
	@nr int, @cliente int, @vendedor int
)
as
begin
	insert into pedidos(nr, data, cliente_codigo, vendedor_codigo)
	values (@nr, getDate(), @cliente, @vendedor)
end
GO

-- TESTE
EXEC cadPed 1, 1, 2 
GO
SELECT * FROM pedidos
GO

CREATE PROCEDURE cadItem
(
	@pedido int, @produto int, @qtd int, @preco decimal(10,2)
)
as
begin
	insert into itens_pedidos values
	(@pedido, @produto, @qtd, @preco)
end
GO

-- TESTE
exec cadItem 1, 3, 4, 3
go

exec cadItem 1, 4, 7, 3.9
go

exec cadItem 1, 5, 10, 20
go


SELECT * FROM itens_pedidos










                                                                                                                                                                  