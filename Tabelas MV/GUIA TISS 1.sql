  --  TISS_GUIA
-- 18/03/2026 - ATUAL COM ERRO
-- Guia - 6391942
-- Remessa - 227541

-- EXEMPLO:
-- REMESSA 220303


SELECT DISTINCT (cd_atendimento) FROM itreg_amb
WHERE cd_reg_amb IN (
SELECT cd_reg_amb FROM reg_amb
WHERE cd_remessa = 227541);

-----------------------------------------------------------------------
-- REMESSA 227541
SELECT cd_atendimento, tp_atendimento, cd_guia
FROM tiss_guia
WHERE nr_guia IN ('6391942', '1510169340', '1511089480',
                  '1506454825', '1507780858', '1509833827',
                  '1510105775', '1506170630');

-----------------------------------------------------------------------
-- REMESSA 220303
SELECT cd_atendimento, tp_atendimento, cd_guia
FROM tiss_guia
WHERE cd_atendimento IN ('1096331',
                   '1096140');


-----------------------------------------------------------------------

-- Desabilitar duas triggers no schema MVINTEGRA
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;



 UPDATE atendime
      SET tp_atendimento_tiss = NULL
    WHERE tp_atendimento_tiss IS NOT NULL
      AND cd_atendimento IN (1137673, 1137428, 1137749, 1137506, 1137344, 1137324, 1137379);

-- Confirma a alteração (COMMIT)
 --  COMMIT;


-- Reabilita as duas triggers
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;


--------------------------------------------------------------------
