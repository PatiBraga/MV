SELECT pm.ds_evolucao
FROM dbamv.pre_med pm
JOIN (

    SELECT cd_atendimento, MAX(cd_pre_med) AS cd_pre_med
    FROM dbamv.pre_med pm2
    JOIN dbamv.prestador m2 ON pm2.cd_prestador = m2.cd_prestador
    JOIN dbamv.tip_presta tp2 ON m2.cd_tip_presta = tp2.cd_tip_presta
    WHERE pm2.cd_atendimento = 1061006
      AND tp2.nm_tip_presta = 'NUTRICIONISTA'
    GROUP BY cd_atendimento
) ult
ON pm.cd_pre_med = ult.cd_pre_med
JOIN dbamv.prestador m ON pm.cd_prestador = m.cd_prestador
JOIN dbamv.tip_presta tp ON m.cd_tip_presta = tp.cd_tip_presta
/





SELECT ds_evolucao
FROM pre_med , atendime
WHERE
-- atendime.cd_atendimento = pre_med.cd_atendimento
--AND
atendime.cd_atendimento = 1061006
AND ds_evolucao IS NOT NULL
AND ROWNUM = 1
ORDER BY dt_pre_med DESC