-- R_CON_PAG 1


SELECT  *
FROM   (SELECT  Decode(pgto.tp_pagamento,'3',(SELECT x.dt_movimentacao FROM dbamv.mov_concor x WHERE x.cd_pagcon_pag = pgto.cd_pagcon_pag AND ROWNUM = 1),pgto.dt_pagamento)  dt_pagamento
               ,pgto.dt_baixa
               ,cnta.dt_lancamento
               ,dbamv.fnc_moeda_depara(pgto.cd_moeda,'',pgto.vl_pago,pgto.vl_moeda)      vl_pago
               --,cnta.nr_documento || '/' || to_char(  parc.nr_parcela, '000' )                          nr_documento
               ,Decode(,'S',cnta.nr_ncf,cnta.nr_documento || '/' || to_char(  parc.nr_parcela, '000' )) nr_documento
               ,(SELECT Count(*) FROM dbamv.itcon_pag x WHERE x.cd_con_pag = parc.cd_con_pag)           qtd_itens_con_pag
               ,LTrim((SELECT x.ds_historico_padrao FROM historico_padrao x WHERE x.cd_historico_padrao = cnta.cd_historico_padrao AND ROWNUM = 1))||' '||LTrim(cnta.ds_con_pag) ds_hist_padrao
               ,Decode(pgto.cd_con_cor,NULL,NULL,(SELECT b.nm_banco FROM dbamv.con_cor x, dbamv.banco b WHERE x.cd_con_cor = pgto.cd_con_cor AND x.cd_banco = b.cd_banco AND ROWNUM = 1)) nm_banco
               ,dbamv.fnc_moeda_depara(cnta.cd_moeda,'',parc.vl_duplicata,parc.vl_moeda) vl_duplicata
               ,cnta.cd_reduzido                                                                        cd_reduzido_resultado
               ,(CASE WHEN (SELECT x.cd_contabil FROM dbamv.plano_contas x WHERE x.cd_reduzido = cnta.cd_reduzido AND ROWNUM = 1) IS NULL
                    THEN (SELECT pe.cd_contabil FROM dbamv.plano_contabil p, dbamv.plano_estr pe WHERE p.cd_plano_estr = pe.cd_plano_estr AND p.cd_reduzido = cnta.cd_reduzido AND ROWNUM = 1)
                    ELSE (SELECT x.cd_contabil FROM dbamv.plano_contas x WHERE x.cd_reduzido = cnta.cd_reduzido AND ROWNUM = 1)
                  END
                ) cd_contabil
               ,cnta.cd_fornecedor
               ,Decode(cnta.cd_fornecedor,NULL,cnta.ds_fornecedor,(SELECT x.nm_fantasia FROM dbamv.fornecedor x WHERE x.cd_fornecedor = cnta.cd_fornecedor AND ROWNUM = 1)) nm_fantasia
               ,Decode(pgto.cd_cheque,NULL,pgto.cd_bordero,(SELECT x.nr_cheque FROM dbamv.cheque x WHERE x.cd_cheque = pgto.cd_cheque AND ROWNUM = 1))  che_bord
               ,(SELECT x.dt_compensacao FROM dbamv.cheque x WHERE x.cd_cheque = pgto.cd_cheque AND ROWNUM = 1) dt_compensacao
               ,pgto.dt_baixa     dt_baixa_
               ,pgto.dt_pagamento dt_pagamento_
               ,pgto.tp_pagamento tp_pagamento_q
               ,pgto.dt_estorno
               ,dbamv.fnc_moeda_depara(pgto.cd_moeda,'',pgto.vl_pago,pgto.vl_moeda)   vl_estorno
               ,parc.dt_vencimento
               ,parc.dt_prevista_pag
               ,(SELECT x.ds_conta FROM dbamv.plano_contas x WHERE x.cd_reduzido = cnta.cd_reduzido and x.cd_multi_empresa = cnta.cd_multi_empresa AND ROWNUM = 1) ds_reduzido
               ,(SELECT dt_predatada FROM dbamv.cheque WHERE cd_cheque =  pgto.cd_cheque) dt_predatada
        FROM    dbamv.con_pag cnta,
                dbamv.itcon_pag parc,
                dbamv.pagcon_pag pgto
        WHERE   cnta.cd_con_pag = parc.cd_con_pag
          AND   parc.cd_itcon_pag = pgto.cd_itcon_pag
          AND   cnta.cd_processo NOT IN (SELECT p.cd_processo
                                         FROM   dbamv.processo p
                                         WHERE  p.cd_estrutural = '1.2.1.1.5'
                                           AND  p.cd_multi_empresa = cnta.cd_multi_empresa)
       )