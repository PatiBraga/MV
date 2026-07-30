SELECT
    159                                             cd_critica,
    cd_atendimento,
    tp_conta                                        tp_conta,
    cd_conta                                        cd_conta,
    cd_lancamento,
    pf.cd_pro_fat                                   cd_pro_fat,
    to_char(dt_lancamento, 'dd.mm.yyyy hh24:mi:ss') dh_lancamento,
    cd_gru_fat,
    cd_prestador,
    cd_setor,
    cd_setor_produziu                               cd_setor_executante,
    regexp_replace(replace('A conta '
                           || cd_conta
                           || ' possui item '
                           || pf.cd_pro_fat
                           || ' - '
                           || pf.ds_pro_fat
                           || ' com quantidade superior a '
                           ||(2),
                           CHR(10)
                           || CHR(13)
                           || CHR(0),
                           ' '),
                   '[^a-zA-Z0-9?&!@()-/+%$√„Á«… ÈÍ”‘ÛÙÌÓ˙¡¬·‚,;<>∞: :]',
                   '')                              ds_critica,
    0                                               vl_tot_lancado,
    0                                               vl_tot_ajustado,
    qtd                                             qt_ajustado
FROM
    (
        SELECT
            ate.cd_atendimento,
            rf.cd_multi_empresa,
            rf.cd_reg_fat cd_conta,
            'H'           tp_conta,
            it.cd_lancamento,
            it.cd_gru_fat,
            it.cd_prestador,
            it.cd_setor,
            it.cd_setor_produziu,
            it.cd_pro_fat,
            it.dt_lancamento,
            it.hr_lancamento,
            (
                SELECT
                    SUM(it2.qt_lancamento)
                FROM
                    dbamv.itreg_fat it2
                WHERE
                        it2.cd_pro_fat = it.cd_pro_fat
                    AND it2.cd_reg_fat = it.cd_reg_fat
                    AND it2.cd_lancamento >= it.cd_lancamento
            )             qtd
        FROM
            dbamv.atendime  ate,
            dbamv.reg_fat   rf,
            dbamv.convenio  c,
            dbamv.itreg_fat it /*CD ,DBAMV.ate_filtro atf CD*/
        WHERE /*CD ate.cd_atendimento = atf.cd_atendimento AND CD*/
                c.cd_convenio = rf.cd_convenio /*CG AND ate.cd_atendimento = ATEND_GIF CG*/ /*CG and rf.cd_reg_fat = CONTA_GIF CG*/
            AND c.tp_convenio IN ( 'P', 'C' )
            AND rf.cd_reg_fat = it.cd_reg_fat
            AND ate.cd_atendimento = rf.cd_atendimento
            AND rf.cd_multi_empresa IN ( 1 ) /*convenios AND rf.cd_convenio */ /*regrafat AND rf.cd_regra */
            AND ate.tp_atendimento IN ( 'U' )
            AND rf.sn_fechada IN ( 'N' )
            AND ate.cd_ori_ate IN ( 38, 53, 13 )
            AND it.cd_setor IN ( 184, 163, 161, 36, 137,
                                 136, 106 )
        UNION ALL
        SELECT
            ate.cd_atendimento,
            rf.cd_multi_empresa,
            rf.cd_reg_amb      cd_conta,
            'A'                tp_conta,
            it.cd_lancamento,
            it.cd_gru_fat,
            it.cd_prestador,
            it.cd_setor,
            it.cd_setor_produziu,
            it.cd_pro_fat,
            ate.dt_atendimento dt_lancamento,
            it.hr_lancamento,
            (
                SELECT
                    SUM(it2.qt_lancamento)
                FROM
                    dbamv.itreg_amb it2
                WHERE
                        it2.cd_pro_fat = it.cd_pro_fat
                    AND it2.cd_reg_amb = it.cd_reg_amb
                    AND it2.cd_lancamento >= it.cd_lancamento
            )                  qtd
        FROM
            dbamv.atendime  ate,
            dbamv.reg_amb   rf,
            dbamv.itreg_amb it /*CD ,DBAMV.ate_filtro atf CD*/,
            dbamv.convenio  c
        WHERE /*CD ate.cd_atendimento = atf.cd_atendimento AND CD*/
                c.cd_convenio = rf.cd_convenio /*CG AND ate.cd_atendimento = ATEND_GIF CG*/ /*CG and rf.cd_reg_amb = CONTA_GIF CG*/
            AND c.tp_convenio IN ( 'P', 'C' )
            AND rf.cd_reg_amb = it.cd_reg_amb
            AND ate.cd_atendimento = it.cd_atendimento
            AND rf.cd_multi_empresa IN ( 1 ) /*convenios AND rf.cd_convenio */ /*regrafat AND rf.cd_regra */
            AND ate.tp_atendimento IN ( 'U' )
            AND it.sn_fechada IN ( 'N' )
            AND ate.cd_ori_ate IN ( 38, 53, 13 )
            AND it.cd_setor IN ( 184, 163, 161, 36, 137,
                                 136, 106 )
    )             reg,
    dbamv.pro_fat pf
WHERE
        pf.cd_pro_fat = reg.cd_pro_fat
    AND ( ( qtd > ( 2 )
            AND pf.cd_pro_fat IN ( '08001458' ) )
          OR ( qtd > ( 1000 )
               AND pf.cd_pro_fat IN ( 'XXXXXXX' ) )
          OR ( qtd > ( 1000 )
               AND pf.cd_pro_fat IN ( 'XXXXXXX' ) ) )

AND cd_conta = 1088952