# Banco de Dados I
Matéria relacionada a lógica e sintaxe de banco de dados SQL (Modelagem e criação de banco)

## 08/02/2024 - 20/02/2024 | Introdução
Tipos de Buscas:
 - Busca Sequencial é aquela busca que é feita sequencialmente (1 por 1)
 - Busca Indexada é aquela busca que é feita atráves do índice (em banco utilizamos primary key dando um índice à linha)

O que é um Banco de Dados?
R: É um conjunto de informações organizadas que permita uma busca rápida (consultar).

O que é um Banco SGBD?
R: É um sistema gerenciador de banco de dados que é obrigatório ter algumas funções como Backup/Restore/Gerenciamento de Usuários/Permissões/Acessos/Transação e Concorrência (se instalada em qualquer máquina, a máquina passa a ser um servidor).
Exemplo de SGBDS: Oracle, SQLServer, PostgresSQL.

O que é um Banco SBD?
R: É o conjunto de bancos SGBD.

O que é um Metadado?
R: São as informações que podemos dar para o dado, exemplo data, nome, etc...

O que é um Modelo de Dados?
R: É a forma na qual o dado é armazenado, sendo utilizados os seguintes modelos:
- Bancos Relacionais: são modelos de dados que não suportam imagens, e permitem a ordenação dos metadados (relação de ordem), orientado a tabelas (exemplo, SQLServer, PostgreSQL, etc...)
- Bancos não Relacionais: são modelos de dados que suportam imagens e não permitem a ordenação dos metadados (exemplo, Cassandra, MongoDB, etc...)

Criando uma tabela de exemplo para os departamentos de uma empresa:
```
CREATE TABLE Departamentos
(
    cod INT NOT NULL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
)
```
Criando uma tabela de exemplo para funcionários de uma empresa e relacionando os mesmos com os departamentos:
```
CREATE TABLE Funcionarios
(
    cod INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2),
    dep_cod INT NOT NULL REFERENCE Departamentos
)
```
Toda chave estrangeira necessita estar conectado à uma chave primária?
R: Sim, porque os elementos são únicos e garante que as informações virão do lugar correto, dando nome à Intregridade Referencial, onde o modelo de dados relacionais garante que o valor tem que ser íntegro(existente) e estar referido em outro lugar.

O que é Modelo Conceitual?
R: O Modelo Conceitual serve para traduzir o mundo real para base de dados, incluindo entidades que são os itens que contém registros, exemplo:
Um departamento é uma entidade que contém inúmeras descrições, isso traduz o mundo real para um modelo conceitual onde serão armazenados os dados de uma empresa a partir de departamentos.

Um banco de dados segue a seguinte estrutura:
MC -> Modelo Conceitual(define o mundo real) -> Modelo Lógico(define o modelo de dados) -> Modelo Físico(DDL) -> Banco de Dados

## 22/02/2024 - 
O que é Cardinalidade?
R: É o número de vezes que um item se comunica com outro item, exemplo: 1 único funcionário pode-se comunicar com 1 departamento porém 1 departamento pode-se comunicar com vários funcionários.
