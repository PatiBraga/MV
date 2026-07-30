INSERT INTO USUARIO_UNID_INT x
SELECT 
NULL,
b.cd_usuario,
24,
'S',
'S',
'S',
'S',
'S',
'S',
'S',
'S',
'S',
'S',
'S'
from perfil_ambulatorial_prestador a, usuarios b
where a.cd_perfil_ambulatorial = 103
and a.cd_prestador = b.cd_prestador;