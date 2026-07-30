-- Select da tabela prestador
SELECT * FROM prestador



-- Visualizar todas colunas da tabela prestador
SELECT COLUMN_NAME
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'PRESTADOR';



-- Prestador Inativo c\ data de inativação
SELECT
    usu.CD_USUARIO,
    usu.NM_USUARIO,
    prest.TP_SITUACAO,
    prest.CD_PRESTADOR,
    prest.DT_INATIVACAO
FROM PRESTADOR prest
INNER JOIN USUARIOS usu
    ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
WHERE prest.CD_TIP_PRESTA = '8'
  AND prest.TP_SITUACAO = 'I'  -- Filtra apenas os inativos
ORDER BY usu.NM_USUARIO;



-- Prestador Inativo c\ - seleciona pelo mês inativo.
SELECT
    usu.CD_USUARIO,
    usu.NM_USUARIO,
    prest.CD_PRESTADOR,
    CASE prest.TP_SITUACAO
        WHEN 'I' THEN 'Inativo'
    END AS TP_SITUACAO,
    prest.DT_CADASTRO,
    prest.DT_INATIVACAO
FROM PRESTADOR prest
INNER JOIN USUARIOS usu
    ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
WHERE prest.CD_TIP_PRESTA = '8'
  AND prest.TP_SITUACAO = 'I'
  AND prest.DT_INATIVACAO BETWEEN TO_DATE('01/12/2023', 'DD/MM/YYYY') AND TO_DATE('28/02/2025', 'DD/MM/YYYY')
ORDER BY usu.NM_USUARIO;



-- Prestador ativo
SELECT
    usu.CD_USUARIO,
    usu.NM_USUARIO,
    prest.CD_PRESTADOR,
    prest.TP_SITUACAO
FROM PRESTADOR prest
INNER JOIN USUARIOS usu
    ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
WHERE prest.CD_TIP_PRESTA = '8'
  AND prest.TP_SITUACAO = 'A' -- Filtra apenas os ativos
ORDER BY usu.NM_USUARIO;



-- Prestador ativo
/* substitui o valor 'A' pela palavra 'Ativo'
   tras a data dos cadastro - column dt_cadastro */
SELECT
    usu.CD_USUARIO,
    usu.NM_USUARIO,
    prest.CD_PRESTADOR,
    CASE
        WHEN prest.TP_SITUACAO = 'A' THEN 'Ativo'
        ELSE prest.TP_SITUACAO
    END AS TP_SITUACAO,  -- Inclui a tradução de 'A' diretamente aqui
    prest.DT_CADASTRO    -- Inclui a data do cadastro
FROM PRESTADOR prest
INNER JOIN USUARIOS usu
    ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
WHERE prest.CD_TIP_PRESTA = '8'
  AND prest.TP_SITUACAO = 'A' --
ORDER BY usu.NM_USUARIO;



-- Prestador - Usuarios Ativos\Inativos c\ dt_cadastro e dt_inativacao
SELECT
    usu.CD_USUARIO,
    usu.NM_USUARIO,
    prest.CD_PRESTADOR,
    CASE prest.TP_SITUACAO
        WHEN 'A' THEN 'Ativo'
        WHEN 'I' THEN 'Inativo'
    END AS TP_SITUACAO,    -- Inclui a tradução de 'A' e 'I' diretamente aqui
    prest.DT_CADASTRO,     -- Inclui a data de cadastro
    prest.DT_INATIVACAO    -- Inclui a data de inativação
FROM PRESTADOR prest
INNER JOIN USUARIOS usu
    ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
WHERE prest.CD_TIP_PRESTA = '8'
  AND prest.TP_SITUACAO IN ('A', 'I')  -- Filtra somente Ativos e Inativos
ORDER BY usu.NM_USUARIO;
