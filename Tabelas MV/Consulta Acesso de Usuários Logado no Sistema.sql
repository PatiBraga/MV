-- Consulta Acesso de Usuários Logado no Sistema

SELECT
cd_acesso,
cd_usuario,
nm_usuario,
cd_prestador,
maquina,
dt_conexao,
hora_conexao,
dt_desconexao,
hora_desconexao,
cd_sistema_origem,
tela,
dt_acesso_tela,
hora_acesso_tela,
cd_empresa_conexao,
maq_emp
FROM (
SELECT
mla.cd_acesso,
la.cd_usuario,
usuarios.nm_usuario,
usuarios.cd_prestador,
la.maquina,
trunc(la.dt_conexao)dt_conexao,
To_Char(la.dt_conexao, 'hh24:mi') hora_conexao,
trunc(la.dt_desconexao) dt_desconexao,
To_Char(la.dt_desconexao, 'hh24:mi') hora_desconexao,
la.cd_sistema_origem,
mla.cd_modulo tela,
Trunc(mla.dt_acesso) dt_acesso_tela,
To_Char(mla.dt_acesso,'hh24:mi') hora_acesso_tela,
la.cd_empresa_conexao,
la.maquina MAQ_EMP
FROM
dbasgu.log_acesso_mv2000 la,
dbasgu.mod_log_acesso_mv2000 mla,
dbasgu.usuarios
WHERE
mla.cd_acesso = la.cd_acesso
AND la.cd_usuario = usuarios.cd_usuario
AND la.dt_conexao >= To_Date(To_Char(Add_Months(SYSDATE ,- 24),'mm/yyyy'),'mm/yyyy')
AND la.dt_conexao <= last_day(To_Date(To_Char(Add_Months(SYSDATE ,- 0),'mm/yyyy'),'mm/yyyy'))
--AND (MAQUINA <> 'CTI05') AND (MAQUINA <> 'CTI05VM')
)
WHERE
dt_conexao >= To_Date('01/08/2018','dd/mm/yyyy')
--AND dt_conexao <= To_Date('25/11/2015','dd/mm/yyyy')
AND cd_usuario = 'DBAMV'
ORDER BY
dt_conexao DESC,
hora_conexao DESC,
hora_desconexao,
cd_sistema_origem,
tela,
hora_acesso_tela desc