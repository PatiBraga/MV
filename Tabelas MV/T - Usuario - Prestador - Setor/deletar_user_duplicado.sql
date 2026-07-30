SELECT * FROM dbamv.laudo_rx

DELETE usuario_unid_int WHERE cd_id_usuario = 'THALITA.GONCALVES'
DELETE usuario_multi_empresa WHERE cd_id_usuario = 'THALITA.GONCALVES' 
DELETE  usu_estoque WHERE cd_id_usuario = 'THALITA.GONCALVES' 
DELETE dbasgu.aut_mod WHERE cd_id_usuario = 'THALITA.GONCALVES'  
DELETE papel_usuarios WHERE cd_id_usuario = 'THALITA.GONCALVES'  
DELETE usuario_unid_atendimento WHERE cd_id_usuario = 'THALITA.GONCALVES