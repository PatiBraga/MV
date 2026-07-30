SELECT   set_exa.cd_setor

            ,COUNT ( * ) qtd

        FROM dbamv.ped_rx

            ,dbamv.itped_rx

            ,dbamv.set_exa

            ,dbamv.setor

     --       ,dbamv.setor_item si

       WHERE itped_rx.dt_realizado BETWEEN To_Date('01/09/2025', 'DD/MM/YYYY') AND  To_Date('30/09/2025', 'DD/MM/YYYY')--Decode(setor.tp_oripedido_ffch,
             --       'S', trunc(ped_rx.dt_pedido, 'MM'),
              --       trunc(itped_rx.dt_realizado, 'MM')) = to_date(p_dt_comp, 'mm/yyyy')

        -- AND
         AND itped_rx.cd_ped_rx = ped_rx.cd_ped_rx

         AND ped_rx.cd_set_exa = set_exa.cd_set_exa

         AND set_exa.cd_setor = setor.cd_setor

     --    AND (setor.cd_multi_empresa = p_cd_multi_empresa OR

       --      (p_regra_csc = 'S' AND setor.cd_multi_empresa IN (select cfc.cd_multi_empresa_destino FROM dbamv.config_ffch_csc cfc

   --      WHERE cfc.cd_multi_empresa_origem = p_cd_multi_empresa)))

      --   AND setor.cd_setor = si.cd_setor

      --   AND si.cd_item_producao = pcd_item_producao

    -     AND setor.sn_aceita_lancamento = 'S'

    GROUP BY set_exa.cd_setor
    ORDER BY set_exa.cd_setor





SELECT * FROM dbamv.producao_mensal
WHERE --DT_COMPETENCIA = To_Date('01/09/2025', 'DD/MM/YYYY')
--AND
CD_ITEM_PRODUCAO = 'NQTDEXAME'


        SELECT * FROM item_prod_mensal
        where CD_ITEM_PRODUCAO = 'NQTDEXAME'