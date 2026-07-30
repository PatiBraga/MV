PROMPT CREATE OR REPLACE VIEW exame_pedido_multi_login
CREATE OR REPLACE VIEW exame_pedido_multi_login (
  nm_unidade,
  cd_unidade_his,
  id_medico_executante_padrao,
  ds_certificacao_digital,
  id_exame_pedido,
  id_pedido_exame,
  id_medico,
  nm_medico_solicitante,
  ds_crm_solicitante,
  ds_telefone_solicitante,
  ds_email_solicitante,
  id_paciente,
  id_paciente_consolidado,
  nm_paciente,
  tp_sexo,
  ds_telefone,
  dt_nascimento,
  ds_email,
  ds_matricula,
  idade,
  nr_prontuario_hospitalar,
  cd_paciente_his,
  ds_endereco,
  ds_bairro,
  ds_cidade,
  ds_uf,
  ds_cep,
  ds_fax,
  sn_email,
  sn_sms,
  id_convenio,
  id_unidade,
  nr_guia_his,
  nm_convenio_unidade,
  sn_parceiro,
  id_medico_executante,
  nm_medico_executante,
  ds_crm_executante,
  cd_his_executante,
  id_medico_revisor,
  nm_medico_revisor,
  ds_crm_revisor,
  cd_his_revisor,
  id_medico_revisor_final,
  nm_medico_revisor_final,
  ds_crm_revisor_final,
  cd_his_revisor_final,
  id_diagnostico_radio,
  nm_diagnostico_radio,
  id_diagnostico_clinico,
  nm_diagnostico_clinico,
  id_diagnostico_cirurgico,
  nm_diagnostico_cirurgico,
  id_sala,
  nm_sala,
  dt_cadastro,
  dt_alteracao,
  dt_study,
  id_exame_unidade,
  nm_exame_unidade,
  id_exame,
  nm_exame,
  cd_cbhpm,
  id_usuario_inclusao,
  nm_usuario_inclusao,
  id_usuario_alteracao,
  nm_usuario_alteracao,
  dt_dum,
  cd_atendimento_his,
  cd_pedido_his,
  cd_item_pedido_his,
  id_origem_atendimento,
  cd_status,
  ds_status,
  id_setor_solicitante,
  nm_setor,
  id_usuario_entrada_exame,
  nm_usuario_entrada_exame,
  id_usuario_saida_exame,
  nm_usuario_saida_exame,
  dt_entrada_exame,
  dt_saida_exame,
  nr_altura,
  nr_peso,
  sn_pendente,
  dt_finalizacao,
  dt_laudado,
  dt_pedido,
  dt_impresso,
  dt_assinado,
  dt_digitado,
  dt_ditado,
  dt_revisado,
  dt_revisado_final,
  dt_entrega,
  nm_acomodacao_his,
  nm_local_entrega_his,
  nm_indicacao_his,
  sn_midia_resultado,
  ds_observacao,
  id_usuario_liberacao,
  nm_usuario_liberacao,
  id_usuario_online,
  nm_usuario_online,
  ds_operacao_online,
  sn_sms_enviado,
  ds_laudo_rtf,
  ds_laudo_txt,
  ds_laudo_html,
  sn_normal,
  id_justificativa,
  dt_justificativa,
  ds_justificativa,
  id_usuario_justificativa,
  nm_usuario_justificativa,
  ds_leito_his,
  ds_regiao_examinada,
  sn_agrupar_imagem,
  sn_agrupar_laudo,
  id_tipo_exame,
  nm_tipo_exame,
  nm_procedimento,
  id_procedimento_unidade,
  id_procedimento,
  nr_prazo_entrega,
  cd_procedimento_his,
  ds_layout_impressao,
  id_medico_padrao,
  id_sala_padrao,
  sn_revisao_automatica,
  sn_dicom,
  sn_executante_revisor,
  sn_laudo_lote_pendente,
  sn_entrega_laudo_cd,
  sn_impressao_laudo_entrega,
  sn_liberar_lote_laudo_rev_pend,
  sn_texto_padrao_automatico,
  sn_justificativa_laudo,
  sn_endoscopia,
  cd_modalidade,
  nr_dias,
  sn_atrasado,
  tp_sexo_revisor,
  tp_sexo_executante,
  id_sistema,
  cd_exame_his,
  id_medico_ditado,
  nm_medico_ditado,
  ds_crm_ditado,
  cd_his_ditado,
  id_classificacao_risco,
  id_setor_executante,
  id_etapa_atual,
  nm_etapa,
  ds_alerta_acordo,
  possuicomentario,
  id_tipo_prioridade,
  sn_prescricao_urgente,
  sn_exame_concluido,
  cd_study_uid,
  cd_tipo_viewer,
  dt_anamnese,
  id_convenio_unidade,
  paciente_idade_extenso,
  sn_study_ped,
  tp_insumo,
  ds_path_relatorio_formula,
  ds_laudo_pdf_marcadagua
) AS
SELECT
  UNI.NM_UNIDADE,
  UNI.cd_unidade_his,
  UNI.id_medico_executante_padrao,
  EP.DS_CERTIFICACAO_DIGITAL,
  EP.ID_EXAME_PEDIDO,
  EP.ID_PEDIDO_EXAME,
  MSOLICITANTE.ID_MEDICO,
  MSOLICITANTE.NM_MEDICO AS NM_MEDICO_SOLICITANTE,
  MSOLICITANTE.DS_CRM AS DS_CRM_SOLICITANTE,
  MSOLICITANTE.DS_TELEFONE AS DS_TELEFONE_SOLICITANTE,
  MSOLICITANTE.DS_EMAIL AS DS_EMAIL_SOLICITANTE,
  PACIENTE.ID_PACIENTE,
  coalesce(PACIENTE.id_paciente_consolidado,PACIENTE.id_paciente) as id_paciente_consolidado,
  PACIENTE.NM_PACIENTE,
  PACIENTE.tp_sexo,
  PACIENTE.DS_TELEFONE,
  PACIENTE.DT_NASCIMENTO,
  PACIENTE.DS_EMAIL,
  PACIENTE.DS_MATRICULA,
  Floor(floor(months_between(pe.dt_pedido_his, PACIENTE.DT_NASCIMENTO)) / 12) AS IDADE,
  PACIENTE.NR_PRONTUARIO_HOSPITALAR,
  PACIENTE.CD_PACIENTE_HIS,
  PACIENTE.DS_ENDERECO,
  PACIENTE.DS_BAIRRO,
  PACIENTE.DS_CIDADE,
  PACIENTE.DS_UF,
  PACIENTE.DS_CEP,
  PACIENTE.DS_FAX,
  PACIENTE.SN_EMAIL,
  PACIENTE.SN_SMS,
  CONVENIO.ID_CONVENIO,
  PE.ID_UNIDADE,
  PE.Nr_Guia_His as Nr_Guia_His,
  CONVENIO.NM_CONVENIO_UNIDADE,
  CONVENIO.SN_PARCEIRO,
  MEXECUTANTE.ID_MEDICO AS ID_MEDICO_EXECUTANTE,
  MEXECUTANTE.NM_MEDICO AS NM_MEDICO_EXECUTANTE,
  MEXECUTANTE.DS_CRM AS DS_CRM_EXECUTANTE,
  MEXECUTANTE.cd_medico_his AS CD_HIS_EXECUTANTE,
  MREVISOR.ID_MEDICO AS ID_MEDICO_REVISOR,
  MREVISOR.NM_MEDICO AS NM_MEDICO_REVISOR,
  MREVISOR.DS_CRM AS DS_CRM_REVISOR,
  MREVISOR.cd_medico_his AS CD_HIS_REVISOR,
  MREVISORFINAL.ID_MEDICO AS ID_MEDICO_REVISOR_FINAL,
  MREVISORFINAL.NM_MEDICO AS NM_MEDICO_REVISOR_FINAL,
  MREVISORFINAL.DS_CRM AS DS_CRM_REVISOR_FINAL,
  MREVISORFINAL.cd_medico_his AS CD_HIS_REVISOR_FINAL,
  ID_DIAGNOSTICO_RADIO,
  '' AS NM_DIAGNOSTICO_RADIO,
  0 AS ID_DIAGNOSTICO_CLINICO,
  '' NM_DIAGNOSTICO_CLINICO,
  0 AS ID_DIAGNOSTICO_CIRURGICO,
  '' NM_DIAGNOSTICO_CIRURGICO,
  EP.ID_SALA,
  SALAEXAME.NM_SALA,
  PE.DT_PEDIDO_HIS AS DT_CADASTRO,
  EP.DT_ALTERACAO,
  EP.DT_STUDY,
  EP.ID_EXAME_UNIDADE,
  EXAME.NM_EXAME_UNIDADE,
  EXAME.ID_EXAME,
  EXAME.NM_EXAME,
  EXAME.CD_CBHPM,
  EP.ID_USUARIO_INCLUSAO,
  USERINCLUSAO.NM_USUARIO AS NM_USUARIO_INCLUSAO,
  EP.ID_USUARIO_ALTERACAO,
  USERALTERACAO.NM_USUARIO AS NM_USUARIO_ALTERACAO,
  EP.DT_DUM,
  PE.CD_ATENDIMENTO_HIS,
  PE.CD_PEDIDO_HIS,
  EP.CD_ITEM_PEDIDO_HIS,
  EP.ID_ORIGEM_ATENDIMENTO,
  ORIGEM.CD_STATUS,
  ORIGEM.DS_STATUS,
  PE.ID_SETOR_SOLICITANTE,
  SETOR.NM_SETOR,
  EP.ID_USUARIO_ENTRADA_EXAME,
  USERENTRADAEXAME.NM_USUARIO AS NM_USUARIO_ENTRADA_EXAME,
  EP.ID_USUARIO_SAIDA_EXAME,
  USERSAIDAEXAME.NM_USUARIO AS NM_USUARIO_SAIDA_EXAME,
  EP.DT_ENTRADA_EXAME,
  EP.DT_SAIDA_EXAME,
  EP.NR_ALTURA,
  EP.NR_PESO,
  EP.SN_PENDENTE,
  EP.DT_FINALIZACAO,
  EP.DT_LAUDADO,
  EP.DT_PEDIDO,
  EP.DT_IMPRESSO,
  EP.DT_ASSINADO,
  EP.DT_DIGITADO,
  EP.DT_DITADO,
  EP.DT_REVISADO,
  EP.DT_REVISADO_FINAL,
  EP.DT_ENTREGA,
  EP.NM_ACOMODACAO_HIS,
  EP.NM_LOCAL_ENTREGA_HIS,
  EP.NM_INDICACAO_HIS,
  EP.SN_MIDIA_RESULTADO,
  EP.DS_OBSERVACAO,
  EP.ID_USUARIO_LIBERACAO,
  USERLIBERACAO.NM_USUARIO AS NM_USUARIO_LIBERACAO,
  EP.ID_USUARIO_ONLINE,
  USERONLINE.NM_USUARIO AS NM_USUARIO_ONLINE,
  EP.DS_OPERACAO_ONLINE,
  EP.SN_SMS_ENVIADO,
  EP.DS_LAUDO_RTF,
  EP.DS_LAUDO_TXT,
  EP.DS_LAUDO_HTML,
  EP.SN_NORMAL,
  EP.ID_JUSTIFICATIVA,
  EP.DT_JUSTIFICATIVA,
  EP.DS_JUSTIFICATIVA,
  EP.ID_USUARIO_JUSTIFICATIVA,
  USERJUSTIFICATIVA.NM_USUARIO AS NM_USUARIO_JUSTIFICATIVA,
  EP.DS_LEITO_HIS,
  gera_chave_portal_pac(PACIENTE.NR_PRONTUARIO_HOSPITALAR) DS_REGIAO_EXAMINADA,
  EP.SN_AGRUPAR_IMAGEM,
  EP.SN_AGRUPAR_LAUDO,
  EXAME.ID_TIPO_EXAME,
  EXAME.NM_TIPO_EXAME,
  EXAME.NM_PROCEDIMENTO,
  EXAME.ID_PROCEDIMENTO_UNIDADE,
  EXAME.ID_PROCEDIMENTO,
  COALESCE(PRAZO.NR_PRAZO_ENTREGA, (EXAME.NR_PRAZO_ENTREGA * 24)) nr_prazo_entrega, -- em horas
  EXAME.CD_PROCEDIMENTO_HIS,
  EXAME.DS_LAYOUT_IMPRESSAO,
  EXAME.ID_MEDICO_PADRAO,
  EXAME.ID_SALA AS ID_SALA_PADRAO,
  EXAME.SN_REVISAO_AUTOMATICA,
  EXAME.SN_DICOM,
  EXAME.SN_EXECUTANTE_REVISOR,
  EXAME.SN_LAUDO_LOTE_PENDENTE,
  EXAME.SN_ENTREGA_LAUDO_CD,
  EXAME.SN_IMPRESSAO_LAUDO_ENTREGA,
  EXAME.SN_LIBERAR_LOTE_LAUDO_REV_PEND,
  EXAME.SN_TEXTO_PADRAO_AUTOMATICO,
  EXAME.SN_JUSTIFICATIVA_LAUDO,
  EXAME.SN_ENDOSCOPIA,
  exame.cd_modalidade,
  ROUND(( (SYSDATE) - PE.DT_PEDIDO_HIS )) NR_DIAS,
  FN_EXAME_ATRASADO(EP.ID_EXAME_UNIDADE, EXAME.ID_PROCEDIMENTO_UNIDADE, EP.ID_ORIGEM_ATENDIMENTO, ep.dt_assinado, EXAME.SN_DICOM, EP.DT_STUDY, EP.DT_CADASTRO) AS SN_ATRASADO,
  ---(case when coalesce(coalesce((prazo.NR_PRAZO_ENTREGA / 24), exame.nr_prazo_entrega), 0) <= (coalesce(ep.dt_assinado, sysdate) - pe.dt_pedido_his) then  'S' else 'N' end) sn_atrasado,
  MREVISOR.TP_SEXO tp_sexo_revisor,
  MEXECUTANTE.TP_SEXO tp_sexo_executante,
  EXAME.ID_SISTEMA,
  EXAME.CD_EXAME_HIS as CD_EXAME_HIS,
  MDITADO.ID_MEDICO ID_MEDICO_DITADO,
  MDITADO.NM_MEDICO AS NM_MEDICO_DITADO,
  MDITADO.DS_CRM AS DS_CRM_DITADO,
  MDITADO.cd_medico_his AS CD_HIS_DITADO,
  PE.ID_CLASSIFICACAO_RISCO,
  ep.id_setor_executante,
  EP.ID_ETAPA_ATUAL,
  ETAPA.NM_ETAPA,
  fn_retorna_acordo(PE.DT_PEDIDO_HIS, EP.ID_EXAME_UNIDADE) ds_alerta_acordo,
  ( case when COMENTARIO_ID.ID_COMENTARIO IS NULL then 'N' else 'S' end) AS POSSUICOMENTARIO,
  COMENTARIO.ID_TIPO_PRIORIDADE AS id_tipo_prioridade,
  EP.SN_PRESCRICAO_URGENTE,
  EP.SN_EXAME_CONCLUIDO,
  EP.CD_STUDY_UID,
  EXAME.CD_TIPO_VIEWER,
  ep.dt_anamnese,
  CONVENIO.ID_CONVENIO_UNIDADE,
  FN_IDADE_EXTENSO(PACIENTE.DT_NASCIMENTO, pe.dt_pedido_his) PACIENTE_IDADE_EXTENSO,
  EP.SN_STUDY_PED,
  COALESCE(INSUMO.SN_ATENDIDA, 0) TP_INSUMO, -- 0 -> Sem insumo 1-> insumo sem algum qt_atendida null 2-> insumo com dt_atendida preenchida
  EXAME.DS_PATH_RELATORIO_FORMULA,
  EP.DS_LAUDO_PDF_MARCADAGUA
  FROM RS_LAU_EXAME_PEDIDO EP
                                            JOIN
                                              RS_LAU_PEDIDO_EXAME PE ON (PE.ID_PEDIDO_EXAME = EP.ID_PEDIDO_EXAME)
                                            JOIN
                                              (SELECT
                                                 EU.NM_EXAME_UNIDADE,
                                                 E.ID_EXAME,
                                                 E.NM_EXAME,
                                                 EU.CD_CBHPM,
                                                 E.ID_TIPO_EXAME,
                                                 EU.NR_PRAZO_ENTREGA,
                                                 EU.ID_EXAME_UNIDADE,
                                                 E.ID_SISTEMA,
                                                 EU.CD_EXAME_HIS,
                                                 T.NM_TIPO_EXAME,
                                                 PR.NM_PROCEDIMENTO,
                                                 PRU.ID_PROCEDIMENTO_UNIDADE,
                                                 PR.ID_PROCEDIMENTO,
                                                 PRU.CD_PROCEDIMENTO_HIS,
                                                 PRU.DS_LAYOUT_IMPRESSAO,
                                                 PRU.ID_MEDICO_PADRAO,
                                                 PRU.ID_SALA,
                                                 PRU.SN_REVISAO_AUTOMATICA,
                                                 PRU.SN_DICOM,
                                                 PRU.SN_EXECUTANTE_REVISOR,
                                                 PRU.SN_LAUDO_LOTE_PENDENTE,
                                                 PRU.SN_ENTREGA_LAUDO_CD,
                                                 PRU.SN_IMPRESSAO_LAUDO_ENTREGA,
                                                 PRU.SN_LIBERAR_LOTE_LAUDO_REV_PEND,
                                                 PRU.SN_TEXTO_PADRAO_AUTOMATICO,
                                                 PRU.SN_JUSTIFICATIVA_LAUDO,
                                                 PRU.SN_ENDOSCOPIA,
                                                 PRU.ID_UNIDADE,
                                                 MO.CD_MODALIDADE,
                                                 PRU.CD_TIPO_VIEWER,
                                                 PRU.DS_PATH_RELATORIO_FORMULA
                                               FROM RS_EXA_EXAME_UNIDADE EU
                                               JOIN RS_EXA_EXAME E ON (EU.ID_EXAME = E.ID_EXAME)
                                               JOIN RS_EXA_TIPO_EXAME T ON (T.ID_TIPO_EXAME = E.ID_TIPO_EXAME)
                                               JOIN RS_EXA_PROCEDIMENTO_UNIDADE PRU ON (PRU.ID_PROCEDIMENTO = T.ID_PROCEDIMENTO AND PRU.ID_UNIDADE = EU.ID_UNIDADE)
                                               JOIN RS_EXA_PROCEDIMENTO PR ON (PR.ID_PROCEDIMENTO = PRU.ID_PROCEDIMENTO)
                                               JOIN RS_EXA_MODALIDADE MO ON (PR.ID_MODALIDADE = MO.ID_MODALIDADE))
                                             EXAME ON (EXAME.ID_EXAME_UNIDADE = EP.ID_EXAME_UNIDADE)
                                            LEFT JOIN RS_EXA_EXAME_ORIGEM_ATEND PRAZO ON (PRAZO.ID_EXAME_UNIDADE = EP.ID_EXAME_UNIDADE AND PRAZO.ID_ORIGEM_ATENDIMENTO = EP.ID_ORIGEM_ATENDIMENTO)
                                            JOIN
                                              RS_UNI_UNIDADE UNI ON (UNI.ID_UNIDADE = PE.ID_UNIDADE)
                                            LEFT JOIN
                                                (SELECT
                                                  MU.ID_MEDICO_UNIDADE,
                                                  MD.ID_MEDICO,
                                                  MD.NM_MEDICO,
                                                  MU.DS_CRM,
                                                  MU.CD_MEDICO_HIS,
                                                  MD.TP_SEXO,
                                                  MD.DS_TELEFONE,
                                                  MD.DS_EMAIL
                                                FROM
                                                  RS_MD_MEDICO_UNIDADE MU
                                                JOIN RS_MD_MEDICO MD ON (MD.ID_MEDICO = MU.ID_MEDICO))
                                              MEXECUTANTE ON (MEXECUTANTE.ID_MEDICO_UNIDADE = EP.ID_MEDICO_EXECUTANTE)
                                            LEFT JOIN
                                                (SELECT
                                                  MU.ID_MEDICO_UNIDADE,
                                                  MD.ID_MEDICO,
                                                  MD.NM_MEDICO,
                                                  MU.DS_CRM,
                                                  MU.CD_MEDICO_HIS,
                                                  MD.DS_EMAIL,
                                                  MD.DS_TELEFONE,
                                                  MD.TP_SEXO
                                                FROM
                                                  RS_MD_MEDICO_UNIDADE MU
                                                JOIN RS_MD_MEDICO MD ON (MD.ID_MEDICO = MU.ID_MEDICO))
                                              MREVISOR ON (MREVISOR.ID_MEDICO_UNIDADE = EP.ID_MEDICO_REVISOR)
                                            LEFT JOIN
                                                (SELECT
                                                  MU.ID_MEDICO_UNIDADE,
                                                  MD.ID_MEDICO,
                                                  MD.NM_MEDICO,
                                                  MU.DS_CRM,
                                                  MU.CD_MEDICO_HIS,
                                                  MD.DS_EMAIL,
                                                  MD.DS_TELEFONE,
                                                  MD.TP_SEXO
                                                FROM
                                                  RS_MD_MEDICO_UNIDADE MU
                                                JOIN RS_MD_MEDICO MD ON (MD.ID_MEDICO = MU.ID_MEDICO))
                                              MREVISORFINAL ON (MREVISORFINAL.ID_MEDICO_UNIDADE = EP.ID_MEDICO_REVISOR_FINAL)
                                            LEFT JOIN
                                                (SELECT
                                                  MU.ID_MEDICO_UNIDADE,
                                                  MD.ID_MEDICO,
                                                  MD.NM_MEDICO,
                                                  MU.DS_CRM,
                                                  MU.CD_MEDICO_HIS,
                                                  MD.DS_EMAIL,
                                                  MD.DS_TELEFONE,
                                                  MD.TP_SEXO
                                                FROM
                                                  RS_MD_MEDICO_UNIDADE MU
                                                JOIN RS_MD_MEDICO MD ON (MD.ID_MEDICO = MU.ID_MEDICO))
                                              MDITADO ON (MDITADO.ID_MEDICO_UNIDADE = EP.ID_MEDICO_DITADO)
                                            LEFT JOIN
                                              (SELECT
                                                  MU.ID_MEDICO_UNIDADE,
                                                  MD.ID_MEDICO,
                                                  MD.NM_MEDICO,
                                                  MU.DS_CRM,
                                                  MU.CD_MEDICO_HIS,
                                                  MD.DS_EMAIL,
                                                  MD.DS_TELEFONE,
                                                  MD.TP_SEXO
                                                FROM
                                                  RS_MD_MEDICO_UNIDADE MU
                                                JOIN RS_MD_MEDICO MD ON (MD.ID_MEDICO = MU.ID_MEDICO))
                                              MSOLICITANTE ON (MSOLICITANTE.ID_MEDICO_UNIDADE = PE.ID_MEDICO_SOLICITANTE)
                                            LEFT JOIN
                                              RS_SL_SALA_EXAME SALAEXAME ON (SALAEXAME.ID_SALA = EP.ID_SALA)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERINCLUSAO ON (USERINCLUSAO.ID_USUARIO = EP.ID_USUARIO_INCLUSAO)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERALTERACAO ON (USERALTERACAO.ID_USUARIO = EP.ID_USUARIO_ALTERACAO)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERENTRADAEXAME ON (USERENTRADAEXAME.ID_USUARIO = EP.ID_USUARIO_ENTRADA_EXAME)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERSAIDAEXAME ON (USERSAIDAEXAME.ID_USUARIO = EP.ID_USUARIO_SAIDA_EXAME)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERLIBERACAO ON (USERLIBERACAO.ID_USUARIO = EP.ID_USUARIO_LIBERACAO)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERONLINE ON (USERONLINE.ID_USUARIO = EP.ID_USUARIO_ONLINE)
                                            LEFT JOIN
                                              RS_SEG_USUARIO USERJUSTIFICATIVA ON (USERJUSTIFICATIVA.ID_USUARIO = EP.ID_USUARIO_JUSTIFICATIVA)
                                            LEFT JOIN
                                              RS_LAU_ORIGEM_ATENDIMENTO ORIGEM ON (ORIGEM.ID_ORIGEM_ATENDIMENTO = EP.ID_ORIGEM_ATENDIMENTO)
                                            LEFT JOIN
                                              RS_LAU_JUSTIFICATIVA JUSTIFICATIVA ON (JUSTIFICATIVA.ID_JUSTIFICATIVA = EP.ID_JUSTIFICATIVA)
                                            LEFT JOIN
                                              RS_LAU_ETAPA ETAPA ON (ETAPA.ID_ETAPA = EP.ID_ETAPA_ATUAL)
                                            LEFT JOIN
                                              RS_LAU_SETOR SETOR ON (SETOR.ID_SETOR = PE.id_setor_solicitante)
                                            LEFT JOIN
                                              (SELECT
                                                 P.ID_PACIENTE,
                                                 P.ID_PACIENTE_CONSOLIDADO,
                                                 P.NM_PACIENTE,
                                                 P.TP_SEXO,
                                                 P.DS_TELEFONE,
                                                 P.DT_NASCIMENTO,
                                                 P.DS_EMAIL,
                                                 P.DS_MATRICULA,
                                                 PU.NR_PRONTUARIO_HOSPITALAR,
                                                 PU.CD_PACIENTE_HIS,
                                                 PU.ID_PACIENTE_UNIDADE,
                                                 P.DS_ENDERECO,
                                                 P.DS_BAIRRO,
                                                 P.DS_CIDADE,
                                                 P.DS_UF,
                                                 P.DS_CEP,
                                                 P.DS_FAX,
                                                 P.SN_EMAIL,
                                                 P.SN_SMS
                                               FROM
                                                 RS_PAC_PACIENTE_UNIDADE PU
                                               JOIN RS_PAC_PACIENTE P ON (PU.ID_PACIENTE = P.ID_PACIENTE))
                                              PACIENTE ON (PACIENTE.ID_PACIENTE_UNIDADE = PE.ID_PACIENTE)
                                            LEFT JOIN
                                              RS_CV_CONVENIO_UNIDADE CONVENIO ON (CONVENIO.ID_CONVENIO_UNIDADE = PE.ID_CONVENIO)
                                            LEFT JOIN
                                               (SELECT
                                                  B.ID_TIPO_PRIORIDADE,
                                                  B.ID_EXAME_PEDIDO
                                                FROM
                                                   (select
                                                      MAX(A.id_COMENTARIO) AS ID_COMENTARIO,
                                                      A.ID_EXAME_PEDIDO
                                                    FROM
                                                      RS_LAU_EXAME_PEDIDO_COMENTARIO A
                                                    GROUP BY
                                                      A.ID_EXAME_PEDIDO) AB
                                                    JOIN RS_LAU_EXAME_PEDIDO_COMENTARIO B ON (AB.ID_COMENTARIO = B.ID_COMENTARIO))
                                                 COMENTARIO ON (COMENTARIO.ID_EXAME_PEDIDO = EP.ID_EXAME_PEDIDO)
                                            LEFT JOIN
                                               (SELECT
                                                  MAX(ID_COMENTARIO) ID_COMENTARIO,
                                                  ID_EXAME_PEDIDO
                                                FROM
                                                  RS_LAU_COMENTARIO
                                                GROUP BY ID_EXAME_PEDIDO)
                                                  COMENTARIO_ID ON (COMENTARIO_ID.ID_EXAME_PEDIDO = EP.ID_EXAME_PEDIDO)
                                            LEFT JOIN (SELECT I.ID_EXAME_PEDIDO, DECODE(COUNT(I.QT_ATENDIDA), COUNT(I.ID_EXAME_PEDIDO), 2, 1) SN_ATENDIDA FROM RS_LAU_EXAME_PEDIDO_INSUMO I GROUP BY I.ID_EXAME_PEDIDO) INSUMO ON (INSUMO.ID_EXAME_PEDIDO = EP.ID_EXAME_PEDIDO)
                                            WHERE EP.SN_ATIVO = 'S'
/

