select --es.cd_multi_empresa cod_empresa,
      -- me.ds_multi_empresa empresa,

       ep.cd_estoque       cod_estoque,
       es.ds_estoque       estoque,
       E.cd_especie        cod_especie,
      e.ds_especie        especie,
       p.cd_classe         cod_classe,
       c.ds_classe         classe,
       --p.cd_sub_cla        cod_sub_classe,
       --sc.ds_sub_cla       sub_classe,
       ep.cd_produto       cod_produto,
       p.ds_produto         produto,
       decode(p.sn_consignado,'S','Consignado'
                             ,'N','Normal'
                            ,'R','Reprocessado')tipo_produto,
       decode(p.sn_mestre,'S','Mestre'
                         ,'N','Filho')mestre,
       up.ds_unidade       unidade,
       --nvl(ep.qt_estoque_atual,0) qtd,
       --nvl(p.vl_custo_medio,0)    vl_custo_medio,
       --nvl(p.vl_ultima_entrada,0) vl_ultima_entrada,
       --p.dt_ultima_entrada        dt_ultima_ntrada,
       --nvl(p.qt_ultima_entrada,0) qtd_ultima_entrada,
       --l.ds_localizacao           localizacao_produto,
       lp.cd_lote                 lote,
       to_char(lp.dt_validade, 'DD/MM/YYYY')             validade,
       lp.qt_estoque_atual * up.vl_fator / dbamv.verif_vl_fator_prod(p.cd_produto) qtd_atual,
       lp.qt_kit * up.vl_fator / dbamv.verif_vl_fator_prod(p.cd_produto) qt_kit,
       emp.tp_classificacao_abc,
       (Lp.Qt_Estoque_Atual - Lp.Qt_Kit) * up.vl_fator / dbamv.verif_vl_fator_prod(p.cd_produto) qt_disponivel,
       Nvl(( verif_vl_custo_medio(p.cd_produto,sysdate,'H',p.vl_custo_medio,SYSDATE,10) * verif_vl_fator_prod ( p.cd_produto )),0) vl_custo_medio,
       (Lp.Qt_Estoque_Atual - Lp.Qt_Kit) * up.vl_fator / dbamv.verif_vl_fator_prod(p.cd_produto)*Nvl(( verif_vl_custo_medio(p.cd_produto,sysdate,'H',p.vl_custo_medio,SYSDATE,10) * verif_vl_fator_prod ( p.cd_produto )),0) VL_TOTAL


from  produto p

inner join especie  e ON p.cd_especie = e.cd_especie

inner join classe   c ON c.cd_especie = e.cd_especie

inner join sub_clas sc ON sc.cd_especie=e.cd_especie

inner join est_pro  ep ON p.cd_produto = ep.cd_produto

inner join estoque  es ON es.cd_estoque = ep.cd_estoque
inner join uni_pro  up ON up.cd_produto = p.cd_produto
inner join multi_empresas me ON es.cd_multi_empresa=me.cd_multi_empresa
full outer join localizacao l ON ep.cd_localizacao = l.cd_localizacao
inner join lot_pro lp ON lp.cd_estoque = ep.cd_estoque
inner join empresa_produto emp ON p.cd_produto = emp.cd_produto
--inner join itent_pro ip ON p.cd_produto = ip.cd_produto

--inner join (SELECT cd_produto, MAX(dt_gravacao) AS MAIOR_DATA FROM itent_pro GROUP BY cd_produto) RECENTES

--ON ip.cd_produto = RECENTES.cd_produto AND ip.dt_gravacao = recentes.MAIOR_DATA


where 1=1       --SELECT * FROM uni_pro where CD_PRODUTO = 23312


and   lp.cd_produto = ep.cd_produto
and   sc.cd_classe=c.cd_classe
and   p.cd_classe=c.cd_classe
and   p.cd_sub_cla=sc.cd_sub_cla
AND   p.cd_produto = 23312
AND   ep.cd_estoque = 51
and   emp.CD_MULTI_EMPRESA = 10
and   lp.qt_estoque_atual > 0
AND   UP.TP_RELATORIOS = 'R'
--and   ep.tp_classificacao_abc = 'A'


order by

p.ds_produto,
ep.cd_estoque,
ep.cd_produto,
lp.cd_lote




--SELECT * FROM empresa_produto WHERE CD_MULTI_EMPRESA = 10 AND cd_produto = 23793