 -- PROCEDIMENTO EXIGE QUE O PRESTADOR SEJA CNES - CNPJ
UPDATE dbamv.procedimento_detalhe_vigencia
SET  sn_exige_cnes = 'N'
 WHERE cd_procedimento = '0301010048'
 AND sn_exige_cnes = 'S'