SELECT
TABELA_MES.MES_REF,
TABELA_MES.TEMPO_TOTAL_PERIODO,
TABELA_HEMODINAMICA.TEMPO_TOTAL_MINUTOS
FROM
(SELECT TO_CHAR(DATA,'mm/yyyy')MES_REF, SUM(720)TEMPO_TOTAL_PERIODO -- 720 MINUTOS POR DIA (07:30 as 19:30 ou 12 HORAS)
FROM (
        SELECT TO_DATE(:DATA_INICIAL) - 1 + LEVEL AS DATA
        FROM DUAL
        CONNECT BY TO_DATE(:DATA_INICIAL) - 1 + LEVEL  <= :DATA_FINAL)
        WHERE (TO_CHAR(DATA,'D') NOT IN (1,7))
        AND F_RETORNA_FERIADO(TO_DATE(DATA)) <> 'S'
        GROUP BY TO_CHAR(DATA,'mm/yyyy'))TABELA_MES,
        (select
        TO_CHAR(c.DT_REALIZACAO,'MM/YYYY')MES_REF,
        SUM((c.DT_FIM_LIMPEZA - c.DT_REALIZACAO)* 1440)TEMPO_TOTAL_MINUTOS
        from cirurgia a, cirurgia_aviso b, aviso_cirurgia c, paciente d
        where a.cd_cirurgia = b.cd_cirurgia
        and c.cd_paciente = d.cd_paciente
        and b.cd_aviso_cirurgia = c.cd_aviso_cirurgia
        and b.sn_principal = 'S'
        and c.cd_cen_cir = 5
        and c.DT_REALIZACAO >= :DATA_INICIAL
        and c.DT_REALIZACAO < :DATA_FINAL
        group by
        TO_CHAR(c.DT_REALIZACAO,'MM/YYYY'))TABELA_HEMODINAMICA
WHERE TABELA_MES.MES_REF = TABELA_HEMODINAMICA.MES_REF
