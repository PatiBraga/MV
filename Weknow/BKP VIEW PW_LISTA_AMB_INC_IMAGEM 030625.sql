CREATE OR REPLACE FORCE EDITIONABLE VIEW "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" ("PAR_CD_ATENDIMENTO", "PAR_CD_PACIENTE", "PAR_NM_FILTRO", "leito","tipo_atendimento", "PAR_NM_PACIENTE", "PROTOCOLO", "PAR_STATUS", "PAR_IDADE_PACIENTE", "CONVENIO", "recepcao", "Especialidade", "Assistente") AS 
  SELECT DISTINCT ATENDIME.CD_ATENDIMENTO par_cd_atendimento,
       ATENDIME.CD_PACIENTE  par_cd_paciente,
        Decode(itped_RX.sn_realizado,Null,'N', 'S')  par_nm_filtro,
--        ATENDIME.CD_ATENDIMENTO par_nm_filtro,
       leito.ds_enfermaria "LEITO",
       decode(Atendime.Tp_Atendimento,'I','Internação','A','Ambulatório','E','Externo','U','Urgência')tipo_atendimento,
        paciente.nm_paciente  par_nm_paciente,
           DBMS_LOB.SUBSTR(PTL.DS_PROTOCO, 4000, 1) AS "PROTOCOLO"  ,
            dbamv.fnc_mv_retor_stat_list_pacien( Atendime.Tp_Atendimento
	                                       ,Atendime.Cd_Atendimento
										   ,Null
										   ,Null
										   ,Pkg_MVPEP_Area_Pessoal.Fn_Get_Cd_Prestador
										   ,null
										   ,null
										   ,ori_ate.cd_setor                                                                                       
										   ,Nvl(PreMed_Tip_Presta.Tp_Funcao,'O') )
                                                                  Par_Status ,

       Decode(paciente.dt_nascimento, NULL, NULL, dbamv.fn_idade(paciente.dt_nascimento, 'a A m M', sysdate)) AS Par_idade_paciente,
       (SELECT nm_convenio FROM convenio WHERE convenio.cd_convenio = atendime.cd_convenio) "CONVENIO"  ,
        To_Char(dt_pedido, 'hh24:mi') AS "recepcao",
       Especialid.Ds_Especialid as "Especialidade" ,
       Prestador.Nm_Prestador as "Assistente"
  FROM ATENDIME
     , PED_RX
     , ITPED_RX
     , EXA_RX
     , SET_EXA
     , PACIENTE
     , leito
     , Triagem_Atendimento
     , Especialid
     , Prestador
     , PreMed_Tip_Presta
     , ori_ate
     ,(  SELECT  pw_documento_clinico.cd_atendimento,RTRIM(XMLAGG(XMLELEMENT(e, ds_alerta_protocolo || '; ').EXTRACT('//text()') ORDER BY NULL).GetClobVal(), '; ')AS DS_PROTOCO
      FROM DBAMV.PW_PONTO_ENTRADA_PROTOCOLO
         , DBAMV.PW_ALERTA_PROTOCOLO
         , DBAMV.pw_documento_clinico
         , DBAMV.PW_EDITOR_CLINICO
      WHERE PW_PONTO_ENTRADA_PROTOCOLO.cd_alerta_protocolo =  PW_ALERTA_PROTOCOLO.cd_alerta_protocolo
         AND PW_PONTO_ENTRADA_PROTOCOLO.CD_DOCUMENTO    =  PW_EDITOR_CLINICO.CD_DOCUMENTO
         AND pw_documento_clinico.cd_documento_clinico  =  PW_EDITOR_CLINICO.cd_documento_clinico
         AND PW_EDITOR_CLINICO.CD_DOCUMENTO             IN   (130,134,135,136,125,131)
         GROUP BY pw_documento_clinico.cd_atendimento
     )PTL
  WHERE ATENDIME.CD_ATENDIMENTO = PED_RX.CD_ATENDIMENTO
    AND PED_RX.CD_PED_RX        = ITPED_RX.CD_PED_RX
    AND ITPED_RX.CD_EXA_RX      = EXA_RX.CD_EXA_RX
    AND PED_RX.CD_SET_EXA     = SET_EXA.CD_SET_EXA
    AND PACIENTE.CD_PACIENTE    = ATENDIME.CD_PACIENTE
    AND ATENDIME.CD_LEITO       = LEITO.CD_LEITO (+)
    AND TRIAGEM_ATENDIMENTO.CD_ATENDIMENTO (+)= ATENDIME.CD_ATENDIMENTO
    AND PTL.CD_ATENDIMENTO (+)= ATENDIME.CD_ATENDIMENTO
    AND ESPECIALID.CD_ESPECIALID = ATENDIME.CD_ESPECIALID
    AND PRESTADOR.CD_PRESTADOR = ATENDIME.CD_PRESTADOR
    AND PREMED_TIP_PRESTA.CD_TIP_PRESTA (+)= PRESTADOR.CD_TIP_PRESTA
    AND Ori_Ate.Cd_Ori_Ate    = Atendime.Cd_Ori_Ate
