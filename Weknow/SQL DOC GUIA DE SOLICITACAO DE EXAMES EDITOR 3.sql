SELECT
         atendime.cd_atendimento
        ,Dbms_Lob.Substr(EDITOR_REGISTRO_CAMPO.lo_conteudo, 4000, 1) AS valor
        ,dh_criacao
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

    --and atendime.cd_atendimento              = pAtendimento
     and PW_EDITOR_CLINICO.cd_documento       = 1
     and ds_identificador                     IN ('PROCEDIMENTO_GUIA_V1', 'QUANTIDADE_V1')
     and nvl(atendime.cd_multi_empresa, 1)    = 1
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
                                                and (tp_status = 'ASSINADO' or tp_status = 'FECHADO') ) 




  SELECT
         atendime.cd_atendimento
        ,ds_identificador
        ,Dbms_Lob.Substr(EDITOR_REGISTRO_CAMPO.lo_conteudo, 4000, 1) AS valor
        ,dh_criacao
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

     and PW_EDITOR_CLINICO.cd_documento       = 1
     and ds_identificador                     IN ('PROCEDIMENTO_GUIA', 'QUANTIDADE', 'PROCEDIMENTO_GUIA_V1', 'QUANTIDADE_V1', 'PROCEDIMENTO_GUIA_V2', 'QUANTIDADE_V2')
     and nvl(atendime.cd_multi_empresa, 1)    = 1
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
  ORDER BY 
     atendime.cd_atendimento, ds_identificador