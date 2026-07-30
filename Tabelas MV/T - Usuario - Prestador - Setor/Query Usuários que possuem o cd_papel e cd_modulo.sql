-- Query: Usuários que possuem o cd_papel e cd_modulo
SELECT
    u.cd_usuario,
    u.nm_usuario,
    pu.cd_papel,
    p.ds_papel,
    m.cd_modulo,
    m.nm_modulo,
    m.cd_sistema_dono
FROM
    dbasgu.usuarios u
JOIN dbasgu.papel_usuarios pu ON pu.cd_usuario = u.cd_usuario
JOIN dbasgu.papel p ON p.cd_papel = pu.cd_papel
JOIN dbasgu.papel_mod pm ON pm.cd_papel = p.cd_papel
JOIN dbasgu.modulos m ON m.cd_modulo = pm.cd_modulo
WHERE
    m.cd_modulo IN ('M_PRODUTO', 'M_TIPPRE')
ORDER BY
    u.cd_usuario,
    pu.cd_papel,
    m.cd_modulo;
