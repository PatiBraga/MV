-- FLOW EDITOR
-- Data
SELECT to_char(SYSDATE, 'DD/MM/RRRR') FROM dual
/

select paciente.nm_mae from dbamv.atendime, dbamv.paciente 
WHERE atendime.cd_paciente = paciente.cd_paciente and cd_atendimento = 1182165
/

select paciente.nm_social_paciente from dbamv.atendime, dbamv.paciente 
WHERE atendime.cd_paciente = paciente.cd_paciente and cd_atendimento = 1182165
/

select nm_social_paciente, nm_paciente,  cd_paciente
from dbamv.paciente 
WHERE nm_social_paciente IS NOT NULL
/



-- Dados Atendimento
select cd_atendimento from atendime where cd_atendimento = '&<PAR_CD_ATENDIMENTO>'


-- Nome do Paciente
select paciente.nm_mae from dbamv.atendime, dbamv.paciente 
WHERE atendime.cd_paciente = paciente.cd_paciente and cd_atendimento 
/

SELECT paciente.NM_PACIENTE from dbamv.atendime, dbamv.paciente
WHERE atendime.cd_paciente = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/

select paciente.NM_PACIENTE from dbamv.atendime, dbamv.paciente where
atendime.cd_paciente = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/
select PACIENTE.nm_paciente 
FROM DBAMV.ATENDIME, DBAMV.PACIENTE WHERE ATENDIME.CD_PACIENTE = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/
select PACIENTE.nm_paciente
FROM DBAMV.ATENDIME, DBAMV.PACIENTE WHERE ATENDIME.CD_PACIENTE = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/
select paciente.NM_PACIENTE from dbamv.atendime, dbamv.paciente where
atendime.cd_paciente = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/
select PACIENTE.nm_paciente FROM
DBAMV.ATENDIME, DBAMV.PACIENTE WHERE ATENDIME.CD_PACIENTE = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>

-- CPF
select nr_cpf from dbamv.atendime, dbamv.paciente
WHERE atendime.cd_paciente = paciente.cd_paciente and cd_atendimento = &<PAR_CD_ATENDIMENTO>



-- Data de nascimento
SELECT To_Char(dt_nascimento,'dd/mm/yyyy') FROM paciente where cd_paciente = '&<PAR_CD_PACIENTE>'
/

select to_char(paciente.dt_nascimento,'dd/mm/yyyy')
from dbamv.atendime, dbamv.paciente
where atendime.cd_paciente = paciente.cd_paciente
and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/

SELECT
to_char(dt_NASCIMENTO,'DD/MM/RRRR')
FROM PACIENTE
/

select to_char(dt_nascimento, 'dd/mm/yyyy') from
dbamv.atendime, dbamv.paciente where atendime.cd_paciente = paciente.cd_paciente and
cd_atendimento = &<PAR_CD_ATENDIMENTO>


-- Idade
select trunc((sysdate-dt_nascimento)/365)
from paciente, atendime
where paciente.cd_paciente = atendime.cd_paciente
and atendime.cd_atendimento = &<PAR_CD_ATENDIMENTO>



-- Telefone
SELECT NR_FONE FROM PACIENTE WHERE CD_PACIENTE = '&<PAR_CD_PACIENTE>'


-- Atendimento
select cd_atendimento from atendime where cd_atendimento = '&<PAR_CD_ATENDIMENTO>'
/

select atendime.cd_atendimento
from dbamv.atendime, dbamv.paciente
where atendime.cd_paciente = paciente.cd_paciente
and cd_atendimento = &<PAR_CD_ATENDIMENTO>


-- Leito
select leito.ds_leito from dbamv.atendime, dbamv.paciente, dbamv.leito where
atendime.cd_paciente = paciente.cd_paciente and atendime.cd_leito = leito.cd_Leito and cd_atendimento = &<PAR_CD_ATENDIMENTO>
/


-- Nome da Mãe
select  paciente.NM_MAE from dbamv.atendime, dbamv.paciente
where atendime.cd_paciente = paciente.cd_paciente and atendime.cd_atendimento = &<PAR_CD_ATENDIMENTO>
/

 select paciente.nm_mae
from dbamv.atendime, dbamv.paciente
where atendime.cd_paciente = paciente.cd_paciente
and atendime.cd_atendimento = &<PAR_CD_ATENDIMENTO>
/

SELECT nm_mae
FROM paciente , atendime
WHERE paciente.cd_paciente =  atendime.cd_paciente
AND cd_atendimento = '&<PAR_CD_ATENDIMENTO>'



-- Nome do Profissional solicitante
SELECT p.nm_prestador ||' - '|| p.ds_codigo_conselho
  FROM dbasgu.usuarios u
  join dbamv.prestador p on p.cd_prestador = u.cd_prestador
  join dbamv.conselho c on c.cd_conselho = p.cd_conselho
 WHERE u.cd_usuario = '&<PAR_CD_USUARIO>'
