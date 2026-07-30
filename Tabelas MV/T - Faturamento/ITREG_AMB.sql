-- Validar informações

SELECT * FROM ITREG_AMB
WHERE cd_atendimento = 1009421;

-- Realizar alteração do valor

UPDATE ITREG_AMB
SET vl_total_conta = '700'
WHERE cd_atendimento = '1009421' AND cd_reg_amb = '1010075';

/* OBS.:
-- a alteração é realizada na coluna vl_total_conta
-- realizando a alteração nesta as demais puxam automáticas
*/

SELECT cd_reg_amb, cd_pro_fat,  cd_prestador, cd_convenio, vl_total_conta
FROM ITREG_AMB
WHERE cd_atendimento = 1009421;
