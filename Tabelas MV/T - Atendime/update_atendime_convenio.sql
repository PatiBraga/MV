-- Atendimento 991708 NEUSA SETSUKO GOMI , para particular . 

SELECT * FROM atendime
WHERE cd_atendimento = 991708


SELECT cd_convenio, nm_convenio FROM convenio
order BY cd_convenio ASC;


-- Verificar código do convenio PARTICULAR -- código 40
SELECT cd_convenio, nm_convenio FROM convenio
WHERE nm_convenio = 'PARTICULAR';


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;


UPDATE ATENDIME
  SET cd_convenio = 40
WHERE cd_atendimento = '991708' AND cd_paciente = '68145';


-- ped_lab
SELECT * 
  FROM ped_Lab
WHERE cd_atendimento = '991708';

ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_PEDIDO_EXAME DISABLE;

UPDATE  ped_Lab
  SET cd_convenio = 40
WHERE cd_atendimento = '991708'

ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_PEDIDO_EXAME ENABLE;


-- Verificar integração 
SELECT * 
FROM DBAMV.CONFIG_INTEGRACAO
WHERE CD_EMPRESA = (SELECT CD_EMPRESA FROM ATENDIME WHERE CD_ATENDIMENTO = '991708');


-- Verificar se o convenio 40 tem vinculo com a integração 
SELECT * 
FROM DBAMV.CONFIG_INTEGRACAO_CONVENIO
WHERE CD_CONVENIO = 40;

