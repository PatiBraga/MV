SELECT * FROM itreg_fat,reg_fat 
WHERE itreg_fat.cd_reg_fat = reg_fat.cd_reg_fat
      AND cd_atendimento = 1066855
--          10230427
    AND itreg_fat. cd_pro_fat = '10230427'



SELECT *
  FROM guia
 WHERE cd_atendimento   =  1066855
