-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro: dashboard.sql (Hora 20)
-- Descrição: Criação de View Analítica e Alertas de Gestão
-- ============================================================

-- 1. CRIAÇÃO DA VIEW DE RELATÓRIO MENSAL DE VENDAS
CREATE OR REPLACE VIEW Relatorio_Vendas_Mensal AS
SELECT
    DATE_TRUNC('month', created_at) AS mes_faturacao,
    COUNT(*) AS total_vendas,
    SUM(quantidade) AS total_unidades_vendidas
FROM Vendas
GROUP BY DATE_TRUNC('month', created_at)
ORDER BY mes_faturacao DESC;

-- 2. CONSULTA DE STOCK CRÍTICO (ALERTA DE GESTÃO)
SELECT id, titulo, stock
FROM Produtos
WHERE stock < 5;
