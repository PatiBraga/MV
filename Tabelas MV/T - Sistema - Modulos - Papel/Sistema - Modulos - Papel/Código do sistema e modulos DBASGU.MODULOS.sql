-- Código do sistema e modulos DBASGU.MODULOS
SELECT cd_sistema_dono, cd_modulo,nm_modulo, tp_tela, tp_perfil
FROM DBASGU.MODULOS
ORDER BY cd_sistema_dono;
/

-- Pelo cd_modulo tras o sistema
SELECT
    cd_sistema_dono,
    cd_modulo,
    nm_modulo,
    tp_tela,
    tp_perfil
FROM
    DBASGU.MODULOS
WHERE
 -- LOWER(cd_modulo) = 'm_usuario'
    UPPER(cd_modulo) = 'M_USUARIO'
ORDER BY
    cd_sistema_dono;
