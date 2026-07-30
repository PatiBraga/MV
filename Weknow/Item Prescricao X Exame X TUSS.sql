select a.cd_tip_esq, a.cd_tip_presc, a.ds_tip_presc, a.cd_exa_rx, b.ds_exa_rx, b.exa_rx_cd_pro_fat, c.cd_pro_tuss
from tip_presc a, exa_rx b, procedimento_tuss c
where a.cd_exa_rx = b.cd_exa_rx
and b.exa_rx_cd_pro_fat = c.cd_pro_fat (+)
--and a.cd_tip_presc = 29210
and a.sn_ativo = 'S';