/

   SELECT nm_prestador
   FROM dbasgu.usuarios u
      , PRESTADOR
      , CONSELHO
  WHERE PRESTADOR.cd_prestador = u.cd_prestador
  AND  CONSELHO.cd_conselho = PRESTADOR.cd_conselho
AND UPPER (u.cd_usuario) = UPPER('&<PAR_CD_USUARIO>')


-- Procedimento
SELECT CD_CIRURGIA, Cd_Pro_Fat||' - ' || DS_CIRURGIA, 'N' FROM CIRURGIA
/

SELECT
CD_TUSS,
DESCRICAO,
'false' AS SELECIONADO
FROM (

/*EXAMES DE IMAGEM*/
select DISTINCT CD_PRO_FAT_HIERARQUIZADO CD_TUSS, (CD_PRO_FAT_HIERARQUIZADO||' - '||DS_EXA_RX) DESCRICAO
from TIP_PRESC
    INNER JOIN EXA_RX ON EXA_RX.CD_EXA_RX = TIP_PRESC.CD_EXA_RX
    INNER JOIN PRO_FAT_HIERARQUIZADO ON PRO_FAT_HIERARQUIZADO.CD_PRO_FAT = EXA_RX.EXA_RX_CD_PRO_FAT
    INNER JOIN PRO_FAT ON PRO_FAT_HIERARQUIZADO.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
where EXA_RX.SN_ATIVO = 'S'

UNION ALL

/*EXAMES DE LABORATORIO*/
select DISTINCT CD_PRO_FAT_HIERARQUIZADO CD_TUSS, (CD_PRO_FAT_HIERARQUIZADO||' - '||NM_EXA_LAB) DESCRICAO
from TIP_PRESC
    INNER JOIN EXA_LAB ON EXA_LAB.CD_EXA_LAB = TIP_PRESC.CD_EXA_LAB
    INNER JOIN PRO_FAT_HIERARQUIZADO ON PRO_FAT_HIERARQUIZADO.CD_PRO_FAT = EXA_LAB.CD_PRO_FAT
    INNER JOIN PRO_FAT ON PRO_FAT_HIERARQUIZADO.CD_PRO_FAT = PRO_FAT.CD_PRO_FAT
where EXA_LAB.SN_ATIVO = 'S'
)



-- CBOs
SELECT
    CASE t.CD_ESPECIALID
        WHEN 1 THEN '223505'
        WHEN 2 THEN '251605'
        WHEN 3 THEN '223710'
        WHEN 4 THEN '225110'
        WHEN 5 THEN '225148'
        WHEN 6 THEN '225115'
        WHEN 7 THEN '225115'
        WHEN 8 THEN '2231A1'
        WHEN 9 THEN '225120'
        WHEN 10 THEN '225210'
        WHEN 11 THEN '225225'
        WHEN 12 THEN '225230'
        WHEN 13 THEN '225235'
        WHEN 14 THEN '225210'
        WHEN 15 THEN '225125'
        WHEN 16 THEN '225135'
        WHEN 17 THEN '225122'
        WHEN 18 THEN '223145'
        WHEN 19 THEN '225155'
        WHEN 20 THEN '225160'
        WHEN 21 THEN '225165'
        WHEN 22 THEN '225250'
        WHEN 23 THEN '225185'
        WHEN 24 THEN '225340'
        WHEN 25 THEN '225315'
        WHEN 26 THEN '225109'
        WHEN 27 THEN '225260'
        WHEN 28 THEN '225112'
        WHEN 29 THEN '225250'
        WHEN 30 THEN '223260'
        WHEN 31 THEN '225265'
        WHEN 32 THEN '223145'
        WHEN 33 THEN '225270'
        WHEN 34 THEN '225275'
        WHEN 35 THEN '223148'
        WHEN 36 THEN '225124'
        WHEN 37 THEN '225127'
        WHEN 38 THEN '223152'
        WHEN 39 THEN '225133'
        WHEN 40 THEN '225320'
        WHEN 41 THEN '225136'
        WHEN 42 THEN '225127'
        WHEN 43 THEN '225330'
        WHEN 44 THEN '225180'
        WHEN 45 THEN '225195'
        WHEN 46 THEN '225285'
        WHEN 47 THEN '225118'
        WHEN 48 THEN '225150'
        WHEN 49 THEN '223145'
        WHEN 50 THEN '225140'
        WHEN 51 THEN '2231A2'
        WHEN 52 THEN '225310'
        WHEN 53 THEN '225220'
        WHEN 54 THEN '223810'
        WHEN 55 THEN '223605'
        WHEN 56 THEN '225255'
        WHEN 57 THEN '223620'
        WHEN 59 THEN '225125'
        WHEN 60 THEN '225225'
        WHEN 61 THEN '225175'
        WHEN 62 THEN '251520'
        WHEN 63 THEN '225103'
        WHEN 65 THEN '223405'
        WHEN 66 THEN '223410'
        WHEN 67 THEN '225120'
        WHEN 70 THEN '324115'
        WHEN 72 THEN '225215'
        WHEN 73 THEN '225250'
        WHEN 75 THEN '322405'
        WHEN 76 THEN '223268'
        WHEN 77 THEN '251545'
        WHEN 79 THEN '223545'
        WHEN 80 THEN '225112'
        WHEN 81 THEN '225305'
        WHEN 82 THEN '225240'
        WHEN 83 THEN '225139'
        WHEN 84 THEN '223100'
        WHEN 85 THEN '223240'
        WHEN 87 THEN '223240'
        WHEN 88 THEN '213155'
        WHEN 89 THEN '234400'
        WHEN 90 THEN '322230'
        WHEN 91 THEN '322205'
        WHEN 93 THEN '3222E2'
        WHEN 94 THEN '225105'
        WHEN 95 THEN '223248'
        WHEN 96 THEN '223212'
        WHEN 97 THEN '322105'
        WHEN 98 THEN '223127'
        ELSE NULL
    END AS CD_CBOS_FIXO
