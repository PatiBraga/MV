 SELECT DISTINCT
        movto_opme.dt_mvto_estoque DT_REALIZACAO,--pegar da movimentação estoque
       movto_opme.dt_mvto_estoque,
       movto_opme.cd_atendimento,
       movto_opme.nm_paciente,
       movto_opme.ds_enfermaria,
       movto_opme.cd_convenio,
       movto_opme.nm_convenio,
       (SELECT cirurgia.ds_cirurgia FROM cirurgia,cirurgia_aviso WHERE aviso_cirurgia.cd_aviso_cirurgia = cirurgia_aviso.cd_aviso_cirurgia AND cirurgia_aviso.cd_cirurgia = cirurgia.cd_cirurgia AND  cirurgia_aviso.sn_principal = 'S' )AS ds_cirurgia,
       (SELECT cd_especialid FROM cirurgia_aviso WHERE aviso_cirurgia.cd_aviso_cirurgia = cirurgia_aviso.cd_aviso_cirurgia AND  cirurgia_aviso.sn_principal = 'S')AS cd_especialid,
       (SELECT prestador.nm_prestador FROM prestador_aviso,prestador WHERE aviso_cirurgia.cd_aviso_cirurgia = prestador_aviso.cd_aviso_cirurgia
        AND prestador_aviso.cd_prestador     = prestador.cd_prestador  AND  prestador_aviso.sn_principal     = 'S' AND ROWNUM =1) AS nm_prestador,
       (SELECT cirurgia.cd_pro_fat FROM cirurgia,cirurgia_aviso WHERE aviso_cirurgia.cd_aviso_cirurgia = cirurgia_aviso.cd_aviso_cirurgia AND cirurgia_aviso.cd_cirurgia = cirurgia.cd_cirurgia AND  cirurgia_aviso.sn_principal = 'S' ) AS cd_pro_fat,
       movto_opme.qt_movimentacao,
       movto_opme.cd_produto,
       movto_opme.ds_produto,
       movto_opme.cd_lote,
       movto_opme.nm_fornecedor
 FROM   dbamv.aviso_cirurgia,

      (Select ItMvto.Cd_Produto                        Cd_Produto
            ,Produto.Ds_produto                         Ds_produto
            ,Produto_Fornecedor.Cd_Prod_Forn            Cd_Produto_Fornecedor
            ,Mvto.Cd_Atendimento                         Cd_Atendimento
            ,Paciente.Nm_Paciente                       Nm_Paciente
            ,leito.ds_enfermaria
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
          ,dbamv.leito
      where Mvto.cd_estoque in ( select cd_estoque
                                         from dbamv.estoque
                                        where cd_multi_empresa = 1)
        and Mvto.Cd_Mvto_Estoque                                = itMvto.Cd_Mvto_Estoque
        and itMvto.Cd_Fornecedor                                   = Fornecedor.Cd_Fornecedor(+)
        and itMvto.Cd_Produto                                         = produto.cd_produto
        and produto.sn_consignado                                  = 'S'
        and Produto.Cd_Produto                                       = produto_fornecedor.cd_produto(+)
        and Mvto.Cd_Atendimento                                 = Atendime.Cd_Atendimento
        and Atendime.Cd_Convenio                                = Convenio.Cd_Convenio(+)
        and Atendime.Cd_Paciente                                = Paciente.Cd_Paciente
        And itmvto.cd_uni_pro                                   = uni_pro.cd_uni_pro
        AND atendime.cd_leito                                   = leito.cd_leito
      --  AND Mvto.Cd_Atendimento = 1058807
      --  AND PRODUTO.CD_ ESPECIE = '2'

       AND Trunc (Mvto.dt_mvto_estoque) BETWEEN @P_DT_INI AND @P_DT_FIM
      Group By ItMvto.Cd_Produto
            ,Produto.Ds_produto
            ,Produto_Fornecedor.Cd_Prod_Forn
            ,Mvto.Cd_Atendimento
            ,Paciente.Nm_Paciente
            ,leito.ds_enfermaria
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
   )movto_opme  --movimenteção OPME
 WHERE movto_opme.cd_atendimento   = aviso_cirurgia.cd_atendimento (+) --cláusula retorno do  aviso_cirurgia opcional
--   AND  movto_opme.cd_atendimento = 1069244
 AND  {V_VAR}
