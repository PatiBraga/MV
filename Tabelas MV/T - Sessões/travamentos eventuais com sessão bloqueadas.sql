/*Travamentos eventuais com sessões bloqueadas.
O cliente pode sofrer com travamento do sistema eventual, esse comportamento pode ser reflexo de bloqueio de sessões. Esse erro ocorre devido a falta de index. Para corrigir o problema, é necessário verificar os índices de FK e executar os script abaixo, o resultado gerado são os comandos para criação dos índices que devem ser criados.

Executar o script abaixo: 
*/
/
select
'create index ' || owner || '.' || replace(constraint_name , '_FK' , '_IX') || CHR(10) ||
 ' ON ' || owner || '.'|| TABLE_NAME || '(' || COLUNAS || ') TABLESPACE MV2000_I COMPUTE STATISTICS;'
from (
SELECT R.* ,DC.CONSTRAINT_NAME FROM (
select * from (
      select OWNER,table_name, f_lista_colunas_cons( owner, constraint_name , constraint_type) colunas
        from dba_constraints
       where owner IN ('DBAMV','DBASGU')
         and constraint_type = 'R' ) cons
        minus
      select * from (
           select OWNER,table_name, f_lista_colunas_index(owner , index_name) colunas
            from dba_indexes
            where owner IN ('DBAMV','DBASGU') ) inde ) R , DBA_CONSTRAINTS DC
WHERE R.TABLE_NAME = DC.TABLE_NAME
AND R.COLUNAS = f_lista_colunas_cons( DC.owner, DC.constraint_name , DC.constraint_type)
and dc.constraint_type = 'R'
AND DC.owner IN ('DBAMV','DBASGU') )

/

