select
  produto.cd_produto,
  produto.ds_produto,
  Verif_Ds_Unid_Prod (produto.cd_produto, 'R') unidade,
  verif_vl_custo_medio(produto.cd_produto,sysdate,'R',null,sysdate,1) vl_custo_medio_ref_hj,
  verif_vl_fator_prod(produto.cd_produto,'R') fator_referencia,
  hr_MVTO_ESTOQUE dt_movimento,
  verif_vl_custo_medio(produto.cd_produto,hr_MVTO_ESTOQUE,'R',null,hr_MVTO_ESTOQUE,1) vl_custo_medio_ref_mov,
  uni_pro.vl_fator fator_dispesado,
  uni_pro.tp_relatorios tp_relatorio_dispensado,

  uni_pro.ds_unidade ds_unidade_dispensada,

  produto.cd_produto||' - '||produto.ds_produto produto,


  Verif_Ds_Unid_Prod (produto.cd_produto, 'R')
    ||' | Fator: '
    ||to_char(verif_vl_fator_prod(produto.cd_produto,'R'),'FM99990D9990','nls_numeric_characters='',.''')
    ||' | '
    ||'Referência' unidade_referencia,

  uni_pro.ds_unidade
    ||' | Fator: '
    ||to_char(uni_pro.vl_fator,'FM99990D9990','nls_numeric_characters='',.''')
    ||' | '
    ||DECODE(UNI_PRO.tp_relatorios,'R','Referência','C','Consumo','E','Entrada','G','Rel Gerencial','1','Auxiliar 1','2','Auxiliar 2','3','Auxiliar 3', UNI_PRO.tp_relatorios) unidade_dispensada,
  to_char(PRODUTO.VL_FATOR_PRO_FAT,'FM99990D9990','nls_numeric_characters='',.''') divisor_faturamento,

  (Select u.ds_unidade
          ||' | Fator: '
          ||to_char(u.vl_fator,'FM99990D9990','nls_numeric_characters='',.''')
          ||' | '
          ||DECODE(u.tp_relatorios,'R','Referência','C','Consumo','E','Entrada','G','Rel Gerencial','1','Auxiliar 1','2','Auxiliar 2','3','Auxiliar 3', u.tp_relatorios) unidade_padrao
    From config_Unidade
         inner join uni_pro u on config_Unidade.tp_unidade = u.tp_relatorios
         where
           cd_grupo = '1'
           and cd_ordem =(select min(m.cd_ordem)
                            From config_Unidade m
                                 inner join uni_pro mu on m.tp_unidade = mu.tp_relatorios
                                 where
                                   cd_grupo = '1'
                                   and u.cd_produto = mu.cd_produto

                            )
           and u.cd_produto = produto.cd_produto
        ) fator_padrao,
 --Verifica valor unitario de custo conforme fator conforme ordem da tabela Config_Unidade
  /*- Fator da unidade dispensada:
      - Conforme ordem da tabela Config_Unidade
    - Divisor de faturamento:
      - Se o fator Config_Unidade for igual ao fator da referência:
       - Se o dividor de faturamento for menor ou igual a 1, divide pelo divisor de faturamento;
       - Se o divisor de faturamento for maior que 1, multiplica pelo divisor de faturamento.
  */
  verif_vl_custo_medio(cd_produto,dt_MVTO_ESTOQUE,'R',null,hr_MVTO_ESTOQUE,1)
    * verif_vl_fator_prod(cd_produto)
    * case
            when verif_vl_fator_prod(cd_produto) = verif_vl_fator_prod(cd_produto,'R') then
                  case
                    when NVL(VL_FATOR_PRO_FAT,1) <= 1 then decode(VL_FATOR_PRO_FAT,0,1,null,1,VL_FATOR_PRO_FAT)
                    else 1/VL_FATOR_PRO_FAT
                  end
            else 1
       end
  VL_CUSTO_UNIT_PADRAO,

  --Verifica valor unitario de custo conforme fator da dispensação com regras
  /*- Fator da unidade dispensada:
      - Se o fator da unidade for menor ou igual ao fator de referência
        - Se o fator da unidade for menor que 1, multiplica pelo fator da unidade.
        - Se o fator da unidade for maior que 1, divide pelo fator da unidade.

    - Divisor de faturamento:
      - Se o fator da unidade for igual ao fator da referência:
       - Se o dividor de faturamento for menor ou igual a 1, divide pelo divisor de faturamento;
       - Se o divisor de faturamento for maior que 1, multiplica pelo divisor de faturamento.
  */

  verif_vl_custo_medio(cd_produto,dt_MVTO_ESTOQUE,'R',null,hr_MVTO_ESTOQUE,1)
    * case
        when vl_fator <> verif_vl_fator_prod(cd_produto,'R') then
             case
                when vl_fator < 1 then vl_fator
                else 1/vl_fator
             end
        else 1
     end
    * case
        when vl_fator = verif_vl_fator_prod(cd_produto,'R') then
              case
                when NVL(VL_FATOR_PRO_FAT,1) <= 1 then decode(VL_FATOR_PRO_FAT,0,1,null,1,VL_FATOR_PRO_FAT)
                else 1/VL_FATOR_PRO_FAT
              end
        else 1
    end
  VL_CUSTO_UNIT_SAIDA ,

  (select max(iTENT_PRO.VL_UNITARIO
                  * case
                      when vl_fator <> verif_vl_fator_prod(produto.cd_produto,'R') then
                           case
                              when vl_fator < 1 then vl_fator
                              else 1/vl_fator
                           end
                      else 1
                   end
                  * case
                      when vl_fator = verif_vl_fator_prod(produto.cd_produto,'R') then
                            case
                              when NVL(VL_FATOR_PRO_FAT,1) <= 1 then decode(VL_FATOR_PRO_FAT,0,1,null,1,VL_FATOR_PRO_FAT)
                              else 1/VL_FATOR_PRO_FAT
                            end
                      else 1
                  end
              )
    from dbamv.itent_pro
         inner join ent_pro on ent_pro.cd_ent_pro = itent_pro.cd_ent_pro
         inner join uni_pro u on itent_pro.cd_uni_pro = u.cd_uni_pro
   where itent_pro.cd_produto = produto.cd_produto
          and trunc(ent_pro.dt_entrada) + (ent_pro.hr_entrada - trunc(ent_pro.hr_entrada)) =
                  ( select max(trunc(x.dt_entrada) + (x.hr_entrada - trunc(x.hr_entrada)))
                      from ent_pro x inner join itent_pro y on x.cd_ent_pro = y.cd_ent_pro
                     where y.cd_produto = itent_pro.cd_produto
                            and (trunc(x.dt_entrada) + (x.hr_entrada - trunc(x.hr_entrada))) <=
                                 (trunc(dt_MVTO_ESTOQUE) + (hr_MVTO_ESTOQUE - trunc(hr_MVTO_ESTOQUE)))
                     )
  ) VL_CUSTO_UNIT_ENTRADA ,

  (select max(trunc(ent_pro.dt_entrada) + (ent_pro.hr_entrada - trunc(ent_pro.hr_entrada)))
    from dbamv.itent_pro
         inner join ent_pro on ent_pro.cd_ent_pro = itent_pro.cd_ent_pro
         inner join uni_pro u on itent_pro.cd_uni_pro = u.cd_uni_pro
   where itent_pro.cd_produto = produto.cd_produto
          and trunc(ent_pro.dt_entrada) + (ent_pro.hr_entrada - trunc(ent_pro.hr_entrada)) =
                  ( select max(trunc(x.dt_entrada) + (x.hr_entrada - trunc(x.hr_entrada)))
                      from ent_pro x inner join itent_pro y on x.cd_ent_pro = y.cd_ent_pro
                     where y.cd_produto = itent_pro.cd_produto
                            and (trunc(x.dt_entrada) + (x.hr_entrada - trunc(x.hr_entrada))) <=
                                 (trunc(dt_MVTO_ESTOQUE) + (hr_MVTO_ESTOQUE - trunc(hr_MVTO_ESTOQUE)))
                     )
  ) dh_ultima_compra




from
  produto
  inner join itmvto_estoque on itmvto_estoque.cd_produto = produto.cd_produto
  inner join mvto_estoque on mvto_estoque.cd_mvto_estoque = itmvto_estoque.cd_mvto_estoque
  inner join uni_pro on itmvto_estoque.cd_uni_pro = uni_pro.cd_uni_pro
where
  itmvto_estoque.cd_itmvto_estoque =  :cd_itmvto_estoque
