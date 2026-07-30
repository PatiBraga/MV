SELECT tp_pagamento,
       sn_fechada,
       cd_atendimento,
       cd_reg_amb,
       vl_unitario,
       vl_nota,
       cd_convenio,
       cd_setor_produziu,
       cd_setor,
       sn_paciente_paga,
       cd_mvto,
       tp_mvto,
       cd_usuario
FROM itreg_amb
WHERE cd_atendimento IN (
    1168020,
    1166630,
    1168539,
    1169208,
    1169287,
    1166311,
    1168009,
    1167265,
    1169369,
    1166257,
    1165855,
    1167795,
    1166041,
    1166228,
    1168005,
    1166351,
    1169516,
    1165711,
    1167773,
    1168012,
    1166309,
    1168657,
    1169282,
    1165920,
    1166631
);


__________________________________________________________________________________

SELECT *
FROM reg_amb
WHERE cd_remessa IN ('231671', '233736', 232017);


___________________________________________________________________________________

-- SELECT
SELECT *
FROM dbamv.remessa_fatura
WHERE cd_remessa IN ('231671', '233736', 232017);


___________________________________________________________________________________


-- Update para
UPDATE dbamv.remessa_fatura
SET dt_entrega_da_fatura = TO_DATE('22/05/2026', 'DD/MM/YYYY')
WHERE cd_remessa = 232017
  AND cd_fatura   = 8236;
/


UPDATE dbamv.remessa_fatura
SET dt_entrega_da_fatura = NULL
WHERE cd_remessa = 232017
  AND cd_fatura   = 8236;



_____________________________________________________________________________________

-- SELECT para confirmar o registro:
SELECT *
FROM dbamv.remessa_fatura
WHERE cd_remessa = 232017
  AND cd_fatura  = 8236;

