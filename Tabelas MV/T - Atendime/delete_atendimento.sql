select * from atendime where cd_atendimento = 1010226;

SELECT * FROM guia
WHERE  cd_atendimento = 1010226;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO enable;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO enable;

DELETE FROM atendime
WHERE cd_paciente = '163817' AND cd_atendimento = '1010226';

DELETE FROM guia
WHERE cd_guia = '696841' AND cd_atendimento = '1010226';


DELETE FROM atendime
WHERE cd_paciente = '163817' AND cd_atendimento = '1010226'


SELECT * FROM itreg_amb
WHERE  cd_atendimento = 1010226;

DELETE FROM itreg_amb
WHERE cd_reg_amb = '1011035' AND cd_atendimento = '1010226';


DELETE FROM atendime
WHERE cd_paciente = '163817' AND cd_atendimento = '1010226'


mov_hosp_atendime_fk
SELECT * FROM   mov_hosp
WHERE  cd_atendimento = 1010226;

DELETE FROM mov_hosp
WHERE cd_mov_hosp = '1689481' AND cd_atendimento = '1010226';

