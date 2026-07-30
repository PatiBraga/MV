SELECT TO_CHAR(mov_caixa.dt_movimentacao, 'DD/MM/YYYY')  AS dt_movimentacao
     , NVL(paciente.nr_cpf, nota_fiscal.nr_cgc_cpf)       AS nr_cpf
     , mov_caixa.vl_movimentacao tp_quitacao
     , TO_CHAR(reccon_rec.dt_recebimento, 'DD/MM/YYYY')   AS dt_recebimento
     , con_rec.cd_atendimento
     , mov_caixa.ds_mov_caixa
     , tp_origem_mov
     , ds_reccon_rec



  FROM dbamv.con_rec
  JOIN dbamv.itcon_rec  ON itcon_rec.cd_con_rec    = con_rec.cd_con_rec
  JOIN dbamv.reccon_rec ON reccon_rec.cd_itcon_rec  = itcon_rec.cd_itcon_rec
  JOIN dbamv.mov_caixa  ON mov_caixa.cd_mov_caixa   = reccon_rec.cd_mov_caixa
  JOIN dbamv.atendime   ON atendime.cd_atendimento  = con_rec.cd_atendimento
  JOIN dbamv.paciente   ON paciente.cd_paciente     = atendime.cd_paciente
  LEFT JOIN dbamv.nota_fiscal
                        ON nota_fiscal.cd_nota_fiscal = con_rec.cd_nota_fiscal

 WHERE con_rec.tp_con_rec = 'P'
   AND TRUNC(mov_caixa.dt_movimentacao)
         BETWEEN TRUNC(SYSDATE - 30) AND TRUNC(SYSDATE)







