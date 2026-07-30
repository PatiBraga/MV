SELECT
    a.table_name      AS origem_table,
    a.column_name     AS origem_column,
    c_pk.table_name   AS destino_table,
    c_pk.column_name  AS destino_column
FROM   ALL_CONS_COLUMNS a
JOIN   ALL_CONSTRAINTS c
       ON a.owner = c.owner
      AND a.constraint_name = c.constraint_name
JOIN   ALL_CONS_COLUMNS c_pk
       ON c.r_owner = c_pk.owner
      AND c.r_constraint_name = c_pk.constraint_name
WHERE  c.constraint_type = 'R'                     -- apenas foreign‑keys
  AND  c.owner IN (
        'ACESSOPRD','AUDIT_DBAMV','AUDIT_DBASGU','AUDSYS','BOTDESIGNER','CARTORIO',
        'DBACP','DBACP_BKP','DBADW','DBAMS','DBAMV','DBAPORTAL','DBAPS','DBASGU',
        'DBSFWUSER','DBSNMP','EDITOR','FLOWS_FILES','FLOWTI','GCMMV','GIF',
        'GSMADMIN_INTERNAL','GTPLAN','HMED','MIGRATOR','MVINTEGRA','MVONEPASS',
        'MYAPPS','SYS','SYSTEM','WEKNOW','WEKNOW_APEX')
ORDER BY a.table_name, a.column_name;

----------------------------------------------------------------------------------------------------------------------------------------

  SELECT
    a.table_name,
    /* --------------------------------------------------------------
       Concatena todas as constraints da tabela em um CLOB.
       Cada linha tem o mesmo layout que você já utilizava.
       -------------------------------------------------------------- */
    XMLAGG(
        XMLELEMENT(
            e,
            '-- RELACIONAMENTO: ' || a.constraint_name || CHR(10) ||
            '-- Tabela origem: '   || a.table_name    || CHR(10) ||
            '-- Coluna origem: '   || a.column_name   || CHR(10) ||
            '-- Tabela destino: '  || c_pk.table_name || CHR(10) ||
            '-- Coluna destino: '  || c_pk.column_name|| CHR(10) ||
            '-- Status: '          || DECODE(c.status,'ENABLED','Ativo','Inativo') || CHR(10) ||
            'ALTER TABLE ' || a.table_name ||
            ' ADD CONSTRAINT ' || a.constraint_name ||
            ' FOREIGN KEY (' || a.column_name || ')' ||
            ' REFERENCES ' || c_pk.table_name || '(' || c_pk.column_name || ');' ||
            CHR(10) || CHR(10)
        )
        ORDER BY a.constraint_name
    ).GETCLOBVAL() AS constraints_text
FROM ALL_CONS_COLUMNS a
JOIN ALL_CONSTRAINTS c
      ON a.owner = c.owner
     AND a.constraint_name = c.constraint_name
JOIN ALL_CONS_COLUMNS c_pk
      ON c.r_owner = c_pk.owner
     AND c.r_constraint_name = c_pk.constraint_name
WHERE c.constraint_type = 'R'                     -- apenas foreign-keys
  AND c.owner IN (
        'ACESSOPRD','AUDIT_DBAMV','AUDIT_DBASGU','AUDSYS','BOTDESIGNER','CARTORIO',
        'DBACP','DBACP_BKP','DBADW','DBAMS','DBAMV','DBAPORTAL','DBAPS','DBASGU',
        'DBSFWUSER','DBSNMP','EDITOR','FLOWS_FILES','FLOWTI','GCMMV','GIF',
        'GSMADMIN_INTERNAL','GTPLAN','HMED','MIGRATOR','MVINTEGRA','MVONEPASS',
        'MYAPPS','SYS','SYSTEM','WEKNOW','WEKNOW_APEX')
GROUP BY a.table_name
ORDER BY a.table_name;


