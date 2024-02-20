# Banco de Dados I
Matéria relacionada a lógica e sintaxe de banco de dados SQL (Modelagem e criação de banco)

## 08/02/2024 - Início 
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

## 20/02/2024 - 