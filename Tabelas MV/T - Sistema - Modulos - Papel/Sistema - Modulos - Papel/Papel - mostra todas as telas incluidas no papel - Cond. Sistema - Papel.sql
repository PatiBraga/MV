-- Papel - mostra todas as telas incluidas no papel -- Cond. Sistema\Papel
SELECT
    p.cd_papel,
    p.ds_papel,
    m.cd_sistema_dono,
    m.cd_modulo,
    m.nm_modulo,
    m.tp_tela,
    m.tp_perfil
  FROM
    DBASGU.papel p
  INNER JOIN
    DBASGU.papel_mod pm ON p.cd_papel = pm.cd_papel
  INNER JOIN
    DBASGU.MODULOS m ON pm.cd_modulo = m.cd_modulo
  -- WHERE m.cd_sistema_dono = 'SGU'
  -- AND p.cd_papel = 157
ORDER BY
    p.cd_papel, m.nm_modulo;