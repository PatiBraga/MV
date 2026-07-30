SELECT * FROM dbamv.remessa_fatura
WHERE cd_remessa IN   ('218287', '222779')
ORDER BY cd_remessa DESC;

-------------------------------------------------------------------


SELECT * FROM dbamv.remessa_fatura
WHERE cd_remessa IN   ('218287', '222779')
ORDER BY cd_remessa DESC;


--------------------------------------------------------------------


SELECT * FROM dbamv.remessa_fatura
WHERE cd_remessa IN   ('218287', '222779')
ORDER BY cd_remessa DESC;

------------------------------------------------------------------

SELECT *
FROM fatura
WHERE cd_fatura = '7934';
        sn_fechada

----------------------------------------------------------------

SELECT *
FROM dbamv.reg_amb
WHERE sn_fechada = 'N'
AND TO_CHAR(dt_lancamento, 'MM/YYYY') = '10/2025'
-- AND vl_total_conta = 65.00
ORDER BY cd_remessa;

--------------------------------------------------------------

SELECT *
FROM atendime
WHERE TO_CHAR(dt_atendimento, 'MM/YYYY') = '10/2025'
-- AND cd_ori_ate = '2'
-- AND ROWNUM <= 10;
ORDER BY dt_atendimento DESC;

--------------------------------------------------------------

SELECT *
FROM dbamv.reg_fat
WHERE TO_CHAR(dt_remessa, 'MM/YYYY') = '10/2025'
AND vl_total_conta = 65.00

--------------------------------------------------------------


SELECT *
FROM dbamv.reg_amb
WHERE TO_CHAR(dt_lancamento, 'MM/YYYY') = '10/2025'
-- AND cd_ori_ate = '2'
-- AND ROWNUM <= 10;
ORDER BY dt_atendimento DESC;

---------------------------------------------------------

SELECT *
FROM atendime
WHERE TO_CHAR(dt_atendimento, 'MM/YYYY') = '10/2025'
AND cd_atendimento = '1084649'
-- AND cd_ori_ate = '2'
-- AND ROWNUM <= 10;
ORDER BY dt_atendimento DESC

