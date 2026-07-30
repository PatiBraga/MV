SELECT Leitos.cd_unid_int
     , Leitos.ds_unid_int
     , Qtde_PacDia
     , Qtde_LeitoDia
     , to_char(Round(Nvl(Qtde_PacDia,0)/Decode(Qtde_LeitoDia,0,1,Qtde_LeitoDia)*100,2))||
       ' <div style="float:left;height:16px;background-image: linear-gradient(to right, #E60000, White '||
        to_char(Round(Nvl(Qtde_PacDia,0)/Decode(Qtde_LeitoDia,0,1,Qtde_LeitoDia)*100)) ||'%);width:98px;border:1px solid #E60000;"> </div> '
         Per
  FROM (
       SELECT unid_int.cd_unid_int
            , unid_int.ds_unid_int
            , Count(*) Qtde_LeitoDia
         FROM dbamv.unid_int
        INNER JOIN dbamv.leito ON leito.cd_unid_int = unid_int.cd_unid_int
        INNER JOIN dbamv.setor ON unid_int.cd_setor = setor.cd_setor
        INNER JOIN dbamv.tip_acom ON leito.cd_tip_acom = tip_acom.cd_tip_acom
            , (SELECT to_date($pgmvDataIni$,'dd/mm/yyyy') + ROWNUM -1 data
                 FROM ALL_objects
                WHERE to_date($pgmvDataIni$,'dd/mm/yyyy') + ROWNUM -1 <= to_date($pgmvDataFim$,'dd/mm/yyyy')
              ) contador
        WHERE contador.data BETWEEN leito.dt_ativacao AND nvl(leito.dt_desativacao,SYSDATE)
          AND setor.cd_multi_empresa IN ($pgmvCdEmpresa$)
          AND unid_int.cd_unid_int   IN ($pgmvUnidadeInternacao$) 
          AND tp_acomodacao NOT IN ('B', 'H')
          AND leito.sn_extra = 'N'
          -- Não considerar os leitos fora de operação no momento do censo
          AND NOT EXISTS (SELECT 'X'
                            FROM dbamv.mov_int
                           WHERE tp_mov IN ('A','M','C','T') --A - Acompanhante, M - Manutenção, C - Interditado por infecção, T - interditado por isolamento
                             AND mov_int.cd_leito = leito.cd_leito
                             AND contador.data BETWEEN To_Date(To_Char(DT_MOV_INT,'dd/mm/yyyy')||To_Char(HR_MOV_INT,'hh24:mi'),'dd/mm/yyyy hh24:mi')
                                                   AND Nvl(To_Date(To_Char(DT_LIB_MOV,'dd/mm/yyyy')||To_Char(HR_LIB_MOV,'hh24:mi'),'dd/mm/yyyy hh24:mi'), SYSDATE)
                         )
        GROUP BY unid_int.cd_unid_int
              , unid_int.ds_unid_int
       ) Leitos
  LEFT JOIN
       (
       SELECT cd_unid_int
            , Count(*) Qtde_PacDia
         FROM dbamv.mov_int
        INNER JOIN dbamv.leito ON mov_int.cd_leito = leito.cd_leito
        INNER JOIN dbamv.tip_acom ON leito.cd_tip_acom = tip_acom.cd_tip_acom
        INNER JOIN dbamv.atendime ON mov_int.cd_atendimento = atendime.cd_atendimento
            , (SELECT to_date($pgmvDataIni$,'dd/mm/yyyy') + ROWNUM -1 DATA
                 FROM ALL_objects
                WHERE to_date($pgmvDataIni$,'dd/mm/yyyy') + ROWNUM -1 <= to_date($pgmvDataFim$,'dd/mm/yyyy')
              ) CONTADOR
        WHERE DATA BETWEEN Trunc(mov_int.dt_mov_int) AND Nvl(dt_lib_mov - 1,SYSDATE) -- Considera pacientes às 00:00 + Entradas do dia - Altas do dia
          AND mov_int.tp_mov IN ('I','O','F') -- Internação, Transferência e Pacientes com Infecção
          AND tp_acomodacao NOT IN ('B', 'H') -- Berçário e Hospital Dia
          AND leito.sn_extra = 'N'
          AND atendime.cd_multi_empresa IN ($pgmvCdEmpresa$)
          AND leito.cd_unid_int IN ($pgmvUnidadeInternacao$) 
        GROUP BY cd_unid_int
       ) Pacientes
    ON Leitos.cd_unid_int = Pacientes.cd_unid_int
 ORDER BY Per desc