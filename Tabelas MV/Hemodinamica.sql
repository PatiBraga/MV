select
a.cd_set_exa cd_setor_executante,
e.nm_set_exa nm_setor_executante,
b.cd_ped_rx,
f.cd_atendimento,
g.cd_paciente,
g.nm_paciente, to_date(to_char(a.dt_pedido,'dd/mm/yyyy')||' '||to_char(a.hr_pedido,'hh24:mi:ss'),'dd/mm/yyyy hh24:mi:ss')hr_pedido, c.cd_exa_rx, c.ds_exa_rx, nvl(d.nm_prestador,'NÃO INFORMADO') nm_executor, h.nm_convenio,
nvl((select
CASE
    WHEN j.ds_especialid IN ('CARDIOLOGIA','CIRURGIA CARDIOVASCULAR','ELETROFISIOL/CLINICA INVASIVA') THEN 'CARDIOLOGIA'
    WHEN j.ds_especialid IN ('NEUROLOGIA','NEUROCIRURGIA') THEN 'NEUROLOGIA'
    ELSE j.ds_especialid
END
from esp_med i, especialid j
where i.sn_especial_principal = 'S'
and i.cd_especialid = j.cd_especialid
and i.cd_prestador = d.cd_prestador),'NÃO ENCONTRADO')prestador_especialidade,
case
    when f.tp_atendimento = 'I' and f.cd_ori_ate in (12,16) and (select r.cd_unid_int
            from mov_int p, leito q, unid_int r
            where p.cd_leito = q.cd_leito
            and q.cd_unid_int = r.cd_unid_int
            and p.cd_mov_int = (select max(x.cd_mov_int)
                                from mov_int x
                                where x.cd_atendimento = f.cd_atendimento
                                and x.hr_mov_int < a.hr_pedido)) in (1,2,6) then 'Unidades de Internação'

    when f.tp_atendimento = 'I' and f.cd_ori_ate in (12,16) and (select r.cd_unid_int
            from mov_int p, leito q, unid_int r
            where p.cd_leito = q.cd_leito
            and q.cd_unid_int = r.cd_unid_int
            and p.cd_mov_int = (select max(x.cd_mov_int)
                                from mov_int x
                                where x.cd_atendimento = f.cd_atendimento
                                and x.hr_mov_int < a.hr_pedido)) in (7,8,11) then 'UTI/UCC'

    when f.tp_atendimento = 'I' and f.cd_ori_ate = 22 then 'Eletivo'

    when f.tp_atendimento = 'I' and f.cd_ori_ate = 13 then 'Pronto Atendimento'

    when f.tp_atendimento = 'U' and f.cd_ori_ate = 13 then 'Pronto Atendimento'

    when f.tp_atendimento = 'I' and f.cd_ori_ate = 12 then 'Internação'

    when f.tp_atendimento = 'E' and f.cd_ori_ate = 22 then 'Ambulatorial'

    when f.tp_atendimento = 'A' and f.cd_ori_ate = 14 then 'Ambulatorial'

    when f.tp_atendimento = 'E' and f.cd_ori_ate = 15 then 'Ambulatorial'

end origem,
/*
ORIGENS

Ambulatorial
Tipo de atendimento "Externo" Origem: "Hemodinâmica"
Tipo de atendimento "Ambulatorio" Origem: "Ambulatorio INC"
Tipo de atendimento "Externo" Origem: "Externo INC"

Internação
Tipo de atendimento "Internação" Origem: "Internação"
Tipo de atendimento "Internação" Origem: "Consultorios"

Eletivo
Tipo de atendimento "Internação" Origem: "Hemodinâmica"

Pronto Atendimento
Tipo de atendimento "Internação" Origem: "Pronto Atendimento"
Tipo de atendimento "Urgência" Origem: "Pronto Atendimento"
*/

DECODE(F.TP_ATENDIMENTO,'I','Internação','E','Externo','U','Urgência','A','Ambulatório')TIPO_ATENDIMENTO
from ped_rx a, itped_rx b, exa_rx c, prestador d, set_exa e, atendime f, paciente g, convenio h
where a.cd_ped_rx = b.cd_ped_rx
and b.cd_exa_rx = c.cd_exa_rx
and b.cd_prestador = d.cd_prestador (+)
and a.cd_set_exa = e.cd_set_exa
and a.cd_atendimento = f.cd_atendimento
and f.cd_paciente = g.cd_paciente
and a.cd_convenio = h.cd_convenio

