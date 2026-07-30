SELECT * 
FROM ITCON_REC


SELECT *
FROM REG_AMB
WHERE cd_reg_amb = '1076218';



SELECT *
FROM ITREG_AMB
WHERE cd_atendimento = '1072065';


SELECT *
FROM dbamv.remessa_fatura
WHERE cd_remessa =  216414


SELECT cd_atendimento, 
       cd_con_rec, 
       dt_emissao, 
       tp_con_rec,  
       ds_con_rec,   
       vl_previsto,   
       cd_remessa,   
       cd_reg_amb  
FROM CON_REC
WHERE cd_atendimento = '1072065';



SELECT *
FROM ITCON_REC
WHERE cd_con_rec = '228946'

