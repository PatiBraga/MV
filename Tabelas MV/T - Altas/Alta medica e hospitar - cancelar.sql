SELECT *
     -- cd_mot_alt,
     --  dt_alta_medica,
     --   hr_alta_medica
FROM dbamv.atendime WHERE cd_atendimento in ('1178924', '1178531');



SELECT cd_mot_alt,
       dt_alta_medica,
       hr_alta_medica
FROM dbamv.atendime WHERE cd_atendimento = 1178924 and cd_paciente = 84935;




SELECT cd_atendimento,
       cd_paciente,
       cd_mot_alt,
       TO_CHAR(dt_alta_medica, 'DD/MM/YYYY') AS dt_alta_medica,
       hr_alta_medica
FROM dbamv.atendime
WHERE cd_atendimento = 1178924
  AND cd_paciente    = 84935;

/

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

UPDATE dbamv.atendime
SET cd_mot_alt     = NULL,
    dt_alta_medica = NULL,
    hr_alta_medica = NULL
WHERE cd_atendimento = 1178924
  AND cd_paciente    = 84935;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;






