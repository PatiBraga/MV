PROMPT CREATE OR REPLACE VIEW vdic_pw_resposta_documento
CREATE OR REPLACE VIEW vdic_pw_resposta_documento (
  cd_atendimento,
  dt_atendimento,
  hr_atendimento,
  cd_paciente,
  nm_paciente,
  cd_documento,
  cd_registro,
  cd_tipo_documento,
  ds_tipo_documento,
  ds_documento,
  tp_status,
  cd_campo_pai,
  ds_campo_pai,
  ds_identificador_pai,
  cd_campo_filho,
  ds_campo_filho,
  ds_identificador_filho,
  dh_documento,
  dh_criacao,
  dh_fechamento,
  dh_impresso,
  cd_objeto,
  cd_usuario_criou,
  cd_prestador_criou,
  ds_unidade_internacao,
  ds_setor_documento,
  ds_leito,
  ds_resumo_leito,
  cd_itpre_med,
  ds_resposta
) AS
SELECT Ate.Cd_Atendimento                   Cd_Atendimento
     , Ate.Dt_Atendimento                   Dt_Atendimento
     , Ate.Hr_Atendimento                   Hr_Atendimento
     , Pac.Cd_Paciente                      Cd_Paciente
     , Pac.Nm_Paciente                      Nm_Paciente
     , Nvl(Nvl(Pmd.Cd_Pre_Med,Cvt.Cd_Coleta_Sinal_Vital),Pec.Cd_Documento) Cd_Documento
     , Pec.cd_editor_registro               Cd_Registro
     , Ptd.Cd_Tipo_Documento                Cd_Tipo_Documento
     , Upper(Ptd.Ds_Tipo_Documento)         Ds_Tipo_Documento
     , Nvl(Doc.Ds_Documento,Obj.Nm_Objeto)  Ds_Documento
     , Pdc.Tp_Status                        Tp_Status
     , EcB.Cd_Campo                         Cd_Campo_Pai
     , EcB.Ds_Campo                         Ds_Campo_Pai
     , EcB.Ds_Identificador                 Ds_Identificador_Pai
     , EcA.Cd_Campo                         Cd_Campo_Filho
     , EcA.Ds_Campo                         Ds_Campo_Filho
     , EcA.Ds_Identificador                 Ds_Identificador_Filho
     , Pdc.Dh_Documento                     Dh_Documento
     , Pdc.Dh_Criacao                       Dh_Criacao
     , Decode(Pec.Cd_Documento,NULL,Pdc.Dh_Documento,Pdc.Dh_Fechamento)  Dh_Fechamento
     , Decode(Pec.Cd_Documento,NULL,Pdc.Dh_Documento,Pdc.Dh_Impresso) Dh_Impresso
     , Pdc.Cd_Objeto                        Cd_Objeto
     , Pdc.Cd_Usuario                       Cd_Usuario_Criou
     , Pdc.Cd_Prestador                     Cd_Prestador_Criou
     , (SELECT Und.Ds_Unid_Int FROM Dbamv.Unid_Int Und, Dbamv.Leito Lei WHERE Und.Cd_Unid_Int = Lei.Cd_Unid_Int
                            AND Lei.Cd_leito = Dbamv.Fnc_Leito_Atendimento(Ate.Cd_Atendimento,Nvl(Pdc.Dh_Referencia,Pdc.Dh_Criacao))) Ds_Unidade_Internacao
     , (SELECT Str.Nm_Setor FROM Dbamv.Unid_Int Und, Dbamv.Leito Lei, Dbamv.Setor Str WHERE Und.Cd_Unid_Int = Lei.Cd_Unid_Int AND Und.Cd_Setor = Str.Cd_Setor
                            AND Lei.Cd_leito = Dbamv.Fnc_Leito_Atendimento(Ate.Cd_Atendimento,Nvl(Pdc.Dh_Referencia,Pdc.Dh_Criacao))) Ds_Setor_Documento
     , (SELECT Lei.Ds_Leito FROM Dbamv.Leito Lei WHERE Lei.Cd_leito = Dbamv.Fnc_Leito_Atendimento(Ate.Cd_Atendimento,Nvl(Pdc.Dh_Referencia,Pdc.Dh_Criacao))) ds_leito
     , (SELECT Lei.Ds_Resumo FROM Dbamv.Leito Lei WHERE Lei.Cd_leito = Dbamv.Fnc_Leito_Atendimento(Ate.Cd_Atendimento,Nvl(Pdc.Dh_Referencia,Pdc.Dh_Criacao))) ds_resumo_leito
     , (Select Max(Itpre_Med.Cd_Itpre_Med)
          From Dbamv.Itpre_Med
             , Dbamv.Pre_Med
             , Dbamv.Itpre_Pad
         Where Itpre_Med.Cd_Pre_Med = Pre_Med.Cd_Pre_Med
           And Itpre_Med.Cd_Itpre_Pad = Itpre_Pad.Cd_Itpre_Pad
           And To_Char(Itpre_Pad.Cd_Pre_Pad) = Dbms_Lob.Substr(Erc.Lo_Valor,4000,1)
           And trunc(Pre_Med.Hr_Pre_Med) = trunc(Pdc.Dh_Documento)
           And Pre_Med.Cd_Atendimento = Ate.Cd_AtendimentO) Cd_ItPre_Med
     , Dbms_Lob.Substr(Erc.Lo_Valor,4000,1) Ds_Resposta
  FROM Dbamv.Pw_Documento_Clinico   Pdc
     , Dbamv.Pw_Editor_Clinico      Pec
     , Dbamv.Pw_Tipo_Documento      Ptd
     , Dbamv.Pre_Med                Pmd
     , Dbamv.Coleta_Sinal_Vital     Cvt
     , Dbamv.Pagu_Objeto            Obj
     , Dbamv.Editor_Registro_Campo  Erc
     , Dbamv.Editor_Registro        Erg
     , Dbamv.Editor_Documento       Doc
     , Dbamv.Editor_Versao_Documento Evs
     , Dbamv.Editor_Tipo_Versao     Etv
     , Dbamv.Editor_Campo           EcA
     , Dbamv.Editor_Tipo_Visualizacao Etv
     , Dbamv.Editor_Campo           EcB
     , Dbamv.Editor_Grupo_Campo     Egc
     , Dbamv.Editor_Grupo           Egr
     , Dbamv.Atendime               Ate
     , Dbamv.Paciente               Pac
  WHERE Pec.Cd_Documento_Clinico(+) = Pdc.Cd_Documento_Clinico
   AND Pdc.Cd_Tipo_Documento       = Ptd.Cd_Tipo_Documento
   AND Pdc.Cd_Documento_Clinico    = Pmd.Cd_Documento_Clinico(+)
   AND Pdc.Cd_Documento_Clinico    = Cvt.Cd_Documento_Clinico(+)
   AND Pdc.Cd_Objeto(+)            = Obj.Cd_Objeto
   AND Erc.Cd_Registro(+)          = Pec.Cd_Editor_Registro
   AND Erg.Cd_Registro(+)          = Erc.Cd_Registro
   AND Pec.Cd_Documento            = Doc.Cd_Documento(+)
   And Doc.Cd_Documento            = Evs.Cd_Documento(+)
   AND Evs.Cd_Tipo_Versao(+)       = 3 --Versão Atual (Não remova este filtro)
   And Evs.Cd_Tipo_Versao          = Etv.Cd_Tipo_Versao(+)
   AND EcA.Cd_Campo(+)             = Erc.Cd_campo
   And EcA.Cd_Tipo_Visualizacao    = Etv.Cd_Tipo_Visualizacao(+)
   AND EcA.Cd_Metadado             = EcB.Cd_Campo(+)
   AND Egc.Cd_Campo(+)             = EcB.cd_Campo
   And Egc.Cd_Grupo                = Egr.Cd_Grupo(+)
   AND Pdc.Cd_Atendimento          = Ate.Cd_Atendimento
   And Ate.Cd_Paciente             = Pac.Cd_Paciente
   And Ptd.Cd_Tipo_Documento NOT IN (36,44)
