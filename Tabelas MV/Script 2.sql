/* =====================================================================
   OBJETIVO GERAL DA QUERY:
   Retorna pedidos de exames de um setor específico,
   com informações do paciente, atendimento, executor e origem.

   É dividida em 2 partes via UNION ALL:
   - PARTE 1: Pedidos comuns (exclui pedidos com Cateterismo + ATC juntos)
   - PARTE 2: Somente pedidos que têm Cateterismo + ATC juntos

   Isso evita duplicatas e trata o caso especial de hemodinâmica.
   ===================================================================== */


-- =====================================================================
-- PARTE 1: PEDIDOS GERAIS
-- =====================================================================

SELECT

    a.cd_set_exa        cd_setor_executante,
    e.nm_set_exa        nm_setor_executante,
    b.cd_ped_rx,
    f.cd_atendimento,
    g.cd_paciente,
    g.nm_paciente,

    TO_DATE(
        TO_CHAR(a.dt_pedido, 'dd/mm/yyyy') || ' ' || TO_CHAR(a.hr_pedido, 'hh24:mi:ss'),
        'dd/mm/yyyy hh24:mi:ss'
    ) hr_pedido,

    c.cd_exa_rx,
    c.ds_exa_rx,
    NVL(d.nm_prestador, 'NÃO INFORMADO') nm_executor,
    h.nm_convenio,

    NVL((
        SELECT
            CASE
                WHEN j.ds_especialid IN ('CARDIOLOGIA', 'CIRURGIA CARDIOVASCULAR', 'ELETROFISIOL/CLINICA INVASIVA')
                    THEN 'CARDIOLOGIA'
                WHEN j.ds_especialid IN ('NEUROLOGIA', 'NEUROCIRURGIA')
                    THEN 'NEUROLOGIA'
                ELSE j.ds_especialid
            END
        FROM esp_med i, especialid j
        WHERE i.sn_especial_principal = 'S'
          AND i.cd_especialid = j.cd_especialid
          AND i.cd_prestador  = d.cd_prestador
    ), 'NÃO ENCONTRADO') prestador_especialidade,

    CASE
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate IN (12, 16)
             AND (
                    SELECT r.cd_unid_int
                    FROM   mov_int p, leito q, unid_int r
                    WHERE  p.cd_leito    = q.cd_leito
                      AND  q.cd_unid_int = r.cd_unid_int
                      AND  p.cd_mov_int  = (
                               SELECT MAX(x.cd_mov_int)
                               FROM   mov_int x
                               WHERE  x.cd_atendimento = f.cd_atendimento
                                 AND  x.hr_mov_int < a.hr_pedido
                           )
             ) IN (1, 2, 6) THEN 'Unidades de Internação'

        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate IN (12, 16)
             AND (
                    SELECT r.cd_unid_int
                    FROM   mov_int p, leito q, unid_int r
                    WHERE  p.cd_leito    = q.cd_leito
                      AND  q.cd_unid_int = r.cd_unid_int
                      AND  p.cd_mov_int  = (
                               SELECT MAX(x.cd_mov_int)
                               FROM   mov_int x
                               WHERE  x.cd_atendimento = f.cd_atendimento
                                 AND  x.hr_mov_int < a.hr_pedido
                           )
             ) IN (7, 8, 11) THEN 'UTI/UCC'

        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 22   THEN 'Eletivo'
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 13   THEN 'Pronto Atendimento'
        WHEN f.tp_atendimento = 'U' AND f.cd_ori_ate = 13   THEN 'Pronto Atendimento'
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 12   THEN 'Internação'
        WHEN f.tp_atendimento = 'E' AND f.cd_ori_ate = 22   THEN 'Ambulatorial'
        WHEN f.tp_atendimento = 'A' AND f.cd_ori_ate = 14   THEN 'Ambulatorial'
        WHEN f.tp_atendimento = 'E' AND f.cd_ori_ate = 15   THEN 'Ambulatorial'
    END origem,

    DECODE(f.tp_atendimento,
        'I', 'Internação',
        'E', 'Externo',
        'U', 'Urgência',
        'A', 'Ambulatório'
    ) TIPO_ATENDIMENTO

