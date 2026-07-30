1- Listar todas as tabelas em um banco de dados:

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


2- Listar todas as colunas de uma tabela específica:

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'nome_da_tabela';


3- Obter detalhes sobre as chaves primárias:

SELECT 
    KU.TABLE_NAME AS Table_Name,
    KU.COLUMN_NAME AS Column_Name,
    TC.CONSTRAINT_NAME AS Constraint_Name
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
    INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU
    ON TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME
WHERE 
    TC.CONSTRAINT_TYPE = 'PRIMARY KEY';


4- Obter detalhes sobre as chaves estrangeiras:

SELECT 
    FK.TABLE_NAME AS Table_Name,
    CU.COLUMN_NAME AS Column_Name,
    PK.TABLE_NAME AS Referenced_Table_Name,
    PT.COLUMN_NAME AS Referenced_Column_Name,
    C.CONSTRAINT_NAME AS Constraint_Name
FROM 
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS C
    INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS FK
    ON C.CONSTRAINT_NAME = FK.CONSTRAINT_NAME
    INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS PK
    ON C.UNIQUE_CONSTRAINT_NAME = PK.CONSTRAINT_NAME
    INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS CU
    ON C.CONSTRAINT_NAME = CU.CONSTRAINT_NAME
    INNER JOIN (
        SELECT 
            i1.TABLE_NAME,
            i2.COLUMN_NAME
        FROM 
            INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS i1
            INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS i2
            ON i1.CONSTRAINT_NAME = i2.CONSTRAINT_NAME
        WHERE 
            i1.CONSTRAINT_TYPE = 'PRIMARY KEY'
    ) AS PT
    ON PT.TABLE_NAME = PK.TABLE_NAME;


5- Obter informações sobre índices:

SELECT 
    i.name AS Index_Name,
    OBJECT_NAME(ic.object_id) AS Table_Name,
    COL_NAME(ic.object_id, ic.column_id) AS Column_Name
FROM 
    sys.indexes AS i
    INNER JOIN sys.index_columns AS ic
    ON i.object_id = ic.object_id AND i.index_id = ic.index_id
WHERE 
    i.is_primary_key = 0 AND i.is_unique_constraint = 0;


6- Obter informações sobre sequences:

SELECT 
    name AS Sequence_Name,
    start_value,
    increment,
    minimum_value,
    maximum_value,
    cache_size,
    is_cycling
FROM 
    sys.sequences;