-- log de login do MV

SELECT
    r.CD_USUARIO_REGISTRO_AUDITORIA AS CD_USUARIO,
    u.cd_prestador,
    u.nm_usuario,
    e.ds_especialid,
    TRUNC(r.TZ_REGISTRO_AUDITORIA) AS DIA,
    TO_CHAR(
        MIN(CASE WHEN r.DS_MODULO_AUDITORIA = 'AUTHENTICATION_SGU_SUCCESS'
                 THEN r.TZ_REGISTRO_AUDITORIA END),
        'DD/MM/YYYY HH24:MI:SS'
    ) AS PRIMEIRO_LOGIN,
    TO_CHAR(
        MAX(CASE WHEN r.DS_MODULO_AUDITORIA = 'LOGOUT_SGU_SUCCESS'
                 THEN r.TZ_REGISTRO_AUDITORIA END),
        'DD/MM/YYYY HH24:MI:SS'
    ) AS ULTIMO_LOGOUT
FROM
    registro_auditoria r
    LEFT JOIN usuarios u ON u.cd_usuario = r.CD_USUARIO_REGISTRO_AUDITORIA
    left join prestador p on p.cd_prestador = u.cd_prestador
    left join ESP_MED ep on ep.cd_prestador = p.cd_prestador
    left join especialid e on e.cd_especialid = ep.cd_especialid
WHERE
    r.DS_MODULO_AUDITORIA IN ('AUTHENTICATION_SGU_SUCCESS', 'LOGOUT_SGU_SUCCESS')
    --and p.CD_TIP_PRESTA in ('8', '67', '68', '69', '70', '71','72')
AND TRUNC(r.TZ_REGISTRO_AUDITORIA) BETWEEN TO_DATE('21/08/2025', 'DD/MM/YYYY') AND TO_DATE('22/08/2025', 'DD/MM/YYYY')
GROUP BY
    r.CD_USUARIO_REGISTRO_AUDITORIA,
    u.nm_usuario,
    u.cd_prestador,
    e.ds_especialid,
    TRUNC(r.TZ_REGISTRO_AUDITORIA)
ORDER BY

    DIA DESC,
    PRIMEIRO_LOGIN DESC,
    nm_usuario;