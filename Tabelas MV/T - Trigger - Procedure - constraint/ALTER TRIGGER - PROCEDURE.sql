=================================================
-- TRIGGER \ PROCEDURE
=================================================

trigger_name             status  table_name
TRG_IMVW_OUT_ATENDIMENTO ENABLED ATENDIME

=================================================

trigger_name             status  table_name
TRG_IMVW_SAI_ATENDIMENTO ENABLED ATENDIME

=================================================
-- 1. DESABILITAR O TRIGGER

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO DISABLE;

=================================================
-- 2. EXECUTAR A PROCEDURE

EXEC MVINTEGRA.PRC_IMVW_SAI_ATENDIMENTO;

=================================================
-- 3. REABILITAR O TRIGGER

ALTER TRIGGER MVINTEGRA.TRG_IMVW_SAI_ATENDIMENTO ENABLE;

=================================================

Explicação do fluxo:

Etapa	Comando	Descrição
1 -	DISABLE	Suspende o trigger para que ele não interfira na execução da procedure
2 -	EXEC	Executa a procedure PRC_IMVW_SAI_ATENDIMENTO sem o disparo automático do trigger
3 -	ENABLE	Reativa o trigger, restaurando o comportamento original do ambiente


Pontos de atenção:

O ALTER TRIGGER é um comando DDL, portanto realiza auto-commit implicitamente no Oracle — não é possível revertê-lo via ROLLBACK.
Certifique-se de sempre reabilitar o trigger após a execução da procedure para não comprometer a integridade dos dados e a regra de negócio associada.
Para verificar o status do trigger antes e após a execução, utilize:
sql
Copiar

SELECT TRIGGER_NAME,
       STATUS,
       TABLE_NAME
FROM   ALL_TRIGGERS
WHERE  OWNER        = 'MVINTEGRA'
AND    TRIGGER_NAME IN  ('TRG_IMVW_SAI_ATENDIMENTO', 'TRG_IMVW_OUT_ATENDIMENTO');
