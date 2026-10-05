-- Alteração de Convênio para Particular 

-- Consulta do atendimento
SELECT * 
  FROM ATENDIME
 WHERE cd_atendimento = 991708;
---------------------------------------------------------

-- Verificação do código do convênio PARTICULAR
SELECT cd_convenio, nm_convenio 
  FROM CONVENIO
 WHERE nm_convenio = 'PARTICULAR';
-- Resultado esperado: código 40
---------------------------------------------------------

-- Validação do status das triggers antes da alteração
SELECT trigger_name, status 
  FROM all_triggers 
 WHERE trigger_name IN (
       'TRG_IMVW_SAI_ATENDIMENTO',
       'TRG_IMVW_OUT_ATENDIMENTO',
       'TRG_IMVW_OUT_PEDIDO_EXAME'
 );
---------------------------------------------------------

-- Desabilitação das triggers de integração (ATENDIME)
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO DISABLE;

-- Atualização do convênio no atendimento
UPDATE ATENDIME
   SET cd_convenio = 40
 WHERE cd_atendimento = '991708'
   AND cd_paciente   = '68145';

-- Reabilitação das triggers de integração (ATENDIME)
ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_ATENDIMENTO ENABLE;
---------------------------------------------------------

-- Consulta dos pedidos de exame vinculados ao atendimento
SELECT * 
  FROM PED_LAB
 WHERE cd_atendimento = '991708';
---------------------------------------------------------

-- Desabilitação da trigger de integração (PED_LAB)
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_PEDIDO_EXAME DISABLE;

-- Atualização do convênio nos pedidos de exame
UPDATE PED_LAB
   SET cd_convenio = 40
 WHERE cd_atendimento = '991708';

-- Reabilitação da trigger de integração (PED_LAB)
ALTER TRIGGER MVINTEGRA.TRG_IMVW_OUT_PEDIDO_EXAME ENABLE;
---------------------------------------------------------

-- Validação do status das triggers após a alteração
SELECT trigger_name, status 
  FROM all_triggers 
 WHERE trigger_name IN (
       'TRG_IMVW_SAI_ATENDIMENTO',
       'TRG_IMVW_OUT_ATENDIMENTO',
       'TRG_IMVW_OUT_PEDIDO_EXAME'
 );
---------------------------------------------------------

-- Verificação da integração da empresa vinculada ao atendimento
SELECT * 
  FROM DBAMV.CONFIG_INTEGRACAO
 WHERE CD_EMPRESA = (
       SELECT CD_EMPRESA 
         FROM ATENDIME 
        WHERE CD_ATENDIMENTO = '991708'
 );
---------------------------------------------------------

-- Verificação do vínculo do convênio 40 com a integração
SELECT * 
  FROM DBAMV.CONFIG_INTEGRACAO_CONVENIO
 WHERE CD_CONVENIO = 40;
