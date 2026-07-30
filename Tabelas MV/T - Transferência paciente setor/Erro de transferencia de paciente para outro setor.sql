SELECT * FROM dbamv.atendime WHERE cd_atendimento = 1032511
/

SELECT * FROM dbamv.mov_int
WHERE cd_atendimento = 1032511 - 1161029
  AND CD_MOV_INT NOT IN (215977)
ORDER BY cd_mov_int DESC
/

SELECT * FROM dbamv.mov_int WHERE CD_LEITO = 92 ORDER BY cd_mov_int DESC
/



DELETE FROM DBAMV.LOG_DIARIA_AUTOMATICA   WHERE cd_atendimento = 1032511;

DELETE FROM DBAMV.MOV_INT WHERE CD_MOV_INT IN (
SELECT CD_MOV_INT FROM dbamv.mov_int
WHERE cd_atendimento = 1032511
  AND CD_MOV_INT NOT IN (215977)

)                                                                        ;




SELECT * FROM all_triggers WHERE trigger_name = 'TRG_ATENDIME'
/

SELECT * FROM ALL_OBJECTS WHERE OBJECT_NAME = 'TRG_ATENDIME'



 SELECT * FROM ALL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'LDA_MOV_INT_FK'


 SELECT * FROM DBAMV.LOG_DIARIA_AUTOMATICA   WHERE cd_atendimento = 1032511



