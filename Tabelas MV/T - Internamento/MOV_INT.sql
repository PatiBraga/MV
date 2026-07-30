SELECT  *
FROM MOV_INT;
WHERE  cd_leito = '2'

-- Select
SELECT *
FROM MOV_INT
WHERE cd_leito = '14'
AND ROWNUM <= 10
-- ORDER BY;

-- Deletar movimetação
Delete mov_int
where cd_mov_int = XXX