FROM (
    SELECT espmed.CD_ESPECIALID
    FROM dbasgu.USUARIOS u
    JOIN PRESTADOR prest ON prest.CD_PRESTADOR = u.CD_PRESTADOR
    JOIN ESP_MED espmed ON espmed.CD_PRESTADOR = prest.CD_PRESTADOR
    WHERE TRIM(UPPER(u.CD_USUARIO)) = TRIM(UPPER('&<PAR_CD_USUARIO>'))
      AND ROWNUM = 1
) t


-- Conselho
   SELECT ds_conselho
   FROM dbasgu.usuarios u
      , PRESTADOR
      , CONSELHO
  WHERE PRESTADOR.cd_prestador = u.cd_prestador
  AND  CONSELHO.cd_conselho = PRESTADOR.cd_conselho
AND UPPER (u.cd_usuario) = UPPER('&<PAR_CD_USUARIO>')


-- Numero do conselho
   SELECT ds_codigo_conselho
   FROM dbasgu.usuarios u
      , PRESTADOR
      , CONSELHO
  WHERE PRESTADOR.cd_prestador = u.cd_prestador
  AND  CONSELHO.cd_conselho = PRESTADOR.cd_conselho
AND UPPER (u.cd_usuario) = UPPER('&<PAR_CD_USUARIO>')


-- UF
   SELECT CIDADE.CD_UF
   FROM dbasgu.usuarios u
      , PRESTADOR
      , CONSELHO
      , CIDADE
  WHERE PRESTADOR.cd_prestador = u.cd_prestador
  AND  CONSELHO.cd_conselho = PRESTADOR.cd_conselho
  AND  PRESTADOR.CD_CIDADE = CIDADE.CD_CIDADE
AND UPPER (u.cd_usuario) = UPPER('&<PAR_CD_USUARIO>')


-- Exame
select b.cd_itped_rx, ('Pedido '||a.cd_ped_rx||' - '||c.ds_exa_rx)exame, 'false' AS SELECIONADO
from PED_RX a, ITPED_RX b, EXA_RX c, ATENDIME c, PACIENTE d, CONVENIO e, SETOR f, SET_EXA g
        where a.cd_ped_rx = b.cd_ped_rx
        and b.cd_exa_rx = c.cd_exa_rx
        and a.cd_atendimento = c.cd_atendimento
        and c.cd_paciente = d.cd_paciente
        and c.cd_convenio = e.cd_convenio
        and a.cd_setor = f.cd_setor
        and a.cd_set_exa = g.cd_set_exa
        and trunc(a.dt_pedido) = trunc(sysdate)
        and g.cd_set_exa in (4,5,7,8,20,30,31,32,38,39,40,42,37,41,43)
        and a.cd_atendimento = '&<PAR_CD_ATENDIMENTO>'



-- Convenio
select convenio.nm_convenio
from dbamv.atendime, dbamv.convenio
where atendime.cd_convenio = convenio.cd_convenio
and atendime.cd_atendimento = &<PAR_CD_ATENDIMENTO>


-- select carteira.nr_carteira
from dbamv.paciente, dbamv.atendime, dbamv.carteira where
atendime.cd_atendimento = &<PAR_CD_ATENDIMENTO> AND
paciente.cd_paciente = atendime.cd_paciente AND
atendime.cd_paciente = carteira.cd_paciente


-- Nome do médico
SELECT p.nm_prestador ||' - CRM: '|| p.ds_codigo_conselho
  FROM dbasgu.usuarios u
  join dbamv.prestador p on p.cd_prestador = u.cd_prestador
  join dbamv.conselho c on c.cd_conselho = p.cd_conselho
 WHERE u.cd_usuario = '&<PAR_CD_USUARIO>'


--


