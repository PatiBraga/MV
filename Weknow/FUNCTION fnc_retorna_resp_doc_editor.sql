CREATE OR REPLACE FUNCTION editor_custom.fnc_retorna_resp_doc_editor (pDocumento IN NUMBER := NULL , pAtendimento   IN NUMBER,
                                                                      pCampoPai  IN NUMBER := NULL , pIdentificador IN VARCHAR2 := NULL,
                                                                      pEmpresa   IN NUMBER         , pDt_Criacao    IN DATE     := NULL,  p_tipo in varchar2)

return varchar2 is

     --  Função Resposta documento

  VResult varchar2(4000) := null;

  ----- Resposta a partir do ds_identificador
   cursor cResposta_Met is

  SELECT
         Dbms_Lob.Substr(EDITOR_REGISTRO_CAMPO.lo_conteudo, 4000, 1)
    FROM
         dbamv.PW_DOCUMENTO_CLINICO
       , dbamv.PW_EDITOR_CLINICO
       , editor.EDITOR_REGISTRO
       , editor.EDITOR_REGISTRO_CAMPO
       , editor.EDITOR_CAMPO
       , dbamv.atendime
       , dbamv.multi_empresas
    where
         dbamv.atendime.cd_atendimento                 = dbamv.PW_DOCUMENTO_CLINICO.cd_atendimento
     AND dbamv.PW_EDITOR_CLINICO.cd_documento_clinico  = dbamv.PW_DOCUMENTO_CLINICO.cd_documento_clinico
     AND dbamv.PW_EDITOR_CLINICO.cd_editor_registro    = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_registro      = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_campo         = editor.EDITOR_CAMPO.cd_campo (+)
     and dbamv.multi_empresas.cd_multi_empresa         = dbamv.atendime.cd_multi_empresa

     and atendime.cd_atendimento              = pAtendimento
     and PW_EDITOR_CLINICO.cd_documento       = pDocumento
     and ds_identificador                     = pIdentificador
     and nvl(atendime.cd_multi_empresa, 1)    = pEmpresa
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO');



  ----- Resposta a partir do ds_identificador e com a Data especifica
   cursor cResposta_Met_Dt is

  SELECT
         Dbms_Lob.Substr(EDITOR_REGISTRO_CAMPO.lo_conteudo, 4000, 1)
    FROM
         dbamv.PW_DOCUMENTO_CLINICO
       , dbamv.PW_EDITOR_CLINICO
       , editor.EDITOR_REGISTRO
       , editor.EDITOR_REGISTRO_CAMPO
       , editor.EDITOR_CAMPO
       , dbamv.atendime
       , dbamv.multi_empresas
    where
         dbamv.atendime.cd_atendimento                 = dbamv.PW_DOCUMENTO_CLINICO.cd_atendimento
     AND dbamv.PW_EDITOR_CLINICO.cd_documento_clinico  = dbamv.PW_DOCUMENTO_CLINICO.cd_documento_clinico
     AND dbamv.PW_EDITOR_CLINICO.cd_editor_registro    = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_registro      = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_campo         = editor.EDITOR_CAMPO.cd_campo (+)
     and dbamv.multi_empresas.cd_multi_empresa         = dbamv.atendime.cd_multi_empresa

     and atendime.cd_atendimento              = pAtendimento
     and PW_EDITOR_CLINICO.cd_documento       = pDocumento
     and ds_identificador                     = pIdentificador
     and nvl(atendime.cd_multi_empresa, 1)    = pEmpresa
     AND dh_criacao                           = pDt_Criacao
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO');



  ----- Resposta a resposta especifica do ultimo documento preenchido
   cursor cUltima_Resp IS

  SELECT
         Dbms_Lob.Substr(EDITOR_REGISTRO_CAMPO.lo_conteudo, 4000, 1)
    FROM
         dbamv.PW_DOCUMENTO_CLINICO
       , dbamv.PW_EDITOR_CLINICO
       , editor.EDITOR_REGISTRO
       , editor.EDITOR_REGISTRO_CAMPO
       , editor.EDITOR_CAMPO
       , dbamv.atendime
       , dbamv.multi_empresas
    where
         dbamv.atendime.cd_atendimento                 = dbamv.PW_DOCUMENTO_CLINICO.cd_atendimento
     AND dbamv.PW_EDITOR_CLINICO.cd_documento_clinico  = dbamv.PW_DOCUMENTO_CLINICO.cd_documento_clinico
     AND dbamv.PW_EDITOR_CLINICO.cd_editor_registro    = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_registro      = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_campo         = editor.EDITOR_CAMPO.cd_campo (+)
     and dbamv.multi_empresas.cd_multi_empresa         = dbamv.atendime.cd_multi_empresa

     and atendime.cd_atendimento              = pAtendimento
     and PW_EDITOR_CLINICO.cd_documento       = pDocumento
     and ds_identificador                     = pIdentificador
     and nvl(atendime.cd_multi_empresa, 1)    = pEmpresa
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
     AND dh_criacao IN (SELECT Max(dh_criacao) FROM dbamv.PW_DOCUMENTO_CLINICO     pdc2
                                                  , dbamv.PW_EDITOR_CLINICO        pec2
                                                  , editor.EDITOR_REGISTRO         er2
                                                  , editor.EDITOR_REGISTRO_CAMPO   erc2
                                                  , editor.EDITOR_CAMPO            ec2
                                                  , dbamv.atendime                 ate2
                                              WHERE
                                                    ate2.cd_atendimento          = pdc2.cd_atendimento
                                                AND pec2.cd_documento_clinico    = pdc2.cd_documento_clinico
                                                AND pec2.cd_editor_registro      = er2.cd_registro
                                                AND erc2.cd_registro             = er2.cd_registro
                                                AND erc2.cd_campo                = ec2.cd_campo (+)
                                                AND pec2.cd_documento   = pw_editor_clinico.cd_documento
                                                AND ate2.cd_atendimento = atendime.cd_atendimento
                                                and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')   );



  ----- Horário de criação do último documento preenchido
  cursor cUltima_Dtdoc is

  SELECT
         Max(dh_criacao) dt_doc
    FROM
         dbamv.PW_DOCUMENTO_CLINICO
       , dbamv.PW_EDITOR_CLINICO
       , editor.EDITOR_REGISTRO
       , editor.EDITOR_REGISTRO_CAMPO
       , editor.EDITOR_CAMPO
       , dbamv.atendime
       , dbamv.multi_empresas
    where
         dbamv.atendime.cd_atendimento                 = dbamv.PW_DOCUMENTO_CLINICO.cd_atendimento
     AND dbamv.PW_EDITOR_CLINICO.cd_documento_clinico  = dbamv.PW_DOCUMENTO_CLINICO.cd_documento_clinico
     AND dbamv.PW_EDITOR_CLINICO.cd_editor_registro    = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_registro      = editor.EDITOR_REGISTRO.cd_registro
     AND editor.EDITOR_REGISTRO_CAMPO.cd_campo         = editor.EDITOR_CAMPO.cd_campo (+)
     and dbamv.multi_empresas.cd_multi_empresa         = dbamv.atendime.cd_multi_empresa

     and atendime.cd_atendimento             = pAtendimento
     and PW_EDITOR_CLINICO.cd_documento      = pDocumento
     and nvl(atendime.cd_multi_empresa, 1)   = pEmpresa
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO');





BEGIN

  if p_tipo = 'RESPOSTA_MET' then
    open cResposta_Met;
    fetch cResposta_Met into vResult;
    close cResposta_Met;
  end if;

   if p_tipo = 'RESPOSTA_MET_DT' then
    open cResposta_Met_Dt;
    fetch cResposta_Met_Dt into vResult;
    close cResposta_Met_Dt;
  end if;

  if p_tipo = 'ULTIMA_RESP_MET' then
    open cUltima_Resp;
    fetch cUltima_Resp into vResult;
    close cUltima_Resp;
  end if;


  if p_tipo = 'ULTIMA_DT_DOC' then
    open cUltima_Dtdoc;
    fetch cUltima_Dtdoc into vResult;
    close cUltima_Dtdoc;
  end if;



return VResult;
end;
/

GRANT EXECUTE ON editor_custom.fnc_retorna_resp_doc_editor TO dbaps;
GRANT EXECUTE ON editor_custom.fnc_retorna_resp_doc_editor TO dbasgu;
GRANT EXECUTE ON editor_custom.fnc_retorna_resp_doc_editor TO mv2000;
GRANT EXECUTE ON editor_custom.fnc_retorna_resp_doc_editor TO mvintegra;
GRANT EXECUTE ON editor_custom.fnc_retorna_resp_doc_editor TO editor;
GRANT EXECUTE ON editor_custom.fnc_retorna_resp_doc_editor TO editor_custom;