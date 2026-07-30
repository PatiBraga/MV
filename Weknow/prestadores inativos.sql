select
b.cd_usuario,
a.cd_prestador,
a.nm_prestador,
a.ds_codigo_conselho,
b.dh_alteracao_usuario
from prestador a, usuarios b
where a.CD_TIP_PRESTA = 8
and a.cd_prestador = b.cd_prestador
and b.dh_alteracao_usuario >= '01/01/2023'
and a.ds_codigo_conselho <> '99999'
and b.sn_ativo = 'N';


select * from usuarios