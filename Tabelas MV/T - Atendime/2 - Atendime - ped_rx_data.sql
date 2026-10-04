-- Alterar a data de atendimento

select * 
  from atendime 
where cd_atendimento = 1115441;


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;


UPDATE atendime
SET
  dt_atendimento  = TO_TIMESTAMP('17/12/2025 17:45', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento  = TO_TIMESTAMP('17/12/2025 17:45', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1115441;


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;

---------------------------------------------------------------------------------------------------------------------------------


-- Alterar a data de atendimento

select * 
  from atendime 
where cd_atendimento = 1060179;


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;


UPDATE atendime
SET
  dt_atendimento  = TO_TIMESTAMP('07/08/2025 14:07', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento  = TO_TIMESTAMP('07/08/2025 14:07', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1060179;


ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;


-- Update - data e hora do atendimento - atendime

select * 
  from atendime 
where cd_atendimento = 1014257;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO DISABLE;


UPDATE atendime
SET
  dt_atendimento  = TO_TIMESTAMP('18/06/2025 11:00', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento  = TO_TIMESTAMP('18/06/2025 11:00', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1042017;


--  Para Oracle (usando TO_DATE e TO_TIMESTAMP):]
-- t_atendimento usa TO_DATE se o campo for DATE 
-- hr_atendimento usa TO_TIMESTAMP se for do tipo TIMESTAMP 
-- Se ambos os campos são do tipo DATE, o TO_TIMESTAMP funcionará corretamente, já que ele inclui tanto a data quanto a hora.
UPDATE atendime
SET
  dt_atendimento = TO_DATE('29/05/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_TIMESTAMP('29/05/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1035657;


-- Update - data e hora do pedido ped_rx

SELECT * FROM ped_rx
where cd_atendimento = 1014257;


UPDATE ped_rx
SET
  dt_pedido  = TO_TIMESTAMP('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_pedido  = TO_TIMESTAMP('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1014257;



ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO enable;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO enable;

COMMIT;



UPDATE ped_rx
SET
  dt_pedido = TO_TIMESTAMP('12/06/2025 17:36', 'DD/MM/YYYY HH24:MI'),
  hr_pedido = TO_TIMESTAMP('12/06/2025 17:36', 'DD/MM/YYYY HH24:MI') -- Ajuste se for necessário
WHERE cd_atendimento = '1041961';


-- Quando for alterar a data de atendimento se atentar se precisa alterar a data de atendiimento na 
-- tabela atendime \ped_rx





-- Se hr_pedido for um campo de tipo TIME e você quiser apenas a parte da hora, considere usar a função TO_DATE para atribuir apenas a hora e ignorar a data:
UPDATE ped_rx
SET
  dt_pedido = TO_TIMESTAMP('12/06/2025 17:36', 'DD/MM/YYYY HH24:MI'),
  hr_pedido = TO_DATE('12/06/2025 17:36', 'DD/MM/YYYY HH24:MI') -- Corrigido para hora
WHERE cd_atendimento = '1041961';


-- Opção 1 – Se ambas as colunas forem do tipo DATE:
UPDATE atendime
SET
  dt_atendimento = TO_DATE('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_DATE('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1014257;


-- Opção 2 – Se hr_atendimento for TIMESTAMP e dt_atendimento for DATE:

UPDATE atendime
SET
  dt_atendimento = TO_DATE('29/05/2025 09:03', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_TIMESTAMP('29/05/2025 09:03', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1035657;


-- Dica: Você pode confirmar os tipos com a seguinte consulta:
SELECT column_name, data_type 
FROM user_tab_columns
WHERE table_name = 'ATENDIME';

