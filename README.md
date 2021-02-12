# Banco Postgres para Disciplina de Banco de Dados da UFABC

## Requisitos

É necessário ter instalado docker e docker-compose em sua máquina.

## Subindo Banco de dados e pgAdmin4

Primeiro crie uma pasta com nome de postgres_data:

```
mkdir postgres_data
```

Então execute:

```bash
docker-compose up
```

Tanto o banco de dados quanto o pgAdmin4 irão subir. Depois basta acessar a o pgAdmin4 pelo browser na url: http://127.0.0.1:16543

## Criando tabelas e inserindo dados

O docker-compose.yaml cria o colume necessário para persistência dos dados mas também um volume para acessar os scripts de criação e deleção do database.

Primeiro acesse o container do banco de dados:

```bash
docker-compose exec postgres-ufabc bash
```

Então poderá prosseguir para os comandos do psql:

### Inserindo dados:
```bash
psql -U admin -d ufabc_database -a -f cria_db.sql
```

### Apagando dados:
```bash
psql -U admin -d ufabc_database -a -f apaga_db.sql
```


## dados pgAdmin4

user: **admin@email.com**
senha: **admin123**

## dados banco de dados

nome do banco: **ufabc_database**
user: **admin**
senha: **admin123**
