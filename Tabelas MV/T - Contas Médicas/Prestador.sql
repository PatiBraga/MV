SELECT P.CD_PRESTADOR COD
      ,P.nm_prestador nome
      ,P.nr_cpf_cgc   cnpj_cpf
      ,Nvl(C.DS_TIP_COMUN_PREST,0) CONTATO
FROM prestador P
LEFT  JOIN PRESTADOR_TIP_COMUN C ON C.CD_PRESTADOR = P.CD_PRESTADOR
WHERE P.tp_situacao = 'A' 
  AND P.tp_vinculo = 'J'
  AND Nvl(sn_MOSTRA_TIP_COMUN,'N') = 'S'
ORDER BY 1


-----------------------------------------------------------------------------------

SELECT 
    P.CD_PRESTADOR AS COD,        -- Código do prestador (identificador principal)
    P.NM_PRESTADOR AS NOME,        -- Nome do prestador
    P.NR_CPF_CGC AS CNPJ_CPF,    -- CPF ou CNPJ do prestador
    NVL(C.DS_TIP_COMUN_PREST, 0) AS CONTATO     -- Tipo de contato/comunicação; se nulo, retorna 0
FROM 
    PRESTADOR P
    LEFT JOIN PRESTADOR_TIP_COMUN C 
           ON C.CD_PRESTADOR = P.CD_PRESTADOR   -- Junta informações de tipo de comunicação do prestador (se houver)
WHERE 
    P.TP_SITUACAO = 'A'  -- Considera apenas prestadores ativos
    AND P.TP_VINCULO = 'J'     -- Considera apenas prestadores com vínculo jurídico (pessoa jurídica)
    AND NVL(SN_MOSTRA_TIP_COMUN, 'N') = 'S' -- Mostrar tipo de comunicação (default 'N')
ORDER BY 
    COD;  -- Ordena pelo código do prestador