/*
-- Confirmar aviso de Cirurgia: Solicitar ao usuários para preencher os campos(vincular atendimento, datas, etc)
pela própria tela de confirmação e a TI só executa a confirmação nessas 3 colunas. Caso as cirurgias forem canceladas
só mudar o status de "R" Realizada para "C" cancelada.
*/

ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO DISABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO DISABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD DISABLE;

UPDATE dbamv.AVISO_CIRURGIA SET TP_SITUACAO = 'R' WHERE cd_aviso_cirurgia in (24);
UPDATE dbamv.AVISO_CIRURGIA SET SN_CONFIRMADO = 'S' WHERE cd_aviso_cirurgia in (24);
UPDATE dbamv.AVISO_CIRURGIA SET CD_USUARIO_CONFIRMA = 'TESTE.TESTE' WHERE cd_aviso_cirurgia in (24);

ALTER TRIGGER DBAMV.TRG_AVISO_CIRURGIA_EVOLUCAO ENABLE;
ALTER TRIGGER DBAMV.TRG_CONSISTE_TP_SITUACAO ENABLE;
ALTER TRIGGER DBAMV.TRG_AVI_CIR_A_UPD ENABLE;