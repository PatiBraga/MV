CREATE OR REPLACE PROCEDURE dbamv.rc_numero_exames (

p_processo IN VARCHAR2,                                                                                                                                                 -- identifca se esta procedure deve funcionar somente se declarada dentro da regra

                       p_dt_comp IN VARCHAR2,                                                                                                                                                                         -- data da competencia para gravação

                                             p_cd_multi_empresa IN VARCHAR2,                                                                                                                                         -- codigo da empresa em funcionamento

                                                                            p_cd_setor_origem IN NUMBER

 ,                                                                                                                                                            -- codigo do setor de origem, caso não seja declarado fora de uma regra, este valor vem null

  p_dt_comp_regra IN VARCHAR2,                                                                                                                          -- data da competencia da regra do setor, caso seja declarado fora de uma regra este valor vem null

	p_regra_csc IN VARCHAR2 DEFAULT 'N'

  ) IS

  CURSOR v_item_variaveis IS

    SELECT pp.cd_item_producao

      FROM dbamv.regra_rateio rr

          ,dbamv.item_prod_variavel ipv

          ,dbamv.pesos_producao pp

     WHERE rr.cd_setor = p_cd_setor_origem

       AND trunc(rr.dt_vigencia, 'mm') = to_date(p_dt_comp_regra, 'mm/yyyy')

       AND pp.cd_regra_rateio = rr.cd_regra_rateio

       AND ipv.cd_variavel = 'NQTD_EXAME'

       AND pp.cd_item_producao = ipv.cd_item_producao;



  CURSOR c ( p_cd_item_producao IN VARCHAR2 ) IS

    SELECT producao_mensal.cd_producao_mensal

      FROM dbamv.producao_mensal

     WHERE producao_mensal.cd_setor_origem = p_cd_setor_origem

       AND trunc(producao_mensal.dt_competencia, 'mm') = to_date(p_dt_comp, 'mm/yyyy')

       AND producao_mensal.cd_item_producao = p_cd_item_producao

	   AND producao_mensal.cd_multi_empresa = p_cd_multi_empresa;

  CURSOR c_exame IS

    SELECT   set_exa.cd_setor

            ,COUNT ( * ) qtd

        FROM dbamv.ped_rx

            ,dbamv.itped_rx

            ,dbamv.set_exa

            ,dbamv.setor

       WHERE Decode(setor.tp_oripedido_ffch,
                    'S', trunc(ped_rx.dt_pedido, 'MM'),
                     trunc(itped_rx.dt_realizado, 'MM')) = to_date(p_dt_comp, 'mm/yyyy')

         AND itped_rx.cd_ped_rx = ped_rx.cd_ped_rx

         AND ped_rx.cd_set_exa = set_exa.cd_set_exa

         AND set_exa.cd_setor = setor.cd_setor

         AND (setor.cd_multi_empresa = p_cd_multi_empresa OR

              (p_regra_csc = 'S' AND setor.cd_multi_empresa IN (select cfc.cd_multi_empresa_destino FROM dbamv.config_ffch_csc cfc

         WHERE cfc.cd_multi_empresa_origem = p_cd_multi_empresa)))

         AND setor.sn_aceita_lancamento = 'S'

    GROUP BY set_exa.cd_setor;



  CURSOR c_item IS

     SELECT empr.cd_item_producao

     FROM dbamv.rotinas_custo rc,

          dbamv.item_producao ip,

          dbamv.item_producao_empr empr

     WHERE ip.cd_item_producao = empr.cd_item_producao

     AND   empr.cd_multi_empresa = Nvl(p_cd_multi_empresa, dbamv.pkg_mv2000.le_empresa)

     AND  rc.cd_rotina  =  empr.cd_rotina

     AND  rc.ds_comando = 'RC_NUMERO_EXAMES';




  CURSOR c_producao ( p_cd_item_producao IN VARCHAR2 ) IS

    SELECT producao_mensal.cd_producao_mensal

      FROM dbamv.producao_mensal

     WHERE producao_mensal.cd_setor_origem IS NULL

       AND trunc(producao_mensal.dt_competencia, 'mm') = to_date(p_dt_comp, 'mm/yyyy')

       AND producao_mensal.cd_item_producao = p_cd_item_producao

	   AND producao_mensal.cd_multi_empresa = p_cd_multi_empresa;

  CURSOR c_exame_prod ( pcd_item_producao IN VARCHAR2 ) IS

    SELECT   set_exa.cd_setor

            ,COUNT ( * ) qtd

        FROM dbamv.ped_rx

            ,dbamv.itped_rx

            ,dbamv.set_exa

            ,dbamv.setor

            ,dbamv.setor_item si

       WHERE Decode(setor.tp_oripedido_ffch,
                    'S', trunc(ped_rx.dt_pedido, 'MM'),
                     trunc(itped_rx.dt_realizado, 'MM')) = to_date(p_dt_comp, 'mm/yyyy')

         AND itped_rx.cd_ped_rx = ped_rx.cd_ped_rx

         AND ped_rx.cd_set_exa = set_exa.cd_set_exa

         AND set_exa.cd_setor = setor.cd_setor

         AND (setor.cd_multi_empresa = p_cd_multi_empresa OR

             (p_regra_csc = 'S' AND setor.cd_multi_empresa IN (select cfc.cd_multi_empresa_destino FROM dbamv.config_ffch_csc cfc

         WHERE cfc.cd_multi_empresa_origem = p_cd_multi_empresa)))

         AND setor.cd_setor = si.cd_setor

         AND si.cd_item_producao = pcd_item_producao

         AND setor.sn_aceita_lancamento = 'S'

    GROUP BY set_exa.cd_setor

      HAVING COUNT ( * ) > 0;



  v_codigo_producao NUMBER;

  v_sn_precisa_excluir VARCHAR2 ( 1 );

  v_cd_item_prod_mensal NUMBER;

  v_sn_commit VARCHAR2 ( 1 ) := 'N';