--    AND itped_RX.sn_realizado != 'S'
    AND atendime.tp_atendimento IN ('I','E')
    AND dt_alta IS NULL
    AND Trunc (PED_RX.DT_PEDIDO) = trunc(sysdate) --BETWEEN Trunc (SYSDATE -7) AND  Trunc (SYSDATE +2 )
    AND ITPED_RX.SN_REALIZADO IS NULL
  -- AND ATENDIME. cd_atendimento        =  982042
  GROUP BY
       ATENDIME.CD_ATENDIMENTO ,
       ATENDIME.CD_PACIENTE  ,
       Decode(itped_RX.sn_realizado,Null,'N', 'S') ,
       leito.ds_enfermaria,
        decode(Atendime.Tp_Atendimento,'I','Internação','A','Ambulatório','E','Externo','U','Urgência'),
       paciente.nm_paciente ,
       atendime.cd_paciente,
        DBMS_LOB.SUBSTR(PTL.DS_PROTOCO, 4000, 1) ,
       paciente.dt_nascimento,
       atendime.cd_convenio  ,
       Atendime.Dt_Atendimento,
       Atendime.Hr_Atendimento,
       Atendime.Dt_Atendimento,
       Especialid.Ds_Especialid ,
       Atendime.Tp_Atendimento,
       Prestador.Nm_Prestador ,
       ori_ate.cd_setor,
			PreMed_Tip_Presta.Tp_Funcao
  ORDER BY  "dt_pedido" ASC;

   COMMENT ON COLUMN "DBAMV"."PW_LISTA_AMB_INC_IMAGEM"."PAR_CD_PACIENTE" IS 'Código do paciente para ser passado a area de prontuário. Esta informação não é exibida na grid';
   COMMENT ON COLUMN "DBAMV"."PW_LISTA_AMB_INC_IMAGEM"."PAR_NM_PACIENTE" IS 'Nome do paciente. TAMANHO_80%';
   COMMENT ON COLUMN "DBAMV"."PW_LISTA_AMB_INC_IMAGEM"."Especialidade" IS 'Nome da Especialidade. TAMANHO_75%';
   COMMENT ON COLUMN "DBAMV"."PW_LISTA_AMB_INC_IMAGEM"."Assistente" IS 'Nome do Assistente. TAMANHO_75%';
   COMMENT ON TABLE "DBAMV"."PW_LISTA_AMB_INC_IMAGEM"  IS 'AMB-Atendimentos com pedido RX';


  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBAPS";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBAPS";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBAPS";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBAPS";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBASGU";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBASGU";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBASGU";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "DBASGU";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MV2000";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MV2000";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MV2000";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MV2000";
  GRANT DELETE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MVINTEGRA";
  GRANT INSERT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MVINTEGRA";
  GRANT SELECT ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MVINTEGRA";
  GRANT UPDATE ON "DBAMV"."PW_LISTA_AMB_INC_IMAGEM" TO "MVINTEGRA";
