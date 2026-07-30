SELECT
--   cd_multi_empresa,
   DT_EMISSAO,
   dt_vencimento,
   dt_entrada,
   NR_DOCUMENTO,
   NR_SERIE,
   ds_tip_doc,
   TP_NFENTRADA,
   nm_fantasia,
   CASE
     WHEN length(nr_cgc_cpf) = 11 THEN regexp_replace(LPAD(nr_cgc_cpf, 11, '0'), '([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})','\1.\2.\3-\4')
     ELSE regexp_replace(LPAD(nr_cgc_cpf, 15, '0'),'([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})','\1.\2.\3/\4-\5')  END NR_CGC_CPF,
   VL_TOTAL

FROM
   (
   select
      documento_entrada.dt_emissao,
      documento_entrada.dt_entrada ,
      documento_entrada.sn_importada_fnfi ,
      documento_entrada.nr_documento ,
      documento_entrada.nr_serie ,
      documento_entrada.cd_fornecedor ,
      fornecedor.nm_fornecedor ,
      fornecedor.nm_fantasia ,
      fornecedor.nr_cgc_cpf,
      documento_entrada.vl_total ,
      max(ent.cd_ent_pro) cd_ent_pro ,
      documento_entrada.cd_multi_empresa ,
      documento_entrada.vl_saldo_documento ,
      documento_entrada.tp_documento_entrada ,
      min(duplicata.dt_vencimento) dt_vencimento ,
      configest.vl_percentual_variacao ,
      'Produto' as tp_nfEntrada,
      tip_doc.ds_tip_doc
   from
      dbamv.documento_entrada ,
      dbamv.ent_pro ent ,
      dbamv.duplicata ,
      dbamv.fornecedor ,
      dbamv.configest,
      dbamv.tip_doc
   where
      fornecedor.cd_fornecedor = documento_entrada.cd_fornecedor
      and ent.cd_fornecedor = documento_entrada.cd_fornecedor
      and ent.nr_documento = documento_entrada.nr_documento
      and tip_doc.cd_tip_doc = documento_entrada.cd_tip_doc
      and ent.nr_serie = documento_entrada.nr_serie
      and duplicata.cd_fornecedor(+)= documento_entrada.cd_fornecedor
      and duplicata.nr_documento (+)= documento_entrada.nr_documento
      and duplicata.nr_serie (+)= documento_entrada.nr_serie
      AND documento_entrada.SN_IMPORTADA_FNFI = 'N'
      And dbamv.FNC_MGES_CONSIG_SUS(ent.cd_atendimento,ent.cd_ent_pro,nvl(fornecedor.sn_cobranca_fornec,'N')) = 'N'
      AND dbamv.pkg_transacao_entre_empresas.fnc_processo_emp_transacao(:cd_multi_empresa,documento_entrada.cd_multi_empresa ,'2.1.1.1.1') in ('1','3')
      And Ent.Cd_Estoque in (
         Select
            Estoque.Cd_Estoque
         From
            Dbamv.Estoque
         Where
            dbamv.pkg_transacao_entre_empresas.fnc_processo_emp_transacao(:cd_multi_empresa, Estoque.cd_multi_empresa ,'2.1.1.1.1') in (
               '1','3'
         )
      )
   group by
      documento_entrada.dt_emissao,
      documento_entrada.dt_entrada ,
      documento_entrada.sn_importada_fnfi ,
      documento_entrada.nr_documento ,
      documento_entrada.nr_serie ,
      documento_entrada.cd_fornecedor ,
      documento_entrada.vl_total ,
      documento_entrada.cd_multi_empresa ,
      documento_entrada.vl_saldo_documento ,
      documento_entrada.tp_documento_entrada ,
      fornecedor.nm_fornecedor ,
      fornecedor.nm_fantasia ,
      fornecedor.nr_cgc_cpf,
      configest.vl_percentual_variacao,
      tip_doc.ds_tip_doc

  Union

  select
      documento_entrada.dt_emissao ,
      ent.dt_entrada ,
      documento_entrada.sn_importada_fnfi ,
      documento_entrada.nr_documento ,
      documento_entrada.nr_serie ,
      documento_entrada.cd_fornecedor ,
      fornecedor.nm_fornecedor ,
      fornecedor.nm_fantasia ,
      fornecedor.nr_cgc_cpf,
      documento_entrada.vl_total ,
      max(ent.cd_ent_serv) cd_ent_serv ,
      documento_entrada.cd_multi_empresa ,
      documento_entrada.vl_saldo_documento ,
      documento_entrada.tp_documento_entrada ,
      min(duplicata.dt_vencimento) dt_vencimento ,
      configest.vl_percentual_variacao ,
      'Serviço' as tp_nfEntrada,
      tip_doc.ds_tip_doc
   from
      dbamv.documento_entrada ,
      dbamv.ent_serv ent ,
      dbamv.duplicata ,
      dbamv.fornecedor ,
      dbamv.configest,
      dbamv.tip_doc
   where
      fornecedor.cd_fornecedor = documento_entrada.cd_fornecedor
      and ent.cd_fornecedor = documento_entrada.cd_fornecedor
      and ent.nr_documento = documento_entrada.nr_documento
      and ent.nr_serie = documento_entrada.nr_serie
      and tip_doc.cd_tip_doc = documento_entrada.cd_tip_doc
      and duplicata.cd_fornecedor(+)= documento_entrada.cd_fornecedor
      and duplicata.nr_documento (+)= documento_entrada.nr_documento
      and duplicata.nr_serie (+)= documento_entrada.nr_serie
      AND documento_entrada.SN_IMPORTADA_FNFI = 'N'
      AND dbamv.pkg_transacao_entre_empresas.fnc_processo_emp_transacao( :cd_multi_empresa,documento_entrada.cd_multi_empresa ,'2.1.1.1.4')
             in ('1','3')
   group by
      documento_entrada.dt_emissao ,
      ent.dt_entrada ,
      documento_entrada.sn_importada_fnfi ,
      documento_entrada.nr_documento ,
      documento_entrada.nr_serie ,
      documento_entrada.cd_fornecedor ,
      documento_entrada.vl_total ,
      documento_entrada.cd_multi_empresa ,
      documento_entrada.vl_saldo_documento ,
      documento_entrada.tp_documento_entrada ,
      fornecedor.nm_fornecedor ,
      fornecedor.nm_fantasia ,
      fornecedor.nr_cgc_cpf,
      configest.vl_percentual_variacao,
      tip_doc.ds_tip_doc

   UNION

   select
      dev_for.dt_devolucao ,
      ent.dt_entrada ,
      'S' ,
      dev_for.nr_documento ,
      dev_for.nr_serie ,
      ent.cd_fornecedor ,
      fornecedor.nm_fornecedor ,
      fornecedor.nm_fantasia ,
      fornecedor.nr_cgc_cpf,
      dev_for.vl_total ,
      max(dev_for.cd_ent_pro) cd_entrada ,
      estoque.cd_multi_empresa cd_multi_empresa ,
      To_Number(NULL) vl_saldo_documento ,
      'N' tp_documento_entrada ,
      To_Date(Null) dt_vencimento ,
      configest.vl_percentual_variacao ,
      'DevProd' as tp_nfEntrada,
      tip_doc.ds_tip_doc
   from
      dbamv.ent_pro ent,
      dbamv.fornecedor fornecedor,
      dbamv.dev_for dev_for,
      dbamv.configest,
      dbamv.estoque,
      dbamv.tip_doc tip_doc
   Where
      fornecedor.cd_fornecedor = ent.cd_fornecedor
      and ent.nr_documento = ent.nr_documento
      and dev_for.cd_ent_pro = ent.cd_ent_pro
      and ent.cd_estoque = estoque.cd_estoque
      and Nvl(dev_for.SN_INPORTADA_FINFI,'N') = 'N'
      AND ent.cd_tip_doc = tip_doc.cd_tip_doc
      AND tip_doc.tp_entrada = 'N'
   group by
      dev_for.dt_devolucao ,
      ent.dt_entrada,
      'S',
      dev_for.nr_documento,
      dev_for.nr_serie ,
      ent.cd_fornecedor,
      fornecedor.nm_fornecedor,
      fornecedor.nm_fantasia,
      fornecedor.nr_cgc_cpf,
      dev_for.vl_total,
      estoque.cd_multi_empresa,
      'N',
      configest.vl_percentual_variacao,
      tip_doc.ds_tip_doc
)
WHERE
   TP_DOCUMENTO_ENTRADA IN ('N','S')
   and
      (
         ( nvl(vl_percentual_variacao,0) / 100 > 0 and (sign(nvl(VL_TOTAL,0) - nvl(VL_SALDO_DOCUMENTO,0)) = -1
                  or abs(nvl(VL_TOTAL,0) - nvl(VL_SALDO_DOCUMENTO,0)) >= vl_total -  ((nvl(vl_percentual_variacao,0) / 100 ) * nvl(VL_TOTAL,0))
         )
      )
      OR nvl(VL_SALDO_DOCUMENTO,0) = 0

    and trunc(sysdate) - trunc(dt_entrada) >= :dias
   )

   AND
     (
       CASE
         WHEN :TIP_DOC = 'FARMÁCIA' AND ds_tip_doc =  'NOTA FISCAL FARMACIA' THEN 1
         WHEN :TIP_DOC <> 'FARMÁCIA' AND ds_tip_doc <> 'NOTA FISCAL FARMACIA' THEN 1
         ELSE 0
       END ) = 1

order by
 CD_ENT_PRO