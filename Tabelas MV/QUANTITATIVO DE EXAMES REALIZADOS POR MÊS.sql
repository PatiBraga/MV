-- QUANTITATIVO DE EXAMES REALIZADOS POR MÊS


SELECT
       EXA_RX.DS_EXA_RX EXAME
      --,COUNT(itped_RX.CD_EXA_RX) QTDE
      --,To_Char(PED_RX.DT_PEDIDO,'MM/YYYY') DATA
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='01' then 1 else 0 end
      ) as JAN
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='02' then 1 else 0 end
      ) as FEV
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='03' then 1 else 0 end
      ) as MAR
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='04' then 1 else 0 end
      ) as ABR
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='05' then 1 else 0 end
      ) as MAI
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='06' then 1 else 0 end
      ) as JUN
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='07' then 1 else 0 end
      ) as JUL
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='08' then 1 else 0 end
      ) as AGO
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='09' then 1 else 0 end
      ) as "SET"
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='10' then 1 else 0 end
      ) as "OUT"
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='11' then 1 else 0 end
      ) as NOV
      ,sum(
        case when To_Char(PED_RX.DT_PEDIDO,'MM')='12' then 1 else 0 end
      ) as DEZ
      FROM  DBAMV . PED_RX
          , DBAMV . ATENDIME
          , DBAMV . ITPED_RX
          , DBAMV.EXA_RX
          WHERE PED_RX.CD_ATENDIMENTO = ATENDIME.CD_ATENDIMENTO
          AND PED_RX.CD_PED_RX = ITPED_RX.CD_PED_RX
          AND EXA_RX.CD_EXA_RX = ITPED_RX.CD_EXA_RX
          -- AND TRUNC (PED_RX.DT_PEDIDO) BETWEEN '01/01/2018' AND '31/03/2018'
          and To_Char(PED_RX.DT_PEDIDO,'YYYY') = '2018'
          AND Atendime.CD_MULTI_EMPRESA = '1'
                   GROUP BY EXA_RX.DS_EXA_RX--, To_Char(PED_RX.DT_PEDIDO,'MM/YYYY')--,PED_RX.DT_PEDIDO
          ORDER BY EXA_RX.DS_EXA_RX;