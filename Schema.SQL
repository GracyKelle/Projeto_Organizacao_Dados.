-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: schema.sql
-- ============================================================

-- 1. CRIAR A TABELA DE UTILIZADORES
CREATE TABLE Utilizadores (
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
data_registo TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. CRIAR A TABELA DE PRODUTOS
CREATE TABLE Produtos (
id SERIAL PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
preco DECIMAL(10, 2) NOT NULL,
stock INT NOT NULL
);

-- 3. CRIAR A TABELA DE VENDAS (LIGADA ÀS DUAS ANTERIORES)
CREATE TABLE Vendas (
id SERIAL PRIMARY KEY,
utilizador_id INT REFERENCES Utilizadores(id),
produto_id INT REFERENCES Produtos(id),

quantidade INT NOT NULL,
data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE Utilizadores
ADD CONSTRAINT email_valido CHECK (email LIKE '%@%.%');
