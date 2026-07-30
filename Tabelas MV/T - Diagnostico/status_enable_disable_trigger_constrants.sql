-- Verificar a constraint antes de desabilitar
SELECT constraint_name, status, table_name
  FROM dba_constraints
 WHERE constraint_name = 'ITPED_RX_LAUDO_RX_FK'
   AND owner = 'DBAMV';
/

-- Desabilitar constraint
ALTER TABLE DBAMV.ITPED_RX
  DISABLE CONSTRAINT ITPED_RX_LAUDO_RX_FK;


/ -- 4. Reabilitar a FK
ALTER TABLE DBAMV.ITPED_RX
  ENABLE CONSTRAINT ITPED_RX_LAUDO_RX_FK;


-- Habilitar constraint
ALTER TABLE DBAMV.ITPED_RX ENABLE NOVALIDATE CONSTRAINT ITPED_RX_LAUDO_RX_FK;
/


-- Buscar em qual tabela a constraint realmente está
SELECT owner,
       constraint_name,
       table_name,
       status,
       constraint_type
  FROM dba_constraints
 WHERE constraint_name = 'ITPED_RX_LAUDO_RX_FK'
   AND owner = 'DBAMV';



-- Ver qual tabela é filha e qual coluna referencia LAUDO_RX
SELECT c.owner,
       c.constraint_name,
       c.table_name,
       c.r_constraint_name,
       c.status,
       c.deferrable,
       c.deferred,
       cols.column_name
  FROM dba_constraints c
  JOIN dba_cons_columns cols
    ON c.owner          = cols.owner
   AND c.constraint_name = cols.constraint_name
 WHERE c.owner          = 'DBAMV'
   AND c.constraint_name = 'ITPED_RX_LAUDO_RX_FK';


--------------------------------------------------------------------------------

-- Verificar status atual dos triggers
SELECT owner,
       trigger_name,
       table_name,
       status
  FROM dba_triggers
 WHERE (owner = 'MVINTEGRA' AND trigger_name = 'TRG_IMVW_SAI_ITSOLIC_PSDI')
    OR (owner = 'DBAMV'     AND trigger_name = 'TRG_ITPED_RX_LOG_EXCLUSAO');