-- ######################################################################
-- ###                      INÍCIO DA ALTERAÇÃO                       ###
-- A lógica 'not in' foi movida PARA DENTRO da subquery 'min'
-- A lógica anterior desconsiderava o exame quando ele não era o 'min'
and b.cd_itped_rx = (select min(x.cd_itped_rx)
                     from itped_rx x
                     where x.cd_ped_rx = b.cd_ped_rx
                       and x.cd_exa_rx not in (986,1008))
-- ###                       FIM DA ALTERAÇÃO                         ###
-- ######################################################################

--and b.cd_itped_rx = (select min(x.cd_itped_rx) from itped_rx x where x.cd_ped_rx = b.cd_ped_rx)

and a.cd_set_exa = :cd_set_exa
and b.cd_exa_rx not in (986,1008) -- conforme solicitado no chamado 27002, conforme solicitado no chamado 35567
and b.cd_ped_rx not in (select l.cd_ped_rx
                        from ped_rx k, itped_rx l
                        where k.cd_ped_rx = l.cd_ped_rx
                        and k.cd_set_exa = :cd_set_exa
                        and (select max(1) from itped_rx x, exa_rx y where x.cd_exa_rx = y.cd_exa_rx and x.cd_ped_rx = l.cd_ped_rx and x.cd_exa_rx in (990,994,987,989,991)) = 1
                        and exists (select * from itped_rx x, exa_rx y where x.cd_exa_rx = y.cd_exa_rx and x.cd_ped_rx = l.cd_ped_rx and x.cd_exa_rx = 935))

UNION ALL

--CONSULTA SOMENTE CATETERISMO + ATC
select
a.cd_set_exa cd_setor_executante, e.nm_set_exa nm_setor_executante, b.cd_ped_rx, f.cd_atendimento, g.cd_paciente, g.nm_paciente, to_date(to_char(a.dt_pedido,'dd/mm/yyyy')||' '||to_char(a.hr_pedido,'hh24:mi:ss'),'dd/mm/yyyy hh24:mi:ss')hr_pedido, c.cd_exa_rx, c.ds_exa_rx, nvl(d.nm_prestador,'NÃO INFORMADO') nm_executor, h.nm_convenio,
nvl((select
CASE
    WHEN j.ds_especialid IN ('CARDIOLOGIA','CIRURGIA CARDIOVASCULAR','ELETROFISIOL/CLINICA INVASIVA') THEN 'CARDIOLOGIA'
    WHEN j.ds_especialid IN ('NEUROLOGIA','NEUROCIRURGIA') THEN 'NEUROLOGIA'
    ELSE j.ds_especialid
END
from esp_med i, especialid j
where i.sn_especial_principal = 'S'
and i.cd_especialid = j.cd_especialid
and i.cd_prestador = d.cd_prestador),'NÃO ENCONTRADO')prestador_especialidade,

case
    when f.tp_atendimento = 'I' and f.cd_ori_ate in (12,16) and (select r.cd_unid_int
            from mov_int p, leito q, unid_int r
            where p.cd_leito = q.cd_leito
            and q.cd_unid_int = r.cd_unid_int
            and p.cd_mov_int = (select max(x.cd_mov_int)
                                from mov_int x
                                where x.cd_atendimento = f.cd_atendimento
                                and x.hr_mov_int < a.hr_pedido)) in (1,2,6) then 'Unidades de Internação'

    when f.tp_atendimento = 'I' and f.cd_ori_ate in (12,16) and (select r.cd_unid_int
            from mov_int p, leito q, unid_int r
            where p.cd_leito = q.cd_leito
            and q.cd_unid_int = r.cd_unid_int
            and p.cd_mov_int = (select max(x.cd_mov_int)
                                from mov_int x
                                where x.cd_atendimento = f.cd_atendimento
                                and x.hr_mov_int < a.hr_pedido)) in (7,8,11) then 'UTI/UCC'

    when f.tp_atendimento = 'I' and f.cd_ori_ate = 22 then 'Eletivo'

    when f.tp_atendimento = 'I' and f.cd_ori_ate = 13 then 'Pronto Atendimento'

    when f.tp_atendimento = 'U' and f.cd_ori_ate = 13 then 'Pronto Atendimento'

    when f.tp_atendimento = 'I' and f.cd_ori_ate = 12 then 'Internação'

    when f.tp_atendimento = 'E' and f.cd_ori_ate = 22 then 'Ambulatorial'

    when f.tp_atendimento = 'A' and f.cd_ori_ate = 14 then 'Ambulatorial'

    when f.tp_atendimento = 'E' and f.cd_ori_ate = 15 then 'Ambulatorial'

