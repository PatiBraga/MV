--  Itens de prescrição
select t.cd_tip_presc, t.cd_tip_esq, t.ds_tip_presc
from dbamv.tip_presc t
where t.cd_tip_esq IN ('PEN','PME')
AND t.SN_ATIVO = 'S'
ORDER BY t.CD_TIP_ESQ,t.DS_TIP_PRESC