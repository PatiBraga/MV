SELECT * FROM itreg_amb  WHERE cd_setor_produziu IS null AND cd_reg_amb IN
(SELECT  cd_reg_amb FROM reg_amb WHERE cd_remessa = 207531 )