end origem,

DECODE(F.TP_ATENDIMENTO,'I','Internação','E','Externo','U','Urgência','A','Ambulatório')TIPO_ATENDIMENTO
from ped_rx a, itped_rx b, exa_rx c, prestador d, set_exa e, atendime f, paciente g, convenio h
where a.cd_ped_rx = b.cd_ped_rx
and b.cd_exa_rx = c.cd_exa_rx
and b.cd_prestador = d.cd_prestador (+)
and a.cd_set_exa = e.cd_set_exa
and a.cd_atendimento = f.cd_atendimento
and f.cd_paciente = g.cd_paciente
and a.cd_convenio = h.cd_convenio
and a.cd_set_exa = :cd_set_exa
and b.cd_exa_rx not in (986,1008) -- conforme solicitado no chamado 27002, conforme solicitado no chamado 35567
and (select max(1) from itped_rx x, exa_rx y where x.cd_exa_rx = y.cd_exa_rx and x.cd_ped_rx = b.cd_ped_rx and x.cd_exa_rx in (990,994,987,989,991)) = 1
and exists (select * from itped_rx x, exa_rx y where x.cd_exa_rx = y.cd_exa_rx and x.cd_ped_rx = b.cd_ped_rx and x.cd_exa_rx = 935)


---------------------------------------------------------------------------------------------------------------------------------------------------



/* =====================================================================
   OBJETIVO GERAL DA QUERY:
   Retorna pedidos de exames de um setor específico (:cd_set_exa),
   com informações do paciente, atendimento, executor e origem.

   É dividida em 2 partes via UNION ALL:
   - PARTE 1: Pedidos comuns (exclui pedidos com Cateterismo + ATC juntos)
   - PARTE 2: Somente pedidos que têm Cateterismo + ATC juntos

   Isso evita duplicatas e trata o caso especial de hemodinâmica.
   ===================================================================== */


-- =====================================================================
-- PARTE 1: PEDIDOS GERAIS
-- Traz um item por pedido (o de menor código), excluindo exames
-- específicos e pedidos que contenham Cateterismo + ATC simultaneamente
-- =====================================================================

