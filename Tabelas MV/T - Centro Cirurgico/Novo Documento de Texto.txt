-- Confirmação de Aviso de Cirurgia — Atualização Restrita de Status, Confirmação e Usuário
/*
Observação: solicitar aos usuários o preenchimento dos campos (vínculo de atendimento, datas, etc.) diretamente pela tela de confirmação. A TI deve executar a confirmação apenas nas 3 colunas abaixo. Em caso de cancelamento, alterar apenas o status de "R" (Realizada) para "C" (Cancelada).
*/

-- Validação do status das triggers antes da alteração
SELECT trigger_name, status
  FROM all_triggers
 WHERE trigger_name IN (
       'TRG_AVISO_CIRURGIA_EVOLUCAO',
       'TRG_CONSISTE_TP_SITUACAO',
       'TRG_AVI_CIR_A_UPD'
 );
-------------------------------------------------------------------------

-- Desabilitação das triggers de integração
ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO DISABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO DISABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD DISABLE;

-- Atualização do status da cirurgia
UPDATE DBAMV.AVISO_CIRURGIA
   SET TP_SITUACAO = 'R'
 WHERE cd_aviso_cirurgia IN (incluir nº do aviso);

-- Atualização da confirmação da cirurgia
UPDATE DBAMV.AVISO_CIRURGIA
   SET SN_CONFIRMADO = 'S'
 WHERE cd_aviso_cirurgia IN ((incluir nº do aviso)

-- Atualização do usuário responsável pela confirmação
UPDATE DBAMV.AVISO_CIRURGIA
   SET CD_USUARIO_CONFIRMA = 'incluir cd do usuário'
 WHERE cd_aviso_cirurgia IN (incluir nº do aviso)

-- Reabilitação das triggers de integração
ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO ENABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO ENABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD ENABLE;
-------------------------------------------------------------------------

-- Validação do status das triggers após a alteração
SELECT trigger_name, status
  FROM all_triggers
 WHERE trigger_name IN (
       'TRG_AVISO_CIRURGIA_EVOLUCAO',
       'TRG_CONSISTE_TP_SITUACAO',
       'TRG_AVI_CIR_A_UPD'
 );

-------------------------------------------------------------------------------------------------------------

-- CONFIRMAÇÃO DO AVISO DE CIRURGICO SEM INCLUIR NA QUERY, APARECE POP-UP NA TELA PARA PREENCHER

-- Título: Confirmação de Aviso de Cirurgia (Parametrizado)

-- Validação do status das triggers antes da alteração
SELECT trigger_name, status
  FROM all_triggers
 WHERE trigger_name IN (
       'TRG_AVISO_CIRURGIA_EVOLUCAO',
       'TRG_CONSISTE_TP_SITUACAO',
       'TRG_AVI_CIR_A_UPD'
 );

-- Desabilitação das triggers de integração
ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO DISABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO DISABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD DISABLE;

-- Atualização do status da cirurgia
UPDATE DBAMV.AVISO_CIRURGIA
   SET TP_SITUACAO = 'R'
 WHERE cd_aviso_cirurgia = &p_cd_aviso_cirurgia;

-- Atualização da confirmação da cirurgia
UPDATE DBAMV.AVISO_CIRURGIA
   SET SN_CONFIRMADO = 'S'
 WHERE cd_aviso_cirurgia = &p_cd_aviso_cirurgia;

-- Atualização do usuário responsável pela confirmação
UPDATE DBAMV.AVISO_CIRURGIA
   SET CD_USUARIO_CONFIRMA = 'TESTE.TESTE'
 WHERE cd_aviso_cirurgia = &p_cd_aviso_cirurgia;

-- Reabilitação das triggers de integração
ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO ENABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO ENABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD ENABLE;

-- Validação do status das triggers após a alteração
SELECT trigger_name, status
  FROM all_triggers
 WHERE trigger_name IN (
       'TRG_AVISO_CIRURGIA_EVOLUCAO',
       'TRG_CONSISTE_TP_SITUACAO',
       'TRG_AVI_CIR_A_UPD'
 );
-------------------------------------------------------------------------------------------------------------

ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO DISABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO DISABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD DISABLE;
/
UPDATE dbamv.AVISO_CIRURGIA 
SET TP_SITUACAO = 'R' 
WHERE cd_aviso_cirurgia in (24);
/
UPDATE dbamv.AVISO_CIRURGIA 
SET SN_CONFIRMADO = 'S' 
WHERE cd_aviso_cirurgia in (24);
/
UPDATE dbamv.AVISO_CIRURGIA 
SET CD_USUARIO_CONFIRMA = 'TESTE.TESTE' 
WHERE cd_aviso_cirurgia in (24);
/
ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO ENABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO ENABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD ENABLE;
