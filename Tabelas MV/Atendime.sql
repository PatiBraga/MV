 Paciente - AIRTON ANTONIO BALABUCH
 ID - 32820
 Atendimento - 1138788


SELECT *
FROM ATENDIME
WHERE tp_atendimento = 'I'
  AND dt_atendimento = TO_DATE('04/03/2026', 'DD/MM/YYYY')
ORDER BY cd_atendimento DESC
FETCH FIRST 10 ROWS ONLY;




