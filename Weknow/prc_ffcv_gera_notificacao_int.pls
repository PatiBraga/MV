create or replace PROCEDURE       prc_ffcv_gera_notificacao_int IS
  nID          NUMBER;
  vMsgErro     VARCHAR2(2000);
  nAtendimento NUMBER;

BEGIN
  FOR REC IN (SELECT CD_CONVENIO
                   , CD_ATENDIMENTO
                   , TP_COMUNICACAO
                   , CD_MULTI_EMPRESA
                FROM DBAMV.COMUNICACAO_BENEFICIARIO
               WHERE TP_STATUS = 'A') LOOP
    -- Inicia as variáveis
    vMsgErro:= NULL;
    nID     := NULL;
    --
    DECLARE
      eERRO EXCEPTION;
    BEGIN
      DBAMV.PKG_MV2000.ATRIBUI_EMPRESA(REC.CD_MULTI_EMPRESA);
      nID := DBAMV.FNC_FFCV_GERA_TISS(REC.CD_CONVENIO                --pCdConvenio in dbamv.convenio.cd_convenio%type
                                     ,'FNC_GERA_NOTIFICACAO_INTERN'    --pNmFuncao   in varchar2
                                     --
                                     ,REC.TP_COMUNICACAO               --pParam1     in varchar2
                                     ,TO_CHAR(REC.CD_ATENDIMENTO)      --pParam3     in varchar2
                                     ,NULL                             --pParam2     in varchar2
                                     ,NULL                             --pParam4     in varchar2
                                     --
                                     ,NULL                             --pParam5     in varchar2
                                     ,NULL                             --pParam6     in varchar2
                                     ,NULL                             --pParam7     in varchar2
                                     ,NULL                             --pParam8     in varchar2
                                     ,NULL                             --pParam9     in varchar2
                                     ,vMsgErro                         --pMsg        out varchar2
                                     ,NULL                             --pReserva    in varchar2
                                     );

      IF vMsgErro IS NOT NULL THEN
        RAISE eERRO;
      END IF;
      --
      DBAMV.PACK_SITE.P_ADD_EVENTO_SITE_TISS(nID,vMsgErro);
      --
      IF DBAMV.PACK_SITE.F_ERRO_XML(nID) OR vMsgErro IS NOT NULL THEN
        vMsgErro:= vMsgErro||CHR(10)||'Erro na construção ou comunicação do XML.'||CHR(10)||'Clique em XML para visualizar o log e seu conteúdo.';
        RAISE eERRO;
      END IF;

      UPDATE DBAMV.COMUNICACAO_BENEFICIARIO
         SET TP_STATUS = 'P'
           , ID_MENSAGEM    = nID
       WHERE CD_ATENDIMENTO = REC.CD_ATENDIMENTO
         AND TP_COMUNICACAO = REC.TP_COMUNICACAO;
      --
      COMMIT;
      --

      EXCEPTION
        WHEN eERRO THEN
          UPDATE DBAMV.COMUNICACAO_BENEFICIARIO
             SET TP_STATUS      = 'E'
               , DS_FALHA       = vMsgErro
               , ID_MENSAGEM    = nID
           WHERE CD_ATENDIMENTO = REC.CD_ATENDIMENTO
             AND TP_COMUNICACAO = REC.TP_COMUNICACAO;
        --
        COMMIT;
        --
      END;
  END LOOP;
  --
END;