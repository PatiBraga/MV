-----Aqui temos uma query para dar acesso a todos os setores e unidades de internação, com status ativo, já removendo o acesso aos inativos,  para um determinado usuário.

------Segue abaixo o Script:

DECLARE

  usuario VARCHAR2(30) := upper('thalesvargas'); --- Aqui Passa o Usuário
  
BEGIN

  /* da acesso a todos setores e unidades com status ativo*/
  INSERT INTO USUARIO_UNID_INT (CD_UNID_INT, CD_SETOR, CD_ID_USUARIO)
  SELECT u.CD_UNID_INT, S.CD_SETOR, usuario FROM SETOR S
  LEFT JOIN UNID_INT U ON S.CD_SETOR = U.CD_SETOR AND U.SN_ATIVO = 'S'
       AND U.CD_UNID_INT NOT IN (
         SELECT X.CD_UNID_INT FROM USUARIO_UNID_INT X
         WHERE CD_ID_USUARIO = usuario AND CD_UNID_INT IS NOT NULL
       )
  WHERE 
       S.SN_ATIVO = 'S'
       AND (
           U.CD_UNID_INT IS NULL 
           AND S.CD_SETOR NOT IN (
               SELECT X.CD_SETOR FROM USUARIO_UNID_INT X
               WHERE CD_ID_USUARIO = usuario
           )
       ) OR (U.CD_UNID_INT IS NOT NULL);
       

  /* remove acesso a todos setores e unidades com status inativo*/
  DELETE FROM USUARIO_UNID_INT x
  WHERE x.CD_ID_USUARIO = usuario
    AND (
      EXISTS (
        SELECT 1
        FROM UNID_INT u
        WHERE u.CD_UNID_INT = x.CD_UNID_INT
          AND u.SN_ATIVO != 'S'
      )
      OR EXISTS (
        SELECT 1
        FROM SETOR s
        WHERE s.CD_SETOR = x.CD_SETOR
          AND s.SN_ATIVO != 'S'
      )
    );

END;