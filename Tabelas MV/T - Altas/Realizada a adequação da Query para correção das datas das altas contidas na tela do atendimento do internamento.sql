 Realizada a adequação da Query para correção das datas das altas contidas na tela do atendimento do internamento:

-- Consulta de validação prévia do registro
SELECT * FROM dbamv.atendime WHERE cd_atendimento = 1157432;

-- Desabilitação temporária das Triggers de integração
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

-- Atualização do horário da alta médica
UPDATE atendime
SET
  dt_alta_medica = TO_TIMESTAMP('16/04/2026 16:35', 'DD/MM/YYYY HH24:MI'),  -- Data/hora da alta médica
  hr_alta_medica = TO_TIMESTAMP('16/04/2026 16:35', 'DD/MM/YYYY HH24:MI')   -- Hora da alta médica
WHERE cd_atendimento = 1157432;

-- Atualização do horário da alta hospitalar
UPDATE atendime
SET
  dt_alta = TO_TIMESTAMP('16/04/2026 16:35', 'DD/MM/YYYY HH24:MI'),         -- Data/hora da alta hospitalar
  hr_alta = TO_TIMESTAMP('16/04/2026 16:35', 'DD/MM/YYYY HH24:MI')          -- Hora da alta hospitalar
WHERE cd_atendimento = 1157432;

-- Reabilitação das Triggers de integração
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;

