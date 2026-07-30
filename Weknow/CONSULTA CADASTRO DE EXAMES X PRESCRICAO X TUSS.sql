select a.cd_tip_esq, decode(a.cd_tip_esq,'EXA','EXAMES INTERNOS','EXE','EXAMES EXTERNOS','LAB','LABORATORIO') TIPO_EXAME, a.cd_tip_presc COD_ITEM_PRESCRICAO, a.cd_exa_rx COD_EXAME, a.ds_tip_presc DESCRICAO_ITEM_PRESCRICAO, b.exa_rx_cd_pro_fat PRO_FAT, wm_concat(d.nm_set_exa)SETOR_EXECUCAO_EXAME, e.cd_tuss CD_TUSS
from tip_presc a, exa_rx b, exa_set c, set_exa d, tuss e
where a.sn_ativo = 'S'
and a.cd_exa_rx = b.cd_exa_rx (+)
and b.cd_exa_rx = c.cd_exa_rx (+)
and c.cd_set_exa = d.cd_set_exa (+)
and b.exa_rx_cd_pro_fat = e.cd_pro_fat (+)
and a.cd_tip_esq in ('EXE','EXA','LAB')
group by a.cd_tip_esq, decode(a.cd_tip_esq,'EXA','EXAMES INTERNOS','EXE','EXAMES EXTERNOS','LAB','LABORATORIO'), a.cd_tip_presc, a.cd_exa_rx, a.ds_tip_presc, b.exa_rx_cd_pro_fat, e.cd_tuss
;
--and a.cd_tip_presc = 29210;


select *
from tip_presc
where cd_tip_esq = 'LAB'
and sn_ativo = 'S'
;