SELECT *
FROM atendime
ORDER BY cd_atendimento desc
FETCH first 100 ROWS only
/

SELECT *
FROM atendime
WHERE TRUNC(dt_atendimento) BETWEEN TO_DATE('01/03/2026', 'DD/MM/YYYY')
                                 AND TO_DATE('12/03/2026', 'DD/MM/YYYY')
                             --    AND cd_prestador = '401'
ORDER BY cd_atendimento DESC
FETCH FIRST 300 ROWS ONLY;
/

-- Desabilitar o trigger
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;


UPDATE atendime
SET cd_prestador = 145
WHERE cd_atendimento = 1142321
AND cd_paciente = 267702;


-- Para reabilitar quando necessário
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;




