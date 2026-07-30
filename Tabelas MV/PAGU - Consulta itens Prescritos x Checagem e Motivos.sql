SELECT
pre_med.cd_atendimento
,Count (pre_med.cd_atendimento) AS Total
,PRE_MED.CD_PRE_MED
-- ,HRITPRE_CONS.DS_TIP_PRESC
--,HRITPRE_CONS.dh_medicacao
,pre_med.dt_pre_med
-- ,HRITPRE_CONS.dh_checagem
,HRITPRE_CONS.CD_JUSTIFICATIVA_CHECAGEM
,justificativa_checagem.DS_JUSTIFICATIVA_CHECAGEM
,HRITPRE_CONS.nm_usuario
,itpre_med.cd_produto
,produto.ds_produto
,Decode (HRITPRE_CONS.sn_suspenso, 'S', 'Suspenso', 'N' , 'Checado') AS "Situação_Checagem"
--,HRITPRE_CONS.qt_consumo
FROM PRE_MED, ITPRE_MED, HRITPRE_CONS,TIP_PRESC, produto, justificativa_checagem
WHERE 1=1
AND PRE_MED.CD_PRE_MED = ITPRE_MED.CD_PRE_MED
AND HRITPRE_CONS.CD_ITPRE_MED = ITPRE_MED.CD_ITPRE_MED
AND TIP_PRESC.CD_TIP_PRESC = ITPRE_MED.CD_TIP_PRESC
AND justificativa_checagem.CD_JUSTIFICATIVA_CHECAGEM = HRITPRE_CONS.CD_JUSTIFICATIVA_CHECAGEM
-- AND PRE_MED.CD_PRE_MED = 1859454
--AND pre_med.cd_atendimento = 1227862
AND pre_med.cd_pre_med = 1860522 -- Informe o Atendimento
--AND ITPRE_MED.tp_situacao = 'N'
AND produto.cd_produto = itpre_med.cd_produto
AND dh_registro BETWEEN TO_DATE ('27/11/2016','DD-MM-YYYY' ) AND To_Date ('03/12/2016' ,'DD-MM-YYYY')
GROUP BY pre_med.cd_atendimento
,pre_med.dt_pre_med
,itpre_med.cd_produto
,produto.ds_produto
,HRITPRE_CONS.sn_suspenso
-- ,HRITPRE_CONS.dh_medicacao
,HRITPRE_CONS.CD_JUSTIFICATIVA_CHECAGEM
,justificativa_checagem.DS_JUSTIFICATIVA_CHECAGEM
,pre_med.cd_pre_med
,HRITPRE_CONS.dh_checagem
,HRITPRE_CONS.nm_usuario
ORDER BY 8