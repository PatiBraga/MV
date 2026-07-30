select
f.nm_convenio,
h.nm_paciente,
g.dt_atendimento,
a.cd_atendimento,
a.cd_reg_fat,
a.cd_remessa,
a.dt_fechamento,
c.cd_pro_fat,
c.ds_pro_fat,
b.QT_LANCAMENTO, 
b.VL_TOTAL_CONTA,
d.QT_GLOSA,
d.VL_GLOSA,
d.VL_REAPRESENTADO,
e.ds_motivo_glosa,
d.dt_glosa,
NF_RECEBIMENTO.cd_nota_fiscal,
i.CD_CON_REC,
j.DT_EMISSAO DT_EMISSAO_NF,
i.vl_previsto
from REG_FAT a
    LEFT JOIN ITREG_FAT b ON b.cd_reg_fat = a.cd_reg_fat
    LEFT JOIN PRO_FAT c ON b.cd_pro_fat = c.cd_pro_fat
    LEFT OUTER JOIN GLOSAS d ON d.CD_LANCAMENTO_FAT = b.CD_LANCAMENTO AND d.CD_REG_FAT = b.CD_REG_FAT
    LEFT JOIN MOTIVO_GLOSA e ON d.CD_MOTIVO_GLOSA = e.CD_MOTIVO_GLOSA
    LEFT JOIN CONVENIO f ON f.cd_convenio = a.cd_convenio
    LEFT JOIN ATENDIME g ON a.cd_atendimento = g.cd_atendimento
    LEFT JOIN PACIENTE h ON g.cd_paciente = h.cd_paciente
    LEFT JOIN ((select distinct cd_nota_fiscal, cd_reg_fat  from itfat_nota_Fiscal x))NF_RECEBIMENTO ON NF_RECEBIMENTO.cd_reg_fat = a.cd_reg_fat --RETORNA O NUMERO DA NOTA FISCAL DO CONVENIO E RELACIONA COM A CONTA
    LEFT JOIN CON_REC i ON NF_RECEBIMENTO.CD_NOTA_FISCAL = i.CD_NOTA_FISCAL
    LEFT JOIN NOTA_FISCAL j ON j.CD_NOTA_FISCAL = i.CD_NOTA_FISCAL
and i.CD_CON_REC = 	202557   
and NF_RECEBIMENTO.cd_nota_fiscal = 107305