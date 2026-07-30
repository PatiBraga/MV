-- Tabelas DBAMVPw_Perfil_Modulo e Dbmav.Pw_Perfil_Modulo_Parametro
-- Sempre que tu tiver o nome das colunas pode usar se tiver acesso a all_tab_cols

select
  owner,
  table_name,
  column_name
from
  all_tab_cols
where
  upper(column_name) = upper('nome_da_coluna')
order by
  owner,
  table_name;