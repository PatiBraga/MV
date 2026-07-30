SELECT *
FROM hmed.hmed_prestador_recurso
WHERE cd_prestador = 2206;

/

INSERT ALL
  INTO hmed.hmed_prestador_recurso (cd_prestador, cd_recurso_central) VALUES (2206, 11496)
  INTO hmed.hmed_prestador_recurso (cd_prestador, cd_recurso_central) VALUES (2206, 11497)
  INTO hmed.hmed_prestador_recurso (cd_prestador, cd_recurso_central) VALUES (2206, 11498)
SELECT * FROM DUAL;

/

INSERT INTO hmed.hmed_prestador_recurso (cd_prestado, cd_recurso_central) VALUES (2206, 11496);
INSERT INTO hmed.hmed_prestador_recurso (cd_prestado, cd_recurso_central) VALUES (2206, 11497);
INSERT INTO hmed.hmed_prestador_recurso (cd_prestado, cd_recurso_central) VALUES (2206, 11498);
COMMIT;