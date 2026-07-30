-- Divergência de status – Leito

SELECT *
FROM leito
WHERE ds_resumo IN ('A 18', 'A 19')



ALTER TRIGGER DBAMV.CONSISTE_TP_OCUPACAO DISABLE;

UPDATE leito
SET tp_ocupacao = 'V'
WHERE ds_resumo = 'A 18'  AND  cd_leito = 20

ALTER TRIGGER DBAMV.CONSISTE_TP_OCUPACAO ENABLE;