FROM ped_rx   a
   , itped_rx b
   , exa_rx   c
   , prestador d
   , set_exa  e
   , atendime f
   , paciente g
   , convenio h

WHERE
    a.cd_ped_rx          = b.cd_ped_rx
    AND b.cd_exa_rx      = c.cd_exa_rx
    AND b.cd_prestador   = d.cd_prestador (+)
    AND a.cd_set_exa     = e.cd_set_exa
    AND a.cd_atendimento = f.cd_atendimento
    AND f.cd_paciente    = g.cd_paciente
    AND a.cd_convenio    = h.cd_convenio

    -- ---------------------------------------------------------------
    -- Substitua o valor 99 pelo código do setor desejado
    -- ---------------------------------------------------------------
    AND a.cd_set_exa = 25

    -- Exclui exames administrativos (chamados 27002 e 35567)
    AND b.cd_exa_rx NOT IN (986, 1008)

    -- ---------------------------------------------------------------
    -- Traz apenas UM item por pedido (o de menor código),
    -- ignorando os exames 986 e 1008 no cálculo do mínimo
    -- ---------------------------------------------------------------
    AND b.cd_itped_rx = (
        SELECT MIN(x.cd_itped_rx)
        FROM   itped_rx x
        WHERE  x.cd_ped_rx = b.cd_ped_rx
          AND  x.cd_exa_rx NOT IN (986, 1008)
    )

    -- ---------------------------------------------------------------
    -- Exclui pedidos que tenham Cateterismo + ATC juntos.
    -- Esses pedidos são tratados na PARTE 2.
    -- ---------------------------------------------------------------
    AND b.cd_ped_rx NOT IN (
        SELECT l.cd_ped_rx
        FROM   ped_rx   k
             , itped_rx l
        WHERE  k.cd_ped_rx  = l.cd_ped_rx
          AND  k.cd_set_exa = 99  -- mesmo valor do filtro acima

          -- Pedido tem exame do grupo cateterismo
          AND (
              SELECT MAX(1)
              FROM   itped_rx x, exa_rx y
              WHERE  x.cd_exa_rx = y.cd_exa_rx
                AND  x.cd_ped_rx = l.cd_ped_rx
                AND  x.cd_exa_rx IN (990, 994, 987, 989, 991)
          ) = 1

          -- E também tem o exame 935 (ATC)
          AND EXISTS (
              SELECT *
              FROM   itped_rx x, exa_rx y
              WHERE  x.cd_exa_rx = y.cd_exa_rx
                AND  x.cd_ped_rx = l.cd_ped_rx
                AND  x.cd_exa_rx = 935
          )
    )


-- =====================================================================
-- UNION ALL: junta PARTE 1 + PARTE 2
-- =====================================================================
UNION ALL


-- =====================================================================
-- PARTE 2: SOMENTE PEDIDOS COM CATETERISMO + ATC JUNTOS
-- Cada exame desse grupo aparece como uma linha separada
-- (sem filtro de menor item)
-- =====================================================================

