-- Alteração da data e hora de atendimento e pedido
-- Quando for alterar a data de atendimento se atentar se precisa alterar a data de atendimento nas tabela atendime \ ped_rx

SELECT *
  FROM atendime
 WHERE cd_atendimento = 1014257;

SELECT *
  FROM ped_rx
 WHERE cd_atendimento = 1014257;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO DISABLE;

UPDATE atendime
SET
  dt_atendimento = TO_DATE('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_DATE('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1014257;
/
  
UPDATE ped_rx
SET
  dt_pedido = TO_TIMESTAMP('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_pedido = TO_TIMESTAMP('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1014257;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;
ALTER TRIGGER DBAMV.TRG_ITPED_RX_LOG_EXCLUSAO ENABLE;
------------------------------------------------------------------------------
COMMIT;
------------------------------------------------------------------------------

-- Alteração da data e hora de atendimento

SELECT *
  FROM atendime
 WHERE cd_atendimento = 1115441;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

UPDATE atendime
SET
  dt_atendimento = TO_TIMESTAMP('17/12/2025 17:45', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_TIMESTAMP('17/12/2025 17:45', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1115441;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;

------------------------------------------------------------------------------

-- Verificação dos Tipos de Dados das Colunas

SELECT column_name, data_type
FROM user_tab_columns
WHERE table_name = 'ATENDIME';
------------------------------------------------------------------------------

-- Consulta Prévia do Atendimento

SELECT * FROM atendime
WHERE cd_atendimento = 1014257;
------------------------------------------------------------------------------

-- Alteração da Data e Hora do Atendimento
-- Regra de conversão -> Se ambos os campos forem do tipo DATE, utilizar TO_DATE em ambos. Se hr_atendimento for do tipo TIMESTAMP, utilizar TO_TIMESTAMP conforme exemplo abaixo.

-- Opção 1 – Atualização quando dt_atendimento e hr_atendimento são do tipo DATE -> Aplica TO_DATE em ambas as colunas, garantindo compatibilidade com o tipo de dado.

UPDATE atendime
SET
  dt_atendimento = TO_DATE('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_DATE('30/03/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1014257;

------------------------------------------------------------------------------

-- Opção 2 – Atualização quando dt_atendimento é DATE e hr_atendimento é TIMESTAMP -> Aplica TO_DATE na coluna de data e TO_TIMESTAMP na coluna de hora, respeitando o tipo de cada campo.

UPDATE atendime
SET
  dt_atendimento = TO_DATE('29/05/2025 19:05', 'DD/MM/YYYY HH24:MI'),
  hr_atendimento = TO_TIMESTAMP('29/05/2025 19:05', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = 1035657;
------------------------------------------------------------------------------

-- Alteração da Data e Hora do Pedido
-- Regra de conversão -> Se dt_pedido for do tipo TIMESTAMP, utilizar TO_TIMESTAMP. Se hr_pedido for do tipo DATE, utilizar TO_DATE, conforme exemplo abaixo.
-- Atualização considerando dt_pedido como TIMESTAMP e hr_pedido como DATE -> Aplica TO_TIMESTAMP na coluna de data e hora, e TO_DATE na coluna de hora, respeitando o tipo de cada campo.

UPDATE ped_rx
SET
  dt_pedido = TO_TIMESTAMP('12/06/2025 17:36', 'DD/MM/YYYY HH24:MI'),
  hr_pedido = TO_DATE('12/06/2025 17:36', 'DD/MM/YYYY HH24:MI')
WHERE cd_atendimento = '1041961';
