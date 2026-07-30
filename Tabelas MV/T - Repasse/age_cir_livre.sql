SELECT * FROM repasse_imagem_sw
WHERE tuss IN (SELECT tuss FROM repasse_imagem_sw GROUP BY tuss HAVING count( * ) >=2 )



SELECT * FROM repasse_imagem_sw
WHERE tuss = 40803074


 delete REPASSE_IMAGEM_SW
 WHERE tuss = 40803074
 AND convenio = 1


 prc_lanca_exames_sw

 call prc_lanca_exames_sw();


 UPDATE itreg_fat SET tp_pagamento = NULL WHERE cd_reg_fat IN (SELECT cd_reg_fat FROM reg_fat WHERE cd_convenio = 8) AND TP_MVTO = 'AUT.SW'