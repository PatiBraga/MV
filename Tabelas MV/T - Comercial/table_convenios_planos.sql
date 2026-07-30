SELECT * FROM convenio ORDER BY cd_convenio asc;

-- trás os Inativos 
SELECT  DISTINCT(cd_convenio), nm_convenio, sn_ativo 
FROM convenio 
WHERE sn_ativo = 'N'  
ORDER BY cd_convenio asc;     -- 15 Inativos

-- trás somente os 'ATIVOS'
SELECT  DISTINCT(cd_convenio), nm_convenio, sn_ativo 
FROM convenio 
WHERE sn_ativo = 'S'  
ORDER BY cd_convenio asc; 

-- SELECT para deixar o nome do convenio entre '/' '/''
SELECT '/' || nm_convenio || '/' FROM convenio;

-- RETORNA OS PLANOS CADASTRADOS PARA O CONVENIO  '40 - PARTICULAR'
SELECT * FROM CON_PLA WHERE CD_CONVENIO = 40;   

-- PESQUISA GERAL NA TABELA CON_PLA ( RETORNA TODOS OS PLANOS CADASTRADOS)
SELECT * FROM CON_PLA ;