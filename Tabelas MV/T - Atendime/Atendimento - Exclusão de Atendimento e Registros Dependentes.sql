-- Consulta dos dados do atendimento
SELECT * FROM atendime
WHERE cd_atendimento = 1010226;
-----------------------------------------------------------------------------

-- Consulta das guias vinculadas ao atendimento
SELECT * FROM guia
WHERE cd_atendimento = 1010226;
-----------------------------------------------------------------------------

-- Consulta dos registros de regulação ambulatorial vinculados ao atendimento
SELECT * FROM itreg_amb
WHERE cd_atendimento = 1010226;
-----------------------------------------------------------------------------

-- Consulta dos registros de movimentação hospitalar vinculados ao atendimento -- tabela mov_hosp possui chave estrangeira mov_hosp_atendime_fk referenciando atendime
SELECT * FROM mov_hosp
WHERE cd_atendimento = 1010226;
-----------------------------------------------------------------------------

-- Desabilitação temporária das triggers de integração
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;
-----------------------------------------------------------------------------

-- Exclusão da guia vinculada ao atendimento
DELETE FROM guia
WHERE cd_guia = '696841' AND cd_atendimento = '1010226';
-----------------------------------------------------------------------------

-- Exclusão do registro de regulação ambulatorial vinculado ao atendimento
DELETE FROM itreg_amb
WHERE cd_reg_amb = '1011035' AND cd_atendimento = '1010226';
-----------------------------------------------------------------------------

-- Exclusão do registro de movimentação hospitalar vinculado ao atendimento - mov_hosp_atendime_fk
DELETE FROM mov_hosp
WHERE cd_mov_hosp = '1689481' AND cd_atendimento = '1010226';
-----------------------------------------------------------------------------

-- Exclusão do atendimento
DELETE FROM atendime
WHERE cd_paciente = '163817' AND cd_atendimento = '1010226';
-----------------------------------------------------------------------------

-- Reabilitação das triggers de integração
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;
-----------------------------------------------------------------------------

-- Validação do status das triggers -> Confirma se as triggers foram reabilitadas corretamente ao final do processo.
SELECT owner,
       trigger_name,
       status
FROM   all_triggers
WHERE  trigger_name IN ('TRG_IMVW_SAI_ATENDIMENTO', 'TRG_IMVW_OUT_ATENDIMENTO');

