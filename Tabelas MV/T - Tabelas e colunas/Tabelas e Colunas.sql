-- Query para trazer todas as tabelas que possuem determinada coluna

    SELECT
    owner         AS schema_name,
    table_name,
    column_name,
    data_type,
    data_length,
    nullable
FROM
    all_tab_columns
WHERE
    UPPER(column_name) = 'SN_FECHADA'
ORDER BY
    owner,
    table_name;



-- Query para trazer todas as tabelas que possuem determinada coluna

SELECT
    owner         AS schema_name,
    table_name,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale,
    nullable,
    column_id
FROM
    dba_tab_columns
WHERE
    UPPER(column_name) LIKE '%SN_FECHADA%'
ORDER BY
    table_name,
     owner,
    column_id;









-- Query para trazer as tabelas e colunas - Completa traz a tabela que esta localizada a coluna

SELECT
    table_name,
    column_id,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale,
    nullable
FROM
    all_tab_columns
WHERE
    UPPER(table_name) IN ('ITREG_AMB', 'REG_AMB')
    AND UPPER(column_name) LIKE '%SN_FECHADA%'
ORDER BY
    table_name,
    column_id;




-- Query para trazer as tabelas e colunas

SELECT
    column_name,
    data_type,
    data_length,
    nullable
FROM
    all_tab_columns
WHERE
    UPPER(table_name)  = 'REG_AMB'
AND UPPER(column_name) = 'SN_FECHADA';




-- Query para trazer as tabelas e colunas

SELECT
    column_name,
    data_type,
    data_length,
    nullable
FROM
    all_tab_columns
WHERE
    UPPER(table_name)  in ('ITREG_AMB', 'ATENDIME')
AND UPPER(column_name) LIKE '%SN_FECHADA%'
ORDER BY
    column_name;




-- Query para trazer as tabelas e colunas

SELECT
    table_name,
    column_id,
    column_name,
    data_type,
    data_length,
    data_precision,
    data_scale,
    nullable
FROM
    all_tab_columns
WHERE
    UPPER(table_name) IN ('ITREG_AMB', 'ATENDIME')
    AND UPPER(column_name) LIKE '%SN_FECHADA%'
ORDER BY
    table_name,
    column_id;





