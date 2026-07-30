SELECT
    MOV.CD_ATENDIMENTO,
    PAC.NM_PACIENTE,
    U.CD_UNID_INT           CD_UNID_INT,
    U.DS_UNID_INT           DS_UNIDADE,
    L.SN_EXTRA,
    UNID_INT1.CD_UNID_INT   CD_UNID_INT_ANTERIOR,
    UNID_INT1.DS_UNID_INT   DS_UNIDADE_ANTERIOR,
    CONCATENA_DATA_COM_HORA(MOV.DT_MOV_INT, MOV.HR_MOV_INT) DATA_HORA_ADMISSAO,
    CONTADOR.DATA
FROM
    DBAMV.MOV_INT    MOV
    INNER JOIN DBAMV.LEITO      L ON L.CD_LEITO = MOV.CD_LEITO
    INNER JOIN DBAMV.UNID_INT   U ON L.CD_UNID_INT = U.CD_UNID_INT
    INNER JOIN DBAMV.LEITO      LEITO1 ON LEITO1.CD_LEITO = MOV.CD_LEITO_ANTERIOR
    INNER JOIN DBAMV.UNID_INT   UNID_INT1 ON LEITO1.CD_UNID_INT = UNID_INT1.CD_UNID_INT
                                           AND U.CD_UNID_INT <> UNID_INT1.CD_UNID_INT
    INNER JOIN DBAMV.ATENDIME   A ON A.CD_ATENDIMENTO = MOV.CD_ATENDIMENTO
    INNER JOIN DBAMV.PACIENTE   PAC ON PAC.CD_PACIENTE = A.CD_PACIENTE
    INNER JOIN DBAMV.CONVENIO   CONV ON CONV.CD_CONVENIO = A.CD_CONVENIO,
    (
        SELECT
            ( TO_DATE('01/01/2022', 'dd/mm/yyyy') - 1 ) + ROWNUM DATA
        FROM
            DBAMV.CID
        WHERE
            ( TO_DATE('01/01/2022', 'dd/mm/yyyy') - 1 ) + ROWNUM <= TO_DATE('31/01/2022', 'dd/mm/yyyy')
    ) CONTADOR
WHERE
    MOV.TP_MOV = 'O'
    AND TRUNC(MOV.DT_MOV_INT) = CONTADOR.DATA
    AND ( A.TP_ATENDIMENTO IN (
        'I',
        'H',
        'U'
    ) )
    AND NOT EXISTS (
        SELECT
            'X'
        FROM
            DBAMV.MOV_INT MI
        WHERE
            MI.CD_ATENDIMENTO = MOV.CD_ATENDIMENTO
            AND TO_DATE(TO_CHAR(MI.DT_MOV_INT, 'dd/mm/yyyy')
                        || TO_CHAR(MI.HR_MOV_INT, 'hh24:miss'), 'dd/mm/yyyyhh24:miss') < TO_DATE(TO_CHAR(MOV.DT_MOV_INT, 'dd/mm/yyyy'
                        )
                                                                                                 || TO_CHAR(MOV.HR_MOV_INT, 'hh24:miss'
                                                                                                 ), 'dd/mm/yyyyhh24:miss')
            AND MI.CD_LEITO = MOV.CD_LEITO
            AND MI.CD_TIP_ACOM <> MOV.CD_TIP_ACOM
            AND NVL(MI.CD_LEITO_ANTERIOR, MI.CD_LEITO) = NVL(MOV.CD_LEITO_ANTERIOR, MOV.CD_LEITO)
    )
    AND L.CD_UNID_INT IN (
        36,
        37
    )
    AND U.TP_UNID_INT = 'I'
    AND NVL(U.SN_HOSPITAL_DIA, 'N') = 'N'
    AND A.CD_MULTI_EMPRESA = '1'
    AND A.CD_ATENDIMENTO_PAI IS NULL;