SELECT

    -- Código e nome do setor que vai executar o exame
    a.cd_set_exa        cd_setor_executante,
    e.nm_set_exa        nm_setor_executante,

    -- Código do pedido de exame
    b.cd_ped_rx,

    -- Código do atendimento hospitalar do paciente
    f.cd_atendimento,

    -- Código e nome do paciente
    g.cd_paciente,
    g.nm_paciente,

    -- Data e hora do pedido:
    -- O sistema armazena data (dt_pedido) e hora (hr_pedido) em campos separados.
    -- Este trecho junta os dois em um único valor de data/hora.
    -- Exemplo: '15/02/2026' + '14:30:00' ? 15/02/2026 14:30:00
    TO_DATE(
        TO_CHAR(a.dt_pedido, 'dd/mm/yyyy') || ' ' || TO_CHAR(a.hr_pedido, 'hh24:mi:ss'),
        'dd/mm/yyyy hh24:mi:ss'
    ) hr_pedido,

    -- Código e descrição do exame solicitado
    c.cd_exa_rx,
    c.ds_exa_rx,

    -- Nome do médico/profissional que vai executar o exame.
    -- NVL substitui NULL por 'NÃO INFORMADO' quando não há executor definido.
    NVL(d.nm_prestador, 'NÃO INFORMADO') nm_executor,

    -- Nome do convênio do paciente
    h.nm_convenio,

    -- ---------------------------------------------------------------
    -- ESPECIALIDADE DO EXECUTOR (subquery escalar)
    -- Busca a especialidade PRINCIPAL do médico executor.
    -- Agrupa especialidades relacionadas em categorias maiores.
    -- Se o médico não tiver especialidade cadastrada, retorna 'NÃO ENCONTRADO'.
    -- ---------------------------------------------------------------
    NVL((
        SELECT
            CASE
                -- Cardiologia e especialidades relacionadas são agrupadas
                WHEN j.ds_especialid IN ('CARDIOLOGIA', 'CIRURGIA CARDIOVASCULAR', 'ELETROFISIOL/CLINICA INVASIVA')
                    THEN 'CARDIOLOGIA'
                -- Neurologia e Neurocirurgia são agrupadas
                WHEN j.ds_especialid IN ('NEUROLOGIA', 'NEUROCIRURGIA')
                    THEN 'NEUROLOGIA'
                -- Qualquer outra especialidade aparece com seu nome original
                ELSE j.ds_especialid
            END
        FROM esp_med i      -- tabela que liga médico à especialidade
           , especialid j   -- tabela com o nome da especialidade
        WHERE i.sn_especial_principal = 'S'          -- apenas especialidade principal do médico
          AND i.cd_especialid = j.cd_especialid      -- liga especialidade ao seu nome
          AND i.cd_prestador  = d.cd_prestador       -- filtra pelo executor do exame
    ), 'NÃO ENCONTRADO') prestador_especialidade,

    -- ---------------------------------------------------------------
    -- COLUNA ORIGEM
    -- Classifica de onde vem o paciente, combinando:
    --   tp_atendimento: tipo do atendimento (I=Internação, U=Urgência, E=Externo, A=Ambulatório)
    --   cd_ori_ate: código da origem do atendimento
    --
    -- Nos casos de Internação com origem 12 ou 16, é preciso verificar
    -- em qual unidade o paciente estava NO MOMENTO do pedido,
    -- para distinguir entre ala normal e UTI/UCC.
    -- ---------------------------------------------------------------
    CASE

        -- Internação (I) com origem Internação/Consultórios (12 ou 16)
        -- ? verifica a unidade onde o paciente estava quando o pedido foi feito
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate IN (12, 16)
             AND (
                    -- Subquery: descobre em qual unidade o paciente estava
                    -- no momento do pedido, pegando o movimento mais recente
                    -- anterior ao horário do pedido
                    SELECT r.cd_unid_int
                    FROM   mov_int p    -- movimentações do paciente internado
                         , leito   q   -- leito onde estava
                         , unid_int r  -- unidade de internação do leito
                    WHERE  p.cd_leito    = q.cd_leito
                      AND  q.cd_unid_int = r.cd_unid_int
                      AND  p.cd_mov_int  = (
                               -- pega o movimento mais recente ANTES do pedido
                               SELECT MAX(x.cd_mov_int)
                               FROM   mov_int x
                               WHERE  x.cd_atendimento = f.cd_atendimento
                                 AND  x.hr_mov_int < a.hr_pedido  -- anterior ao pedido
                           )
             ) IN (1, 2, 6)  -- códigos de unidades de internação normais
             THEN 'Unidades de Internação'

        -- Mesmo caso acima, mas o paciente estava em UTI ou UCC (códigos 7, 8, 11)
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
             ) IN (7, 8, 11)  -- códigos de UTI e UCC
             THEN 'UTI/UCC'

        -- Internação com origem Hemodinâmica (22) ? procedimento eletivo
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 22   THEN 'Eletivo'

        -- Internação com origem Pronto Atendimento (13)
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 13   THEN 'Pronto Atendimento'

        -- Urgência com origem Pronto Atendimento (13)
        WHEN f.tp_atendimento = 'U' AND f.cd_ori_ate = 13   THEN 'Pronto Atendimento'

        -- Internação com origem Internação (12) ? caso não coberto pelos anteriores
        WHEN f.tp_atendimento = 'I' AND f.cd_ori_ate = 12   THEN 'Internação'

        -- Externo com origem Hemodinâmica (22) ? Ambulatorial
        WHEN f.tp_atendimento = 'E' AND f.cd_ori_ate = 22   THEN 'Ambulatorial'

        -- Ambulatório com origem Ambulatório INC (14)
        WHEN f.tp_atendimento = 'A' AND f.cd_ori_ate = 14   THEN 'Ambulatorial'

        -- Externo com origem Externo INC (15)
        WHEN f.tp_atendimento = 'E' AND f.cd_ori_ate = 15   THEN 'Ambulatorial'

    END origem,

    -- ---------------------------------------------------------------
    -- TIPO DE ATENDIMENTO
    -- Traduz o código de uma letra para o nome legível.
    -- Diferente de ORIGEM (que é mais detalhada), aqui é só a categoria geral.
    -- ---------------------------------------------------------------
    DECODE(f.tp_atendimento,
        'I', 'Internação',
        'E', 'Externo',
        'U', 'Urgência',
        'A', 'Ambulatório'
    ) TIPO_ATENDIMENTO

