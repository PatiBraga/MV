-- Query para inserir frequência na M_TIPPRE por esquema

INSERT INTO TIP_PRESC_TIP_FRE (CD_TIP_PRESC, CD_TIP_FRE)
SELECT distinct A.CD_TIP_PRESC, F.FREQUENCIA
FROM TIP_PRESC A
CROSS JOIN (
    SELECT column_value AS FREQUENCIA
    FROM TABLE(sys.odcinumberlist(9,116,107,1,88,86,2,103,93,67,101,97,4,6,95,8,99,13,59,118,43,76,84,80,38,44,82,111,15,34,105,117,10,24,28,26,113,46,31)) ---- aqui coloque o código da frequência
) F
WHERE A.CD_TIP_ESQ = 'MAV'  ----- aqui coloque o código do esquema
AND NOT EXISTS (
    SELECT 1
    FROM TIP_PRESC_TIP_FRE B
    WHERE B.CD_TIP_PRESC = A.CD_TIP_PRESC
    AND B.CD_TIP_FRE = F.FREQUENCIA
);