--  Data procedimento, Atendimento, Paciente, Convênio, Procedimento, Local, Médico, Quantidade, Cód. Material, Material Usado, Referência, Lote, Fornecedor.
--SELECT *
--  FROM guia
-- WHERE tp_guia  ='O'
SELECT DISTINCT
       AVISO_CIRURGIA . DT_REALIZACAO
     , aviso_cirurgia . cd_atendimento
     , aviso_cirurgia . nm_paciente
     , atendime  . cd_convenio
     , nm_convenio
     , cirurgia.ds_cirurgia
     , cirurgia_aviso.cd_especialid
     , cen_cir . cd_cen_cir
     ,  cen_cir . ds_cen_cir
     , CIRURGIA.cd_pro_fat
     --, itmvto.qt_movimentacao
     , Nvl (prestador . nm_prestador, 'NAO INFORMADO')      NM_PRESTADOR
       ,cd_mvto_estoque  ,cirurgia_aviso . cd_aviso_cirurgia
  FROM dbamv . aviso_cirurgia
     , dbamv . atendime
     , dbamv . convenio
     , dbamv . cirurgia_aviso
     , dbamv . cirurgia
     , dbamv . cen_cir
     , dbamv . PRESTADOR_AVISO
     , dbamv . mvto_estoque mvto
--     , dbamv . itmvto_estoque itmvto
     , dbamv . prestador
 WHERE atendime.cd_atendimento = aviso_cirurgia.cd_atendimento
   AND atendime.cd_convenio    = convenio. cd_convenio
   AND AVISO_CIRURGIA.cd_aviso_cirurgia  =  cirurgia_aviso . cd_aviso_cirurgia
   AND cirurgia_aviso.cd_cirurgia     =  cirurgia.cd_cirurgia
   AND aviso_cirurgia . cd_cen_cir = cen_cir . cd_cen_cir
   AND AVISO_CIRURGIA.cd_aviso_cirurgia = PRESTADOR_AVISO.cd_aviso_cirurgia
   AND PRESTADOR_AVISO . cd_prestador = prestador . cd_prestador (+)
   AND PRESTADOR_AVISO. sn_principal='S'
   AND mvto.cd_aviso_cirurgia (+)= aviso_cirurgia.cd_aviso_cirurgia
--   AND  mvto.cd_mvto_estoque += itmvto.cd_mvto_estoque

   AND aviso_cirurgia.cd_atendimento  =  1067818

  SELECT * FROM solsai_pro WHERE cd_atendimento  =  1067818


                                                          cd_ it solsai_pro