DELETE FROM USUARIO_UNID_INT uui
WHERE uui.CD_SETOR IN (161, 139)  -- Troque aqui pelos setores que quiser remover
AND EXISTS (
    SELECT 1
    FROM USUARIOS usu
    JOIN PRESTADOR prest ON prest.CD_PRESTADOR = usu.CD_PRESTADOR
    WHERE prest.CD_TIP_PRESTA = '8'
      AND prest.TP_SITUACAO = 'A'
      AND usu.CD_USUARIO = uui.CD_ID_USUARIO
);