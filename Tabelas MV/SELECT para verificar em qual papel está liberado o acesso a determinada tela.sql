/*
SELECT para verificar em qual papel está liberado o acesso a determinada tela
*/

SELECT * FROM  dbasgu.papel
  WHERE cd_papel IN (
 SELECT cd_papel FROM dbasgu.papel_mod
 WHERE cd_modulo = 'R_EST_USUARIO' )
 ORDER BY 1

/*
Select para verificar qual usuário possui o papel
*/
SELECT distinct PAPEL_USUARIOS.cd_usuario FROM  PAPEL_USUARIOS , usuarios , usuario_multi_empresa
  WHERE PAPEL_USUARIOS.cd_usuario = usuarios.cd_usuario
  AND usuarios.cd_usuario = usuario_multi_empresa.cd_id_usuario
  AND PAPEL_USUARIOS.cd_papel IN (158)
  AND usuarios.sn_ativo = 'S'
  AND usuario_multi_empresa.cd_multi_empresa = 4
  ORDER BY 1


/*
Select para verificar em qual sistema está o módulo
*/

SELECT * FROM MOD_SIS
WHERE cd_modulo = 'R_EST_USUARIO'