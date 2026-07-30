-- Query: qual papel que possui o cd_modulos ('M_PRODUTO', 'M_TIPPRE')
SELECT
    p.cd_papel,
    p.ds_papel,
    m.cd_sistema_dono,
    m.cd_modulo,
    m.nm_modulo,
    m.tp_tela,
    m.tp_perfil
FROM
    dbasgu.papel p
JOIN dbasgu.papel_mod pm ON p.cd_papel = pm.cd_papel
JOIN dbasgu.modulos m ON pm.cd_modulo = m.cd_modulo
WHERE
    m.cd_modulo IN ('M_PRODUTO', 'M_TIPPRE')
ORDER BY
    p.cd_papel,
    m.nm_modulo;




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





-- Query: Usuários com acesso aos módulos M_PRODUTO e M_TIPPRE e todos os seus papéis listados
SELECT
    u.cd_usuario,
    u.nm_usuario,
    LISTAGG(DISTINCT pu.cd_papel, ', ') WITHIN GROUP (ORDER BY pu.cd_papel) AS papeis_usuario,
    LISTAGG(DISTINCT p.ds_papel, ', ') WITHIN GROUP (ORDER BY p.ds_papel) AS descricoes_papeis,
    LISTAGG(DISTINCT m.cd_modulo, ', ') WITHIN GROUP (ORDER BY m.cd_modulo) AS modulos_acesso,
    LISTAGG(DISTINCT m.nm_modulo, ', ') WITHIN GROUP (ORDER BY m.nm_modulo) AS nomes_modulos,
    LISTAGG(DISTINCT m.cd_sistema_dono, ', ') WITHIN GROUP (ORDER BY m.cd_sistema_dono) AS sistemas
FROM
    dbasgu.usuarios u
JOIN dbasgu.papel_usuarios pu ON pu.cd_usuario = u.cd_usuario
JOIN dbasgu.papel p ON p.cd_papel = pu.cd_papel
JOIN dbasgu.papel_mod pm ON pm.cd_papel = p.cd_papel
JOIN dbasgu.modulos m ON m.cd_modulo = pm.cd_modulo
WHERE
    m.cd_modulo IN ('M_PRODUTO', 'M_TIPPRE')
GROUP BY
    u.cd_usuario,
    u.nm_usuario
ORDER BY
    u.cd_usuario;