-- ---------------------------------------------------------------
-- TABELAS UTILIZADAS (sintaxe antiga de JOIN com vírgula)
-- As ligações entre elas estão no WHERE abaixo
-- ---------------------------------------------------------------
FROM ped_rx   a   -- cabeçalho do pedido
   , itped_rx b   -- itens do pedido (cada exame)
   , exa_rx   c   -- cadastro dos exames
   , prestador d  -- médico executor
   , set_exa  e   -- setor executante
   , atendime f   -- atendimento hospitalar
   , paciente g   -- paciente
   , convenio h   -- convênio

WHERE
    -- ---------------------------------------------------------------
    -- JOINS: ligações entre as tabelas
    -- ---------------------------------------------------------------
    a.cd_ped_rx      = b.cd_ped_rx          -- pedido ? itens do pedido
    AND b.cd_exa_rx  = c.cd_exa_rx          -- item ? cadastro do exame
    AND b.cd_prestador = d.cd_prestador (+) -- item ? executor (LEFT JOIN: pode não ter executor)
    AND a.cd_set_exa = e.cd_set_exa         -- pedido ? setor executante
    AND a.cd_atendimento = f.cd_atendimento -- pedido ? atendimento
    AND f.cd_paciente = g.cd_paciente       -- atendimento ? paciente
    AND a.cd_convenio = h.cd_convenio       -- pedido ? convênio

    -- ---------------------------------------------------------------
    -- FILTRO 1: Setor executante
    -- Traz apenas pedidos do setor informado como parâmetro
    -- ---------------------------------------------------------------
    AND a.cd_set_exa = :cd_set_exa

    -- ---------------------------------------------------------------
    -- FILTRO 2: Exclusão de exames específicos
    -- Exames 986 e 1008 são excluídos por solicitação dos chamados 27002 e 35567
    -- (provavelmente exames administrativos ou que não devem aparecer no relatório)
    -- ---------------------------------------------------------------
    AND b.cd_exa_rx NOT IN (986, 1008)

    -- ---------------------------------------------------------------
    -- FILTRO 3: Traz apenas UM item por pedido (o de menor código)
    -- Sem esse filtro, um pedido com 3 exames geraria 3 linhas duplicadas.
    -- A subquery pega o menor cd_itped_rx do pedido, ignorando os exames
    -- 986 e 1008 (para não deixar um deles "vencer" como o menor).
    --
    -- EXEMPLO:
    --   Pedido 100 tem itens: 986(excluído), 1008(excluído), 500, 600
    --   min() ignorando 986 e 1008 ? retorna 500
    --   Apenas o item 500 aparece no resultado
    -- ---------------------------------------------------------------
    AND b.cd_itped_rx = (
        SELECT MIN(x.cd_itped_rx)
        FROM   itped_rx x
        WHERE  x.cd_ped_rx  = b.cd_ped_rx          -- mesmo pedido
          AND  x.cd_exa_rx NOT IN (986, 1008)       -- ignora os exames excluídos
    )

    -- ---------------------------------------------------------------
    -- FILTRO 4: Exclui pedidos que tenham Cateterismo + ATC juntos
    -- Esses pedidos são tratados separadamente na PARTE 2 (UNION ALL).
    --
    -- Um pedido é excluído aqui se ele contiver:
    --   ? Pelo menos um exame do grupo cateterismo (990, 994, 987, 989, 991)
    --   E ? Também o exame 935 (ATC - Angioplastia Transluminal Coronária)
    -- ---------------------------------------------------------------
    AND b.cd_ped_rx NOT IN (
        SELECT l.cd_ped_rx
        FROM   ped_rx   k
             , itped_rx l
        WHERE  k.cd_ped_rx  = l.cd_ped_rx
          AND  k.cd_set_exa = :cd_set_exa

          -- Verifica se o pedido tem algum exame do grupo cateterismo
          AND (
              SELECT MAX(1)
              FROM   itped_rx x, exa_rx y
              WHERE  x.cd_exa_rx = y.cd_exa_rx
                AND  x.cd_ped_rx = l.cd_ped_rx
                AND  x.cd_exa_rx IN (990, 994, 987, 989, 991)
          ) = 1

          -- Verifica se o mesmo pedido também tem o exame 935 (ATC)
          AND EXISTS (
              SELECT *
              FROM   itped_rx x, exa_rx y
              WHERE  x.cd_exa_rx = y.cd_exa_rx
                AND  x.cd_ped_rx = l.cd_ped_rx
                AND  x.cd_exa_rx = 935
          )
    )


