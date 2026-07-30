-- Validação prévia: verificar se o registro já existe
SELECT cd_prestador,
       cd_recurso_central
FROM hmed.hmed_prestador_recurso
WHERE cd_prestador = 2390
  AND cd_recurso_central in ('6961','6898');
/

-- INSERT
INSERT INTO hmed.hmed_prestador_recurso (cd_prestador, cd_recurso_central)
VALUES (2390, 11976);

COMMIT;
/

  cefaleia 1 -  6978
  Cefaleia 2: 6898
  Procedimentos Gamma: 11976

/

DELETE FROM hmed.hmed_prestador_recurso
WHERE cd_prestador       = 2390
  AND cd_recurso_central = 6961;

COMMIT;


