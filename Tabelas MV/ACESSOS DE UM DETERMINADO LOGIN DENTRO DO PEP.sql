--  ACESSOS DE UM DETERMINADO LOGIN DENTRO DO PEP
-- PW_REGISTRO_AUDITORIA


Essa traz o primeiro e o ultimo acesso dele dentro do pep. Só colocar os usuarios no (IN) e pronto

--------------------------------------------------------------------------------

SELECT
    usuario,
    dia,
    primeiro_acesso,
    ip_primeiro_acesso,
    ultimo_acesso,
    ip_ultimo_acesso
FROM (
    SELECT
        ra.cd_usuario_registro_auditoria AS usuario,
        TRUNC(CAST(ra.tz_registro_auditoria AS DATE)) AS dia,
        FIRST_VALUE(ra.tz_registro_auditoria) OVER (
            PARTITION BY ra.cd_usuario_registro_auditoria,
                         TRUNC(CAST(ra.tz_registro_auditoria AS DATE))
            ORDER BY ra.tz_registro_auditoria
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS primeiro_acesso,
        FIRST_VALUE(ra.nm_maquina_registro_auditoria) OVER (
            PARTITION BY ra.cd_usuario_registro_auditoria,
                         TRUNC(CAST(ra.tz_registro_auditoria AS DATE))
            ORDER BY ra.tz_registro_auditoria
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS ip_primeiro_acesso,
        LAST_VALUE(ra.tz_registro_auditoria) OVER (
            PARTITION BY ra.cd_usuario_registro_auditoria,
                         TRUNC(CAST(ra.tz_registro_auditoria AS DATE))
            ORDER BY ra.tz_registro_auditoria
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS ultimo_acesso,
        LAST_VALUE(ra.nm_maquina_registro_auditoria) OVER (
            PARTITION BY ra.cd_usuario_registro_auditoria,
                         TRUNC(CAST(ra.tz_registro_auditoria AS DATE))
            ORDER BY ra.tz_registro_auditoria
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS ip_ultimo_acesso
    FROM registro_auditoria ra
    WHERE ra.cd_usuario_registro_auditoria IN ('NOME.GUERRA')
      AND ra.tz_registro_auditoria >= TIMESTAMP '2025-12-01 00:00:00'
      AND ra.tz_registro_auditoria <  TIMESTAMP '2025-12-31 00:00:00'
)
GROUP BY
    usuario,
    dia,
    primeiro_acesso,
    ip_primeiro_acesso,
    ultimo_acesso,
    ip_ultimo_acesso
ORDER BY
    usuario,
    dia;

