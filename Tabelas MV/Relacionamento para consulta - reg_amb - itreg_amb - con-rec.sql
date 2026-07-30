SELECT *
FROM reg_amb
where cd_reg_amb = 104283

/

SELECT *
FROM itreg_amb
WHERE cd_atendimento =  1006741
/

SELECT *
FROM reg_fat
WHERE cd_atendimento  =  1006741
/


- Alteração na tabela con_rec -  coluna  cd_historico_padrao


  SELECT *
FROM con_rec
WHERE
    (cd_atendimento = '1009297' AND cd_con_rec = 208129 AND cd_remessa = 206806)
    OR (cd_atendimento = '1022797' AND cd_con_rec = 210679 AND cd_remessa = 208855)
    OR (cd_atendimento = '1032168' AND cd_con_rec = 212731 AND cd_remessa = 210266)
    OR (cd_atendimento = '1059083' AND cd_con_rec = 218363 AND cd_remessa = 214672)
    OR (cd_atendimento = '1063571' AND cd_con_rec = 219238 AND cd_remessa = 215267)
;

-- Update - Tabela CON_REC - Coluna cd_historico_padrao
/*
UPDATE con_rec
SET cd_historico_padrao = 23
WHERE
    (cd_atendimento = '1009297' AND cd_con_rec = 208129 AND cd_remessa = 206806)
    OR (cd_atendimento = '1022797' AND cd_con_rec = 210679 AND cd_remessa = 208855)
    OR (cd_atendimento = '1032168' AND cd_con_rec = 212731 AND cd_remessa = 210266)
    OR (cd_atendimento = '1059083' AND cd_con_rec = 218363 AND cd_remessa = 214672)
    OR (cd_atendimento = '1063571' AND cd_con_rec = 219238 AND cd_remessa = 215267);
*/

SELECT *
FROM reg_amb
WHERE cd_remessa =  62292  AND cd_reg_amb =  1150217
/


-- Relacionamento para consulta - reg_amb \ itreg_amb
SELECT
    c.nm_convenio,
    i.cd_atendimento,
    r.cd_reg_amb,
    r.cd_remessa,
    r.cd_lote_trabalho,
    i.cd_pro_fat,
    i.cd_guia,
    i.sn_fechada,
    i.sn_fatura_impressa,
    r.vl_total_conta,
    i.hr_lancamento,
    i.hr_lancamento_final
FROM dbamv.reg_amb r
JOIN dbamv.itreg_amb i
  ON i.cd_reg_amb = r.cd_reg_amb
JOIN dbamv.convenio c
  ON r.cd_convenio = c.cd_convenio
WHERE i.cd_atendimento = 340120
    AND r.cd_reg_amb = 1150217
    AND r.cd_remessa = 62292
ORDER BY hr_lancamento
FETCH FIRST 100 ROWS ONLY;



-- Relacionamento para consulta - reg_amb \ itreg_amb

SELECT
    -- Dados do REG_AMB (cabeçalho)
    r.cd_reg_amb,
    r.cd_remessa,
    r.cd_convenio,
    r.cd_guia,
    r.dt_lancamento,
    r.dt_lancamento_final,
    r.dt_remessa,
    r.sn_fechada,
    r.sn_fatura_impressa,
    r.vl_total_conta,
    r.vl_acrescimo_conta,
    r.vl_desconto_conta,

    -- Dados do ITREG_AMB (itens)
    i.cd_atendimento,
    i.cd_lancamento,
    i.cd_pro_fat,
    i.cd_convenio        AS cd_convenio_item,
    i.cd_con_pla,
    i.hr_lancamento,
    i.hr_lancamento_final,
    i.dt_sessao,
    i.dt_producao,
    i.e_vl_acrescimo_conta,
    i.fator_relacionado,
    i.cd_prestador,
    i.cd_motivo_glosa,
    i.ds_observacao_franquia

FROM reg_amb r
JOIN itreg_amb i
  ON i.cd_reg_amb = r.cd_reg_amb

WHERE r.cd_remessa  = 62292
  AND r.cd_reg_amb  = 1150217
  AND i.cd_atendimento = 340120;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    FROM DBAMV.ITREG_AMB          IA
    INNER JOIN DBAMV.REG_AMB            RA  ON (RA.CD_REG_AMB = IA.CD_REG_AMB)
    INNER JOIN DBAMV.REMESSA_FATURA     RE  ON (RE.CD_REMESSA = RA.CD_REMESSA)
     LEFT JOIN DBAMV.AGRUPAMENTO        AG  ON (AG.CD_AGRUPAMENTO = RE.CD_AGRUPAMENTO)
    INNER JOIN DBAMV.FATURA             FT  ON (FT.CD_FATURA = RE.CD_FATURA)
    INNER JOIN DBAMV.MULTI_EMPRESAS     ME  ON (ME.CD_MULTI_EMPRESA = FT.CD_MULTI_EMPRESA)
    INNER JOIN DBAMV.CONVENIO           CO  ON (CO.CD_CONVENIO = FT.CD_CONVENIO)
     LEFT JOIN DBAMV.ITFAT_NOTA_FISCAL  INF ON (INF.CD_REG_AMB = IA.CD_REG_AMB AND INF.CD_LANCAMENTO_AMB = IA.CD_LANCAMENTO)
     LEFT JOIN DBAMV.NOTA_FISCAL        NF  ON (NF.CD_NOTA_FISCAL = INF.CD_NOTA_FISCAL)
     LEFT JOIN DBAMV.CON_REC            CR  ON (CR.CD_NOTA_FISCAL = INF.CD_NOTA_FISCAL)
     LEFT JOIN DBAMV.ITCON_REC          IT  ON (IT.CD_CON_REC = CR.CD_CON_REC)
     LEFT JOIN DBAMV.PROCESSO           PR  ON (PR.CD_PROCESSO = CR.CD_PROCESSO)







