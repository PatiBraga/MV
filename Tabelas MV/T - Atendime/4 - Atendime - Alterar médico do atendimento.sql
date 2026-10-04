-- Alterar médico do Atendimento

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

UPDATE atendime
SET   cd_prestador   = 2845
WHERE cd_atendimento = 1126786
  AND cd_paciente    = 130579;

UPDATE atendime
SET   cd_prestador   = 2845
WHERE cd_atendimento = 1125578
  AND cd_paciente    = 311099;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;
--------------------------------------------------------------------------

-- Título: Consulta dos Últimos 100 Atendimentos Registrados

SELECT *
FROM   atendime
ORDER BY cd_atendimento DESC
FETCH FIRST 100 ROWS ONLY;
--------------------------------------------------------------------------

-- Título: Consulta de Atendimentos por Período

SELECT *
FROM   atendime
WHERE  TRUNC(dt_atendimento) BETWEEN TO_DATE('01/03/2026', 'DD/MM/YYYY')
                                 AND TO_DATE('12/03/2026', 'DD/MM/YYYY')
--                               AND cd_prestador = 401
ORDER BY cd_atendimento DESC
FETCH FIRST 300 ROWS ONLY;
--------------------------------------------------------------------------

-- Título: Alteração do Médico Responsável no Atendimento

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

UPDATE atendime
SET   cd_prestador   = 145
WHERE cd_atendimento = 1142321
  AND cd_paciente    = 267702;

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;
--------------------------------------------------------------------------

-- Título: Validação do Status das Triggers
-- Confirmação do status de habilitação das triggers após as operações -> Verifica se as triggers foram reabilitadas corretamente ao final de cada script.

SELECT owner,
       trigger_name,
       status
FROM   all_triggers
WHERE  trigger_name IN ('TRG_IMVW_SAI_ATENDIMENTO', 'TRG_IMVW_OUT_ATENDIMENTO');
