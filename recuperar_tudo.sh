#!/bin/bash
# =======================================================
# SCRIPT DE RESSURREIÇÃO / DISASTER RECOVERY (Hora 28)
# Projeto: Organização de Dados - UFCD 10797
# =======================================================

echo "⚠️ INICIANDO PROTOCOLO DE RECUPERAÇÃO DE EMERGÊNCIA..."

# 1. Eliminar a base de dados corrompida/antiga
dropdb -U postgres Organizacao --if-exists

# 2. Criar uma base de dados nova e limpa
createdb -U postgres Organizacao

# 3. Importar a cópia de segurança (backup_seguro.sql)
psql -U postgres -d Organizacao -f backup_seguro.sql

echo "✅ PROCESSO CONCLUÍDO COM SUCESSO! A base de dados voltou à vida."
