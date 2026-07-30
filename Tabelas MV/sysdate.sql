-- Dia da semana e hora completa
SELECT TO_CHAR(SYSDATE, 'DAY, HH24:MI:SS')
FROM DUAL;

-- Dia da semana, data e hora
SELECT TO_CHAR(SYSDATE, 'DAY, DD/MM/YYYY HH24:MI:SS')
FROM DUAL;

-- Apenas hora
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS')
FROM DUAL;
