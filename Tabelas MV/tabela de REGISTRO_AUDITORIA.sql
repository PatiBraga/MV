-- tabela de REGISTRO_AUDITORIA

select
a.cd_papel,
c.ds_papel,
a.cd_usuario,
b.nm_usuario,
b.dh_alteracao_usuario

from dbasgu.papel_usuarios a, dbasgu.usuarios b,dbasgu.papel c
where b.sn_ativo='S'
and a.cd_usuario = b.cd_usuario
and a.cd_papel = c.cd_papel
/


SELECT * FROM registro_auditoria
WHERE CD_USUARIO_REGISTRO_AUDITORIA = 'nomeusuario'
AND  DS_MODULO_AUDITORIA  = 'AUTHENTICATION_SGU_SUCCESS'
AND  To_Char(TZ_REGISTRO_AUDITORIA,'YYYY')='2022'