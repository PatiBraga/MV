-- Usuários por papel
SELECT cd_usuario, cd_papel, tp_papel, sn_usuario_master
FROM papel_usuarios;

SELECT * FROM papel_usuarios
WHERE cd_papel = 157;

-- Usuários
SELECT cd_usuario, nm_usuario, ds_observacao, sn_ativo
FROM usuarios;

-- Filtro - usuários por papel ativos
SELECT
    pu.cd_usuario,
    u.nm_usuario,
    pu.cd_papel,
    pu.tp_papel,
    pu.sn_usuario_master,
    u.ds_observacao,
    u.sn_ativo
FROM
    papel_usuarios pu
INNER JOIN
    usuarios u ON pu.cd_usuario = u.cd_usuario
WHERE
    u.sn_ativo = 'S'
    AND pu.cd_papel = 157
ORDER BY
    pu.cd_usuario;





