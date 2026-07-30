-- Alterar fornecedor

SELECT
    pc.cd_processo,
    pc.cd_fornecedor AS forn_processo,
    ep.cd_ent_psdi,
    ep.cd_fornecedor AS forn_entrada,
    f.nm_fornecedor
FROM
    dbamv.processo_consignado pc
JOIN
    dbamv.ent_psdi ep ON pc.cd_ent_psdi = ep.cd_ent_psdi
JOIN
    dbamv.fornecedor f ON pc.cd_fornecedor = f.cd_fornecedor
WHERE
    pc.cd_processo = :processo;