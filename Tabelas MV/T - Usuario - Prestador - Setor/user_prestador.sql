SELECT * FROM USUARIOS
ORDER BY  cd_usuario ASC;


SELECT Count(*) 
FROM USUARIOS;


SELECT Count(*)    
FROM USUARIOS        
WHERE sn_ativo = 'N';


SELECT * FROM tip_presta
ORDER BY cd_tip_presta ASC;


SELECT * FROM PRESTADOR
ORDER BY cd_prestador ASC;
