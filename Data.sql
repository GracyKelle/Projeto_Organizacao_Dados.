-- INSERÇÃO DE DADOS DE TESTE (ORDEM OBRIGATÓRIA)
-- ============================================================
-- Passo A: Registar Utilizadores (Criados com ID 1, ID 2 e ID 3)
INSERT INTO Utilizadores (nome, email) VALUES
 ('João Silva', 'joao@email.com'),
 ('Ana Martins', 'ana.martins@email.com'),
 ('Carlos Sousa', 'carlos.sousa@email.com');
-- Passo B: Registar Produtos (Criados com ID 1, ID 2 e ID 3)
INSERT INTO Produtos (titulo, preco, stock) VALUES
 ('Livro de SQL para Análise de Dados', 25.50, 50),
 ('Curso Completo de Power BI', 89.90, 100),
 ('Manual de Modelação Relacional', 15.00, 30);
-- Passo C: Registar Vendas (Agora já existem Utilizadores e Produtos!)
INSERT INTO Vendas (utilizador_id, produto_id, quantidade) VALUES
 (1, 1, 2), -- O João Silva (ID 1) comprou 2 Livros de SQL (ID 1)
 (2, 2, 1), -- A Ana Martins (ID 2) comprou 1 Curso de Power BI (ID 2)
 (1, 3, 1); -- O João Silva (ID 1) comprou 1 Manual de Modelação (ID 3) 


-- 1. Inserir 5 Utilizadores
INSERT INTO Utilizadores (nome, email) VALUES
('Ana Silva', 'ana.silva@empresa.pt'),
('Carlos Santos', 'carlos.santos@empresa.pt'),
('Beatriz Costa', 'beatriz.costa@organizacao.com'),
('Daniel Oliveira', 'daniel.oliveira@empresa.pt'),
('Helena Martins', 'helena.martins@organizacao.com');
-- 2. Inserir 5 Produtos
INSERT INTO Produtos (titulo, preco, stock) VALUES
('Livro: Gestão de Redes Colaborativas', 29.99, 150),
('Manual de SQL Aplicado', 45.00, 80),
('Formação RGPD para Técnicos', 120.50, 50),
('Caderno de Apontamentos Press', 12.50, 300),
('Kit de Automação Cloud', 89.99, 40);
-- 3. Inserir 10 Linhas de Vendas (com quantidades variadas para testar
somas e filtros)
INSERT INTO Vendas (utilizador_id, produto_id, quantidade) VALUES
(1, 1, 5), -- Ana compra 5 unidades do Produto 1
(2, 2, 12), -- Carlos compra 12 unidades do Produto 2
(3, 1, 3), -- Beatriz compra 3 unidades do Produto 1
(1, 3, 2), -- Ana compra 2 unidades do Produto 3
(4, 4, 15), -- Daniel compra 15 unidades do Produto 4
(5, 5, 4), -- Helena compra 4 unidades do Produto 5
(2, 1, 8), -- Carlos compra 8 unidades do Produto 1
(3, 4, 6), -- Beatriz compra 6 unidades do Produto 4
(4, 2, 11), -- Daniel compra 11 unidades do Produto 2
(1, 5, 7); -- Ana compra 7 unidades do Produto 5 

