
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" ("PAR_CD_ATENDIMENTO", "PAR_CD_PACIENTE", "PAR_NM_PACIENTE", "PAR_IDADE_PACIENTE", "PAR_DT_NASCIMENTO", "PAR_TP_SEXO", "PAR_NM_MAE", "PAR_SN_FAVORITO", "PAR_NM_SETOR", "PAR_SN_PENDENTE", "PAR_NM_FILTRO", "PAR_CD_PARMED", "PAR_CD_SETOR", "PAR_CD_DOC_CLINICO", "PAR_CD_TRIAGEM", "PAR_STATUS", "Senha", "PAR_CD_SENHA", "Recepção", "Especialidade", "Serviço", "Recurso", "Assistente", "Observação") AS 
  Select Atendime.Cd_Atendimento                                    Par_Cd_Atendimento 

      ,Atendime.Cd_Paciente                                       Par_Cd_Paciente
	  
	  ,Nvl(Paciente.nm_social_paciente, Paciente.nm_paciente)     Par_Nm_Paciente
	  
	  ,Dbamv.Fn_Idade( Paciente.Dt_Nascimento,'x X' )             Par_idade_paciente
	  
	  ,Paciente.dt_nascimento                                     Par_Dt_Nascimento
      
	  ,Paciente.tp_sexo                                           Par_Tp_sexo
      
	  ,Paciente.nm_mae                                            Par_nm_mae
      
	  ,DECODE(
        (SELECT COUNT(*)
        FROM dbamv.pw_favorito_paciente favp
        JOIN dbamv.pw_favorito fav ON favp.cd_favorito = fav.cd_favorito
        WHERE favp.cd_paciente = paciente.cd_paciente
        AND fav.cd_prestador = pkg_mvpep_area_pessoal.Fn_Get_Cd_Prestador),
        0, 'N', 'S') Par_sn_favorito
      
	  ,Setor.nm_setor                                             Par_nm_setor

	  ,Decode(Atendime.Dt_Alta,Null,'N', 'S')                     Par_Sn_Pendente

      ,Nvl( (SELECT RTrim( Decode( Filtro_Rapido.Doc_Med, 0, NULL, 'Com Atend. Médico;' )

              || Decode( Filtro_Rapido.Doc_Enf, 0, NULL, 'Com Atend. Enfermagem;' )

              || Decode( Filtro_Rapido.Doc_Out, 0, NULL, 'Com Atend. Outros profissionais;' )

              , ';' ) Filtro

          FROM (

          SELECT pw_documento_clinico.cd_atendimento

                ,Count( Decode( premed_tip_presta.tp_funcao, 'M', 1 ) ) Doc_Med

                ,Count( Decode( premed_tip_presta.tp_funcao, 'E', 1 ) ) Doc_Enf

                ,Count( Decode( premed_tip_presta.tp_funcao, 'M', NULL, 'E', NULL, 1 ) ) Doc_Out

            FROM dbamv.pw_documento_clinico

                ,dbamv.prestador

                ,dbamv.premed_tip_presta

           WHERE prestador.cd_prestador = pw_documento_clinico.cd_prestador

             AND premed_tip_presta.cd_tip_presta = prestador.cd_tip_presta

           GROUP BY pw_documento_clinico.cd_atendimento ) Filtro_Rapido

           WHERE Filtro_Rapido.Cd_Atendimento = Atendime.Cd_Atendimento) , 'Pendente(s)' )     Par_Nm_Filtro

	  ,Null                                                       Par_Cd_ParMed

	  ,Ori_Ate.Cd_Setor                                           Par_Cd_Setor

	  ,Null                                                       Par_Cd_Doc_Clinico

	  ,Triagem_Atendimento.Cd_Triagem_Atendimento                 Par_Cd_Triagem

	  -- *** Acima estao as colunas n?o visiveis na grid ***

	  --

    ,dbamv.fnc_mv_retor_stat_list_pacien( Atendime.Tp_Atendimento

	                                       ,Atendime.Cd_Atendimento

										   ,Null

										   ,Null

										   ,Pkg_MVPEP_Area_Pessoal.Fn_Get_Cd_Prestador

										   ,null

										   ,null

										   ,ori_ate.cd_setor

										   ,Nvl(PreMed_Tip_Presta.Tp_Funcao,'O') )

                                                          Par_Status

      ,Triagem_Atendimento.Ds_Senha                               "Senha"

      ,Triagem_Atendimento.Ds_Senha                               Par_Cd_Senha

	  ,To_Char(Dbamv.Fnc_Mv_Recupera_Data_Hora( Atendime.Dt_Atendimento

                                       ,Atendime.Hr_Atendimento )

            ,'hh24:mi' )                                          "Recepção"

    ,Especialid.Ds_Especialid                                    "Especialidade"

    ,Ser_Dis.Ds_Ser_Dis                                          "Serviço"

    ,Recurso_Central.Ds_Recurso_Central                          "Recurso"

    ,Prestador.Nm_Prestador                                      "Assistente"

    ,It_Agenda_Central.Ds_Observacao_Geral                       "Observação"

  From Dbamv.Atendime

      ,Dbamv.Paciente

	  ,Dbamv.Ori_Ate

	  ,Dbamv.Prestador

	  ,Dbamv.PreMed_Tip_Presta

      ,Dbamv.Triagem_Atendimento

	  ,Dbamv.Setor

	  ,Dbamv.Config_Para

    ,Dbamv.Ser_Dis

    ,Dbamv.Especialid

    ,Dbamv.It_Agenda_central

    ,Dbamv.Agenda_Central

    ,Dbamv.Recurso_Central

 Where Atendime.Tp_Atendimento = 'A'

   AND Atendime.Dt_Atendimento >= Trunc(Sysdate)

   AND ( Atendime.Dt_Alta is null or Atendime.Dt_Alta > (Sysdate-1/24) ) -->> Paciente de alta. fica na lista por 1 hora

   AND Paciente.Cd_Paciente  = Atendime.Cd_Paciente

   AND Ori_Ate.Cd_Ori_Ate    = Atendime.Cd_Ori_Ate

   AND Prestador.Cd_Prestador= Atendime.Cd_Prestador

   AND PreMed_Tip_Presta.Cd_Tip_Presta (+)= Prestador.Cd_Tip_Presta

   AND Triagem_Atendimento.Cd_Atendimento (+)= Atendime.Cd_Atendimento

   AND Setor.Cd_Setor       = Ori_Ate.Cd_Setor

   AND Config_Para.Cd_Multi_Empresa (+)= Atendime.Cd_Multi_Empresa

   AND Ser_Dis.Cd_Ser_Dis      (+)= Atendime.Cd_Ser_Dis

   AND Especialid.Cd_Especialid (+)= Atendime.Cd_Especialid

   AND It_Agenda_Central.Cd_Atendimento (+)= Atendime.Cd_Atendimento

   AND It_Agenda_Central.Cd_It_Agenda_Pai IS NULL

   AND Agenda_Central.Cd_Agenda_Central (+)= It_Agenda_Central.Cd_Agenda_Central

   AND Recurso_Central.Cd_Recurso_Central (+)= Agenda_Central.Cd_Recurso_Central

   AND It_Agenda_Central.cd_it_agenda_pai IS null

 Order By Dbamv.Fnc_Mv_Recupera_Data_Hora( Atendime.Dt_Atendimento, Atendime.Hr_Atendimento )

         ,Atendime.Cd_Atendimento;

   COMMENT ON TABLE "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR"  IS 'AMB-Atendimentos do setor';


  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MV2000";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MV2000";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MV2000";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MV2000";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBAPS";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBASGU";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MVINTEGRA";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBAPS";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBASGU";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MVINTEGRA";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBAPS";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBASGU";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MVINTEGRA";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBAPS";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "DBASGU";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_ATENDIMENTO_SETOR" TO "MVINTEGRA";
