  SELECT
  a.dh_criacao,
  f.nm_paciente,
  g.nm_prestador,
  e.cd_atendimento,
    (select REGEXP_SUBSTR(EDITOR_REGISTRO_CAMPO.lo_conteudo, '.{21}(.*)', 1, 1, NULL, 1)
        from editor.EDITOR_REGISTRO_CAMPO, editor.EDITOR_CAMPO
        where editor.EDITOR_REGISTRO_CAMPO.cd_registro = c.cd_registro
        AND editor.EDITOR_REGISTRO_CAMPO.cd_campo = editor.EDITOR_CAMPO.cd_campo
        and editor.EDITOR_CAMPO.ds_identificador IN ('PROCEDIMENTO_GUIA')        
        )procedimento,
    (select TO_NUMBER(REGEXP_SUBSTR(EDITOR_REGISTRO_CAMPO.lo_conteudo,'\d+'))
        from editor.EDITOR_REGISTRO_CAMPO, editor.EDITOR_CAMPO
        where editor.EDITOR_REGISTRO_CAMPO.cd_registro = c.cd_registro
        AND editor.EDITOR_REGISTRO_CAMPO.cd_campo = editor.EDITOR_CAMPO.cd_campo
        and editor.EDITOR_CAMPO.ds_identificador IN ('QUANTIDADE'))quantidade        
    FROM dbamv.PW_DOCUMENTO_CLINICO a, dbamv.PW_EDITOR_CLINICO b, editor.EDITOR_REGISTRO c, dbamv.atendime e, dbamv.paciente f, dbamv.prestador g
    where e.cd_atendimento = a.cd_atendimento
     AND b.cd_documento_clinico = a.cd_documento_clinico
     AND b.cd_editor_registro = c.cd_registro
     and b.cd_documento = 1
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
     and e.cd_paciente = f.cd_paciente
     and a.cd_prestador = g.cd_prestador
     and e.cd_atendimento = 359004

UNION ALL

  SELECT
  a.dh_criacao,
  f.nm_paciente,
  g.nm_prestador,
  e.cd_atendimento,
    (select REGEXP_SUBSTR(EDITOR_REGISTRO_CAMPO.lo_conteudo, '.{21}(.*)', 1, 1, NULL, 1)
        from editor.EDITOR_REGISTRO_CAMPO, editor.EDITOR_CAMPO
        where editor.EDITOR_REGISTRO_CAMPO.cd_registro = c.cd_registro
        AND editor.EDITOR_REGISTRO_CAMPO.cd_campo = editor.EDITOR_CAMPO.cd_campo
        and editor.EDITOR_CAMPO.ds_identificador IN ('PROCEDIMENTO_GUIA_V1')        
        )procedimento,
    (select TO_NUMBER(REGEXP_SUBSTR(EDITOR_REGISTRO_CAMPO.lo_conteudo,'\d+'))
        from editor.EDITOR_REGISTRO_CAMPO, editor.EDITOR_CAMPO
        where editor.EDITOR_REGISTRO_CAMPO.cd_registro = c.cd_registro
        AND editor.EDITOR_REGISTRO_CAMPO.cd_campo = editor.EDITOR_CAMPO.cd_campo
        and editor.EDITOR_CAMPO.ds_identificador IN ('QUANTIDADE_V1'))quantidade        
    FROM dbamv.PW_DOCUMENTO_CLINICO a, dbamv.PW_EDITOR_CLINICO b, editor.EDITOR_REGISTRO c, dbamv.atendime e, dbamv.paciente f, dbamv.prestador g
    where e.cd_atendimento = a.cd_atendimento
     AND b.cd_documento_clinico = a.cd_documento_clinico
     AND b.cd_editor_registro = c.cd_registro
     and b.cd_documento = 1
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
     and e.cd_paciente = f.cd_paciente
     and a.cd_prestador = g.cd_prestador
     and e.cd_atendimento = 359004

UNION ALL

  SELECT
  a.dh_criacao,
  f.nm_paciente,
  g.nm_prestador,
  e.cd_atendimento,
    (select REGEXP_SUBSTR(EDITOR_REGISTRO_CAMPO.lo_conteudo, '.{21}(.*)', 1, 1, NULL, 1)
        from editor.EDITOR_REGISTRO_CAMPO, editor.EDITOR_CAMPO
        where editor.EDITOR_REGISTRO_CAMPO.cd_registro = c.cd_registro
        AND editor.EDITOR_REGISTRO_CAMPO.cd_campo = editor.EDITOR_CAMPO.cd_campo
        and editor.EDITOR_CAMPO.ds_identificador IN ('PROCEDIMENTO_GUIA_V2')        
        )procedimento,
    (select TO_NUMBER(REGEXP_SUBSTR(EDITOR_REGISTRO_CAMPO.lo_conteudo,'\d+'))
        from editor.EDITOR_REGISTRO_CAMPO, editor.EDITOR_CAMPO
        where editor.EDITOR_REGISTRO_CAMPO.cd_registro = c.cd_registro
        AND editor.EDITOR_REGISTRO_CAMPO.cd_campo = editor.EDITOR_CAMPO.cd_campo
        and editor.EDITOR_CAMPO.ds_identificador IN ('QUANTIDADE_V2'))quantidade        
    FROM dbamv.PW_DOCUMENTO_CLINICO a, dbamv.PW_EDITOR_CLINICO b, editor.EDITOR_REGISTRO c, dbamv.atendime e, dbamv.paciente f, dbamv.prestador g
    where e.cd_atendimento = a.cd_atendimento
     AND b.cd_documento_clinico = a.cd_documento_clinico
     AND b.cd_editor_registro = c.cd_registro
     and b.cd_documento = 1
     and (tp_status = 'ASSINADO' or tp_status = 'FECHADO')
     and e.cd_paciente = f.cd_paciente
     and a.cd_prestador = g.cd_prestador
     and e.cd_atendimento = 359004     