-- Consulta do catálogo do sistema para auditoria de tabelas e views
SELECT
table_schema,

table_name,
table_type
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_type, table_name;

-- 1. Adiciona a coluna com valor por defeito
ALTER TABLE Vendas
ADD COLUMN data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 2. VIEW de Sumário de Vendas por Produto
CREATE OR REPLACE VIEW Relatorio_Vendas_Seguro AS
SELECT
v.id AS venda_id,
CONCAT(LEFT(TRIM(u.nome), 2), '***') AS cliente_anonimizado,
p.titulo AS produto,
v.quantidade,
(v.quantidade * p.preco) AS valor_total,
v.data_venda
FROM Vendas v
JOIN Utilizadores u ON v.utilizador_id = u.id
JOIN Produtos p ON v.produto_id = p.id;
Verifique a execução da VIEW de relatórios sem acesso a dados sensíveis:
-- Validacao do relatorio anonimizado para a gestao
SELECT * FROM Relatorio_Vendas_Seguro;

-- 1. Função que escreve a ação no log
CREATE OR REPLACE FUNCTION fn_log_eliminacao_utilizador()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO log_tarefas_agendadas (nome_tarefa, estado, mensagem,
data_execucao)
VALUES (
'Eliminação de Utilizador (RGPD)',
'SUCESSO',
CONCAT('Utilizador eliminado ID: ', OLD.id, ' - Nome: ', OLD.nome),
CURRENT_TIMESTAMP
);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- 2. Associação da função à tabela Utilizadores (AFTER DELETE)
CREATE OR REPLACE TRIGGER trg_audit_delete_utilizador
AFTER DELETE ON Utilizadores
FOR EACH ROW
EXECUTE FUNCTION fn_log_eliminacao_utilizador();

-- 1. Reconfiguração da Foreign Key para permitir eliminação em cascata
ALTER TABLE Vendas
DROP CONSTRAINT IF EXISTS vendas_utilizador_id_fkey;

ALTER TABLE Vendas
ADD CONSTRAINT vendas_utilizador_id_fkey
FOREIGN KEY (utilizador_id)
REFERENCES Utilizadores(id)
ON DELETE CASCADE;

-- 2. Verificação prévia dos registos do Utilizador ID 1
SELECT * FROM Utilizadores WHERE id = 1;
SELECT * FROM Vendas WHERE utilizador_id = 1;

-- 3. Teste de apagamento em cascata (Cumprimento do RGPD)
DELETE FROM Utilizadores WHERE id = 1;

-- 4. Validação da eliminação em cascata (Deve retornar 0 linhas)
SELECT * FROM Vendas WHERE utilizador_id = 1;

-- 5. Confirmação do registo da ação no log de auditoria
SELECT * FROM log_tarefas_agendadas
ORDER BY data_execucao DESC
LIMIT 5;
