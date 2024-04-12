create database lanchonete_cco
go

use lanchonete_cco
go


create table categorias
(
	codigo int not null identity,
	nome varchar(50) not null,
	
	constraint pk_categorias primary key(codigo)

)
go

insert into categorias
values ('Hamburguer'), ('Frango'), ('File'), ('Vegetariano'), ('Vegano')

select * from categorias

create table lanches
(
	codigo int not null identity,
	nome varchar(50) not null,
	preco decimal(10,2) not null,
	calorias int not null,
	categoria_codigo int not null,

	constraint pk_lanches primary key(codigo),
	constraint fk_categorias_lanches foreign key(categoria_codigo) references categorias
)
go

insert into lanches
values ('X-Bacon', 20, 850, 1)

insert into lanches
values ('Filé Tudo', 25, 900, 3)

insert into lanches
values ('Berinjela Tudo', 22, 150, 3)
select * from lanches

create table fabricantes
(
	codigo int not null identity,
	nome varchar(50) not null,

	constraint pk_fabricantes primary key(codigo)
)
go

insert into fabricantes values ('Coca-Cola Company')
insert into fabricantes values ('Poty')
select * from fabricantes

create table bebidas
(
	codigo int not null identity,
	nome varchar(50) not null,
	estoque int not null,
	preco decimal(10,2) not null,
	fabricante_codigo int not null,

	constraint pk_bebidas primary key(codigo),
	constraint fk_fabricantes_bebidas foreign key(fabricante_codigo) references fabricantes
)
go

insert into bebidas values('Fanta Laranja 4L', 100, 5, 1)
insert into bebidas values('Agua com Gás Levty', 100, 4, 2)

create table ufs
(
	sigla char(02) not null,
	nome varchar(50) not null,

	constraint pk_ufs primary key(sigla),
)
GO

insert into ufs values('SP', 'São Paulo')
insert into ufs values('RN', 'Rio Grande do Norte')
insert into ufs values('RS', 'Rio Grande do Sul')

select * from ufs



create table cidades
(
	codigo int not null,
	nome varchar(50) not null,
	uf_sigla char(02) not null,

	constraint pk_cidades primary key(codigo),
	constraint fk_ufs_cidades foreign key(uf_sigla) references ufs
)

insert into cidades values(3549805, 'São José do Rio Preto', 'SP')
insert into cidades values(3498022, 'Natal', 'RN')
insert into cidades values(4309209, 'Gramado', 'RS')
select * from cidades

create table ceps
(
	nr varchar(10) not null,
	cidade_codigo int not null,

	constraint pk_ceps primary key(nr),
	constraint fk_cidades_ceps foreign key(cidade_codigo) references cidades
)
go

insert into ceps values('15030-620', 3549805)

create table pessoas
(
	codigo int not null identity,
	nome varchar(50) not null,
	cpf varchar(12) not null,
	cep_nr varchar(10) not null,
	logradouro varchar(100) not null,
	nr varchar(05) not null,

	constraint pk_pessoas primary key(codigo),
	constraint fk_ceps_pessoas foreign key(cep_nr) references ceps,
	constraint uq_pessoas_cpf unique(cpf)
)
go

insert into pessoas values('Fernandinho Beiramar', '1010', '15030-620', 'Rua da Boca', '1000')




