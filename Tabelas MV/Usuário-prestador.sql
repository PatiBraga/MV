-- Usuários\prestador para validar usuaários por perfil para realizar liberação de acesso
SELECT
 --   u.cd_prestador,
    p.nm_prestador,
    u.nm_usuario,
    u.cd_usuario,
    u.cd_cbo,
    u.sn_ativo
FROM usuarios u
INNER JOIN prestador p
    ON u.cd_prestador = p.cd_prestador
WHERE  u.sn_ativo = 'S'
    -- AND u.cd_cbo IN ('223505', '223500')
       AND p.cd_tip_presta = '4'
    -- AND p.tp_situacao = 'A'
ORDER BY p.nm_prestador;
