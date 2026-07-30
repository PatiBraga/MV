SELECT DISTINCT
       aviso_cirurgia.DT_REALIZACAO,
       movto_opme.dt_mvto_estoque, --referencia
       movto_opme.cd_atendimento,
       movto_opme.nm_paciente,
       movto_opme.cd_convenio,
       movto_opme.nm_convenio,
       cirurgia.ds_cirurgia,
       cirurgia_aviso.cd_especialid,
       cen_cir.ds_cen_cir,      --local
       cirurgia.cd_pro_fat,
       NVL(prestador.nm_prestador, 'NAO INFORMADO') AS nm_prestador,
       movto_opme.qt_movimentacao,
       movto_opme.cd_produto,
       movto_opme.ds_produto,
       movto_opme.cd_lote,
       movto_opme.nm_fornecedor
 FROM   dbamv.aviso_cirurgia,
        dbamv.cirurgia_aviso,
        dbamv.cirurgia,
        dbamv.cen_cir,
        dbamv.prestador_aviso,
        dbamv.prestador,

      (Select ItMvto.Cd_Produto                        Cd_Produto
            ,Produto.Ds_produto                         Ds_produto
            ,Produto_Fornecedor.Cd_Prod_Forn            Cd_Produto_Fornecedor
            ,Mvto.Cd_Atendimento                         Cd_Atendimento
            ,Paciente.Nm_Paciente                       Nm_Paciente
      --      ,(SELECT nm_setor FROM setor WHERE Mvto.Cd_Setor ) nm_Setor
            ,ItMvto. qt_movimentacao
            ,ItMvto.Cd_Fornecedor                       Cd_Fornecedor
            ,Fornecedor.Nm_Fornecedor                   Nm_Fornecedor
            ,atendime.cd_convenio                       cd_convenio
            ,convenio.nm_convenio                       nm_convenio
            ,Mvto.Cd_Aviso_Cirurgia                     Cd_Aviso_Cirurgia
      --      ,aviso_cirurgia.dt_realizacao
            ,ItMvto.Cd_Lote                             Cd_Lote
            ,ItMvto.Dt_Validade                          Dt_Validade
            ,Min(To_Date(To_Char(Mvto.dt_mvto_estoque,'DD/MM/YYYY'),'DD/MM/YYYY'))  Dt_mvto_estoque

      From Dbamv.mvto_estoque Mvto
          ,Dbamv.itmvto_estoque ItMvto
          ,Dbamv.Fornecedor
          ,Dbamv.Paciente
          ,Dbamv.atendime
          ,Dbamv.Convenio
          ,Dbamv.Produto
          ,Dbamv.Produto_Fornecedor
          ,Dbamv.Uni_Pro
      where Mvto.cd_estoque in ( select cd_estoque
                                         from dbamv.estoque
                                        where cd_multi_empresa = 1)
        and Mvto.Cd_Mvto_Estoque                                = itMvto.Cd_Mvto_Estoque
        and itMvto.Cd_Fornecedor                                = Fornecedor.Cd_Fornecedor(+)
        and itMvto.Cd_Produto                                   = produto.cd_produto
        and produto.sn_consignado                               = 'S'
        and Produto.Cd_Produto                                  = produto_fornecedor.cd_produto(+)
        and Mvto.Cd_Atendimento                                 = Atendime.Cd_Atendimento
        and Atendime.Cd_Convenio                                = Convenio.Cd_Convenio(+)
        and Atendime.Cd_Paciente                                = Paciente.Cd_Paciente
        And itmvto.cd_uni_pro                                   = uni_pro.cd_uni_pro
      --  AND Mvto.Cd_Atendimento = 1058807
      --  AND PRODUTO.CD_ ESPECIE = '2'

       AND Trunc (Mvto.dt_mvto_estoque) BETWEEN  To_Date ('04/09/2025','dd/mm/yyyy') AND To_Date ('08/10/2025','dd/mm/yyyy') --@P_DT_INI AND @P_DT_FIM
      Group By ItMvto.Cd_Produto
            ,Produto.Ds_produto
            ,Produto_Fornecedor.Cd_Prod_Forn
            ,Mvto.Cd_Atendimento
            ,Paciente.Nm_Paciente
            ,Mvto.Cd_Setor
            ,ItMvto.qt_movimentacao
            ,Atendime.Cd_Prestador
            ,ItMvto.Cd_Fornecedor
            ,Fornecedor.Nm_Fornecedor
            ,atendime.cd_convenio
            ,convenio.nm_convenio
            ,Mvto.Cd_Aviso_Cirurgia
            ,ItMvto.Cd_Lote
            ,ItMvto.Dt_Validade
      Having ( sum(decode(Mvto.tp_mvto_estoque, 'P', 1, 0) * ItMvto.qt_movimentacao  * Uni_pro.vl_fator)/dbamv.verif_vl_fator_prod(itmvto.cd_produto) - sum(decode(Mvto.tp_mvto_estoque, 'C', 1, 0) * ItMvto.qt_movimentacao  * Uni_pro.vl_fator)/dbamv.verif_vl_fator_prod(itmvto.cd_produto) )  > 0
   )movto_opme
 WHERE movto_opme.cd_atendimento   = aviso_cirurgia.cd_atendimento (+)
   AND movto_opme.cd_aviso_cirurgia = cirurgia_aviso.cd_aviso_cirurgia
   AND aviso_cirurgia.cd_aviso_cirurgia = cirurgia_aviso.cd_aviso_cirurgia
   AND  cirurgia_aviso.cd_cirurgia       = cirurgia.cd_cirurgia
   AND  aviso_cirurgia.cd_cen_cir        = cen_cir.cd_cen_cir
   AND  aviso_cirurgia.cd_aviso_cirurgia = prestador_aviso.cd_aviso_cirurgia
   AND  prestador_aviso.cd_prestador     = prestador.cd_prestador(+)
   AND  prestador_aviso.sn_principal     = 'S'
   AND  cirurgia_aviso.sn_principal      = 'S'
--  AND movto_opme. cd_produto  = 12378
  AND movto_opme.cd_atendimento   IN (1070949,1069244)
--  AND  {V_VAR}



