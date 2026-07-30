Paciente: AARON YOICHI CHIKAZAWA FRANCA
Prontuario: 340094
/

SELECT *
FROM dbamv.paciente
WHERE
    -- Nome completo exato (como fallback)
    UPPER(nm_paciente) = 'AARON YOICHI CHIKAZAWA FRANCA'

    -- Nome começando com "AARON"
    OR UPPER(nm_paciente) LIKE 'AARON%'

    -- Nome contendo "YOICHI"
    OR UPPER(nm_paciente) LIKE '%YOICHI%'

    -- Nome contendo "CHIKAZAWA"
    OR UPPER(nm_paciente) LIKE '%CHIKAZAWA%'

    -- Nome contendo "FRANCA"
    OR UPPER(nm_paciente) LIKE '%FRANCA%'

    -- Nome contendo partes combinadas
    OR UPPER(nm_paciente) LIKE '%AARON%YOICHI%'
    OR UPPER(nm_paciente) LIKE '%YOICHI%CHIKAZAWA%'
    OR UPPER(nm_paciente) LIKE '%CHIKAZAWA%FRANCA%'

    -- Nome contendo todas as partes, em qualquer ordem
    OR (
        UPPER(nm_paciente) LIKE '%AARON%'
        AND UPPER(nm_paciente) LIKE '%YOICHI%'
        AND UPPER(nm_paciente) LIKE '%CHIKAZAWA%'
        AND UPPER(nm_paciente) LIKE '%FRANCA%'
    )






SELECT *
FROM dbamv.paciente
WHERE nm_paciente = 'AARON YOICHI CHIKAZAWA FRANCA'
/


SELECT *
FROM dbamv.atendime
WHERE cd_paciente = '26661'
/


SELECT *
FROM dbamv.pw_documento_clinico
WHERE cd_paciente = '26661'
/


SELECT *
FROM dbamv.pw_prontuario
WHERE cd_paciente = '340094'