SELECT
    a.cd_set_exa        cd_setor_executante,
    e.nm_set_exa        nm_setor_executante,
    b.cd_ped_rx,
    f.cd_atendimento,
    g.cd_paciente,
    g.nm_paciente,

    TO_DATE(
        TO_CHAR(a.dt_pedido, 'dd/mm/yyyy') || ' ' || TO_CHAR(a.hr_pedido, 'hh24:mi:ss'),
        'dd/mm/yyyy hh24:mi:ss'
    ) hr_pedido,

    c.cd_exa_rx,
    c.ds_exa_rx,
    NVL(d.nm_prestador, 'NÃO INFORMADO') nm_executor,
    h.nm_convenio,

    NVL((
        SELECT
            CASE
                WHEN j.ds_especialid IN ('CARDIOLOGIA', 'CIRURGIA CARDIOVASCULAR', 'ELETROFISIOL/CLINICA INVASIVA')
                    THEN 'CARDIOLOGIA'
                WHEN j.ds_especialid IN ('NEUROLOGIA', 'NEUROCIRURGIA')
                    THEN 'NEUROLOGIA'
                ELSE j.ds_especialid
            END
        FROM esp_med i, especialid j
        WHERE i.sn_especial_principal = 'S'
          AND i.cd_especialid = j.cd_especialid
          AND i.cd_prestador  = d.cd_prestador
    ), 'NÃO ENCONTRADO') prestador_especialidade,

    CASE
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate IN (12, 16)
             AND (
                    SELECT r.cd_unid_int
                    FROM   mov_int p, leito q, unid_int r
                    WHERE  p.cd_leito    = q.cd_leito
                      AND  q.cd_unid_int = r.cd_unid_int
                      AND  p.cd_mov_int  = (
                               SELECT MAX(x.cd_mov_int)
                               FROM   mov_int x
                               WHERE  x.cd_atendimento = f.cd_atendimento
                                 AND  x.hr_mov_int < a.hr_pedido
                           )
             ) IN (1, 2, 6) THEN 'Unidades de Internação'

        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate IN (12, 16)
             AND (
                    SELECT r.cd_unid_int
                    FROM   mov_int p, leito q, unid_int r
                    WHERE  p.cd_leito    = q.cd_leito
                      AND  q.cd_unid_int = r.cd_unid_int
                      AND  p.cd_mov_int  = (
                               SELECT MAX(x.cd_mov_int)
                               FROM   mov_int x
                               WHERE  x.cd_atendimento = f.cd_atendimento
                                 AND  x.hr_mov_int < a.hr_pedido
                           )
             ) IN (7, 8, 11) THEN 'UTI/UCC'

        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 22   THEN 'Eletivo'
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 13   THEN 'Pronto Atendimento'
        WHEN f.tp_atendimento = 'U' AND f.cd_ori_ate = 13   THEN 'Pronto Atendimento'
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 12   THEN 'Internação'
        WHEN f.tp_atendimento = 'E' AND f.cd_ori_ate = 22   THEN 'Ambulatorial'
        WHEN f.tp_atendimento = 'A' AND f.cd_ori_ate = 14   THEN 'Ambulatorial'
        WHEN f.tp_atendimento = 'E' AND f.cd_ori_ate = 15   THEN 'Ambulatorial'
    END origem,

    DECODE(f.tp_atendimento,
        'I', 'Internação',
        'E', 'Externo',
        'U', 'Urgência',
        'A', 'Ambulatório'
    ) TIPO_ATENDIMENTO

FROM ped_rx   a
   , itped_rx b
   , exa_rx   c
   , prestador d
   , set_exa  e
   , atendime f
   , paciente g
   , convenio h

WHERE
    a.cd_ped_rx          = b.cd_ped_rx
    AND b.cd_exa_rx      = c.cd_exa_rx
    AND b.cd_prestador   = d.cd_prestador (+)
    AND a.cd_set_exa     = e.cd_set_exa
    AND a.cd_atendimento = f.cd_atendimento
    AND f.cd_paciente    = g.cd_paciente
    AND a.cd_convenio    = h.cd_convenio

    -- Substitua o valor 99 pelo código do setor desejado
    AND a.cd_set_exa = 25

    -- Exclui exames administrativos
    AND b.cd_exa_rx NOT IN (986, 1008)

    -- ---------------------------------------------------------------
    -- Inclui APENAS pedidos com Cateterismo + ATC juntos
    -- (oposto exato do filtro NOT IN da PARTE 1)
    -- ---------------------------------------------------------------

    -- Pedido tem exame do grupo cateterismo
    AND (
        SELECT MAX(1)
        FROM   itped_rx x, exa_rx y
        WHERE  x.cd_exa_rx = y.cd_exa_rx
          AND  x.cd_ped_rx = b.cd_ped_rx
          AND  x.cd_exa_rx IN (990, 994, 987, 989, 991)
    ) = 1

    -- E também tem o exame 935 (ATC)
    AND EXISTS (
        SELECT *
        FROM   itped_rx x, exa_rx y
        WHERE  x.cd_exa_rx = y.cd_exa_rx
          AND  x.cd_ped_rx = b.cd_ped_rx
          AND  x.cd_exa_rx = 935
    )
ORDER BY hr_pedido desc