-- =====================================================================
-- UNION ALL: junta o resultado da PARTE 1 com a PARTE 2
-- UNION ALL mantém todas as linhas, inclusive repetidas (mais eficiente
-- que UNION, que removeria duplicatas fazendo um DISTINCT desnecessário)
-- =====================================================================
UNION ALL


-- =====================================================================
-- PARTE 2: SOMENTE PEDIDOS COM CATETERISMO + ATC JUNTOS
-- Enquanto a PARTE 1 excluiu esses pedidos, aqui eles são buscados
-- individualmente, sem o filtro de "menor item por pedido",
-- pois cada exame desse grupo precisa aparecer como uma linha separada.
-- =====================================================================

SELECT
    -- As colunas são exatamente as mesmas da PARTE 1
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
             ) IN (1, 2, 6)  THEN 'Unidades de Internação'

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
    -- Mesmos joins da PARTE 1
    a.cd_ped_rx        = b.cd_ped_rx
    AND b.cd_exa_rx    = c.cd_exa_rx
    AND b.cd_prestador = d.cd_prestador (+)
    AND a.cd_set_exa   = e.cd_set_exa
    AND a.cd_atendimento = f.cd_atendimento
    AND f.cd_paciente  = g.cd_paciente
    AND a.cd_convenio  = h.cd_convenio

    -- Mesmo filtro de setor
    AND a.cd_set_exa = :cd_set_exa

    -- Mesmo filtro de exclusão de exames 986 e 1008
    AND b.cd_exa_rx NOT IN (986, 1008)

    -- ---------------------------------------------------------------
    -- FILTRO ESPECIAL DA PARTE 2:
    -- Inclui APENAS pedidos que tenham exames do grupo cateterismo
    -- (990, 994, 987, 989, 991) E também o exame 935 (ATC).
    -- É o oposto exato do filtro NOT IN da PARTE 1.
    -- Aqui não há filtro de "menor item", então cada exame vira uma linha.
    -- ---------------------------------------------------------------

    -- O pedido DEVE ter pelo menos um exame do grupo cateterismo
    AND (
        SELECT MAX(1)
        FROM   itped_rx x, exa_rx y
        WHERE  x.cd_exa_rx = y.cd_exa_rx
          AND  x.cd_ped_rx = b.cd_ped_rx
          AND  x.cd_exa_rx IN (990, 994, 987, 989, 991)
    ) = 1

    -- E DEVE ter também o exame 935 (ATC)
    AND EXISTS (
        SELECT *
        FROM   itped_rx x, exa_rx y
        WHERE  x.cd_exa_rx = y.cd_exa_rx
          AND  x.cd_ped_rx = b.cd_ped_rx
          AND  x.cd_exa_rx = 935
    )


