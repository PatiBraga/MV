-- 1. COLUNAS DA TABELA
SELECT 
    column_name, 
    data_type, 
    nullable
FROM 
    user_tab_columns
WHERE 
    table_name = 'LAUDO_RX';

-- 2. CHAVE PRIMÁRIA (PK)
SELECT 
    cols.column_name AS pk_column
FROM 
    user_constraints cons
    JOIN user_cons_columns cols 
        ON cons.constraint_name = cols.constraint_name
WHERE 
    cons.constraint_type = 'P'
    AND cons.table_name = 'LAUDO_RX';

-- 3. CHAVES ESTRANGEIRAS (FK)
SELECT 
    a.column_name AS fk_column,
    c_pk.table_name AS referenced_table,
    b.column_name AS referenced_column
FROM 
    user_constraints c
    JOIN user_cons_columns a 
        ON c.constraint_name = a.constraint_name
    JOIN user_constraints c_pk 
        ON c.r_constraint_name = c_pk.constraint_name
    JOIN user_cons_columns b 
        ON c_pk.constraint_name = b.constraint_name AND a.position = b.position
WHERE 
    c.constraint_type = 'R'
    AND c.table_name = 'LAUDO_RX';


___________________________________________________________________________________________________

SELECT * FROM laudo_rx WHERE ROWNUM = 1;


SELECT * 
FROM laudo_rx
ORDER BY cd_laudo -- substitua 'nome_coluna' pela coluna desejada
FETCH FIRST 200 ROWS ONLY;


SELECT column_name, data_type, nullable 
FROM user_tab_columns 
WHERE table_name = 'LAUDO_RX';


SELECT cols.column_name
FROM user_constraints cons
JOIN user_cons_columns cols ON cons.constraint_name = cols.constraint_name
WHERE cons.constraint_type = 'P'
  AND cons.table_name = 'LAUDO_RX';
  

SELECT a.column_name, c_pk.table_name AS referenced_table, b.column_name AS referenced_column
FROM user_constraints c
JOIN user_cons_columns a ON c.constraint_name = a.constraint_name
JOIN user_constraints c_pk ON c.r_constraint_name = c_pk.constraint_name
JOIN user_cons_columns b ON c_pk.constraint_name = b.constraint_name AND a.position = b.position
WHERE c.constraint_type = 'R'
  AND c.table_name = 'LAUDO_RX';
