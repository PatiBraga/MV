Realizada a adequação da Query para correção das datas das altas contidas na tela do atendimento do internamento: 

SELECT * FROM dbamv.atendime WHERE cd_atendimento = 1042447;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

UPDATE atendime
SET
  dt_alta_medica  = TO_TIMESTAMP('28/06/2025 14:30', 'DD/MM/YYYY HH24:MI'),       -- data alta médica       
  hr_alta_medica  = TO_TIMESTAMP('28/06/2025 14:30', 'DD/MM/YYYY HH24:MI')       -- data hora alta medica
WHERE cd_atendimento = 1042447;


UPDATE atendime
SET
  dt_alta  = TO_TIMESTAMP('28/06/2025 14:30', 'DD/MM/YYYY HH24:MI'),      -- data alta hospitalar         
  hr_alta  = TO_TIMESTAMP('28/06/2025 14:30', 'DD/MM/YYYY HH24:MI')      -- data hora alta hospitalar
WHERE cd_atendimento = 1042447


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;

 