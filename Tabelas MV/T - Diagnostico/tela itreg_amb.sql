-- Tela itreg_amb
SELECT *
from itreg_amb
WHERE cd_atendimento = 1017715;


-- UPDATE AJUSTAR COD. DO PRESTADOR
UPDATE itreg_amb
SET cd_prestador = '66'
WHERE cd_atendimento = '1017715'  AND  cd_reg_amb = '1018658';
