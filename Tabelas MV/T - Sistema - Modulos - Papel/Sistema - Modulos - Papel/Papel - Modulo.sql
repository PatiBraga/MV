
-- PAPEL
SELECT cd_papel, ds_papel
FROM PAPEL
ORDER BY cd_papel;

-- PAPEL MODULO
SELECT cd_papel, cd_modulo
FROM PAPEL_MOD
ORDER BY cd_papel;

-- MODULOS (TELAS) LIBERADOS NO PAPEL
SELECT * FROM PAPEL_MOD
WHERE cd_papel = 157;


--
