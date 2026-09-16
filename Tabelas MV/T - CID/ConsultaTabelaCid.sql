-- Consulta Tabela CID 

SELECT DISTINCT
     -- Concatenação oficial do código e descrição do subgrupo
    sc.CD_SGRU_CID || ' - ' || c.CD_CID AS cd_SUBGRUPO_CONCATENADO,
    sc.DS_SGRU_CID || ' - ' || c.DS_CID AS SUBGRUPO_CONCATENADO,    
    c.CD_CID,
    c.DS_CID,
    c.TP_SEXO,
    c.SN_ATIVO,
    c.SN_NOTIFICAVEL,
    sc.CD_SGRU_CID,
    sc.DS_SGRU_CID,
    gc.CD_GRU_CID,
    gc.DS_GRU_CID
FROM 
    DBAMV.CID c
    INNER JOIN DBAMV.SGRU_CID sc ON c.CD_SGRU_CID = sc.CD_SGRU_CID
    INNER JOIN DBAMV.GRU_CID gc ON sc.CD_GRU_CID = gc.CD_GRU_CID
WHERE 
    c.SN_ATIVO = 'S' -- Filtro padrão: Apenas CIDs ativos
    -- AND c.CD_CID LIKE 'J%'                        -- Exemplo: CIDs iniciando com a letra J (Aparelho Respiratório)
    -- AND c.SN_NOTIFICAVEL = 'S'                    -- Exemplo: Apenas doenças de notificação compulsória
    -- AND c.TP_SEXO IN ('F', 'A')                   -- Exemplo: Restrição por sexo (Feminino ou Ambos)
    -- AND sc.CD_SGRU_CID = '0101'                   -- Exemplo: Filtrar por um Subgrupo CID específico
    -- AND gc.CD_GRU_CID = 1                         -- Exemplo: Filtrar por um Grupo CID específico
    -- AND sc.DS_SGRU_CID LIKE '%INFECCCIONO%'       -- Exemplo: Pesquisa por trecho da descrição do subgrupo
    -- AND c.DS_CID LIKE '%PNEUMONIA%'               -- Exemplo: Pesquisa por termo específico na descrição da CID
ORDER BY 
     cd_SUBGRUPO_CONCATENADO ASC;