/

COMMENT ON TABLE vdic_pw_resposta_documento IS 'Resposta dos documentos eletronicos';

COMMENT ON COLUMN vdic_pw_resposta_documento.cd_atendimento IS 'Codigo do atendimento';
COMMENT ON COLUMN vdic_pw_resposta_documento.dt_atendimento IS 'Data do Atendimento';
COMMENT ON COLUMN vdic_pw_resposta_documento.hr_atendimento IS 'Hora do Atendimento';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_paciente IS 'Codigo do Prontu¿rio';
COMMENT ON COLUMN vdic_pw_resposta_documento.nm_paciente IS 'Nome do Paciente';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_documento IS 'Codigo do Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_tipo_documento IS 'Codigo do Tipo de Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_tipo_documento IS 'Descricao do Tipo de Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_documento IS 'Nome do Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.tp_status IS 'Status do Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_campo_pai IS 'Codigo do Campo Pai';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_campo_pai IS 'Descricao do Campo Pai';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_identificador_pai IS 'Identificador do Campo Pai';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_campo_filho IS 'Codigo do Metadado';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_campo_filho IS 'Descricao do Metadado';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_identificador_filho IS 'Identificador do Metadado';
COMMENT ON COLUMN vdic_pw_resposta_documento.dh_documento IS 'Data/Hora do Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.dh_criacao IS 'Data/Hora da Criacao';
COMMENT ON COLUMN vdic_pw_resposta_documento.dh_fechamento IS 'Data/Hora do Fechamento';
COMMENT ON COLUMN vdic_pw_resposta_documento.dh_impresso IS 'Data/Hora da Impressão';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_objeto IS 'Objeto de Prontuario';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_usuario_criou IS 'Usuario que Criou o Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_prestador_criou IS 'Prestador que Criou o Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_unidade_internacao IS 'Unidade de Internacao que Criou o Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_setor_documento IS 'Setor que Criou o Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_leito IS 'leito que Criou o Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_resumo_leito IS 'Descricao Resumida do Leito que Criou o Documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.cd_itpre_med IS 'Codigo da prescricao do documento';
COMMENT ON COLUMN vdic_pw_resposta_documento.ds_resposta IS 'Descricao da Resposta';

GRANT SELECT ON vdic_pw_resposta_documento TO acessoprd;
GRANT SELECT ON vdic_pw_resposta_documento TO beecare;
GRANT SELECT ON vdic_pw_resposta_documento TO consulta;
GRANT SELECT ON vdic_pw_resposta_documento TO dbacp WITH GRANT OPTION;
GRANT SELECT ON vdic_pw_resposta_documento TO dbaportal WITH GRANT OPTION;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_pw_resposta_documento TO dbaps;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_pw_resposta_documento TO dbasgu;
GRANT SELECT ON vdic_pw_resposta_documento TO desenv_soleitura;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_pw_resposta_documento TO mv2000;
GRANT SELECT ON vdic_pw_resposta_documento TO mvbike WITH GRANT OPTION;
GRANT SELECT ON vdic_pw_resposta_documento TO mvfabread;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_pw_resposta_documento TO mvintegra;
GRANT SELECT ON vdic_pw_resposta_documento TO mvread;