BEGIN

  IF p_processo = 'R' THEN

    FOR c_itens_producao IN v_item_variaveis LOOP

      v_codigo_producao := 0;



      OPEN c ( c_itens_producao.cd_item_producao );



      FETCH c

       INTO v_codigo_producao;



      CLOSE c;



      IF nvl ( v_codigo_producao, 0 ) <> 0 THEN

        DELETE FROM dbamv.item_prod_mensal

              WHERE item_prod_mensal.cd_producao_mensal = v_codigo_producao

                AND item_prod_mensal.sn_gerado = 'S';

      ELSE

        SELECT dbamv.seq_producao_mensal.NEXTVAL

          INTO v_codigo_producao

          FROM SYS.dual;



        INSERT INTO dbamv.producao_mensal

                    (

                      cd_producao_mensal

                     ,cd_setor_origem

                     ,dt_competencia

                     ,cd_item_producao

                     ,cd_multi_empresa

                    )

             VALUES (

                      v_codigo_producao

                     ,p_cd_setor_origem

                     ,TO_DATE ( p_dt_comp, 'mm/yyyy' )

                     ,c_itens_producao.cd_item_producao

                     ,p_cd_multi_empresa

                    );



        v_sn_precisa_excluir := 'N';

      END IF;



      FOR rec_exame IN c_exame LOOP

        SELECT dbamv.seq_item_prod_mensal.NEXTVAL

          INTO v_cd_item_prod_mensal

          FROM SYS.dual;



        INSERT INTO dbamv.item_prod_mensal

                    (

                      cd_item_prod_mensal

                     ,cd_producao_mensal

                     ,cd_setor_destino

                     ,cd_item_producao

                     ,vl_producao_mensal

                     ,sn_gerado

                    )

             VALUES (

                      v_cd_item_prod_mensal

                     ,v_codigo_producao

                     ,rec_exame.cd_setor

                     ,c_itens_producao.cd_item_producao

                     ,rec_exame.qtd

                     ,'S'

                    );

      END LOOP;



      COMMIT;

    END LOOP;

  ELSIF p_processo = 'P' THEN    -- Unidade Produzida

    FOR rec_item IN c_item LOOP

      SAVEPOINT pos_1;

      v_codigo_producao := 0;

      v_sn_commit := 'N';



      OPEN c_producao ( rec_item.cd_item_producao );



      FETCH c_producao

       INTO v_codigo_producao;



      CLOSE c_producao;



      IF nvl ( v_codigo_producao, 0 ) <> 0 THEN

        DELETE FROM dbamv.item_prod_mensal

              WHERE item_prod_mensal.cd_producao_mensal = v_codigo_producao

                AND item_prod_mensal.sn_gerado = 'S';

      ELSE

        SELECT dbamv.seq_producao_mensal.NEXTVAL

          INTO v_codigo_producao

          FROM SYS.dual;



        INSERT INTO dbamv.producao_mensal

                    (

                      cd_producao_mensal

                     ,dt_competencia

                     ,cd_item_producao

                     ,cd_multi_empresa

                    )

             VALUES (

                      v_codigo_producao

                     ,TO_DATE ( p_dt_comp, 'mm/yyyy' )

                     ,rec_item.cd_item_producao

                     ,p_cd_multi_empresa

                    );



        v_sn_precisa_excluir := 'N';

      END IF;



      FOR rec_exame IN c_exame_prod ( rec_item.cd_item_producao ) LOOP

        SELECT dbamv.seq_item_prod_mensal.NEXTVAL

          INTO v_cd_item_prod_mensal

          FROM SYS.dual;



        INSERT INTO dbamv.item_prod_mensal

                    (

                      cd_item_prod_mensal

                     ,cd_producao_mensal

                     ,cd_setor_destino

                     ,cd_item_producao

                     ,vl_producao_mensal

                     ,sn_gerado

                    )

             VALUES (

                      v_cd_item_prod_mensal

                     ,v_codigo_producao

                     ,rec_exame.cd_setor

                     ,rec_item.cd_item_producao

                     ,rec_exame.qtd

                     ,'S'

                    );



        v_sn_commit := 'S';

      END LOOP;                                                                                                                                                                                                                   -- Fim do loop rec_exame



      IF v_sn_commit = 'S' THEN

        COMMIT;

      ELSE

        ROLLBACK TO SAVEPOINT pos_1;

      END IF;

    END LOOP;                                                                                                                                                                                                                 -- Fim do loop rec_item_prod

  ELSE

    NULL;

  END IF;

END;
/

GRANT EXECUTE ON dbamv.rc_numero_exames TO dbaportal;
GRANT EXECUTE ON dbamv.rc_numero_exames TO dbaps;
GRANT EXECUTE ON dbamv.rc_numero_exames TO dbasgu;
GRANT EXECUTE ON dbamv.rc_numero_exames TO gif;
GRANT EXECUTE ON dbamv.rc_numero_exames TO mv2000;
GRANT EXECUTE ON dbamv.rc_numero_exames TO mv2000_leitura;
GRANT EXECUTE ON dbamv.rc_numero_exames TO mvintegra;
