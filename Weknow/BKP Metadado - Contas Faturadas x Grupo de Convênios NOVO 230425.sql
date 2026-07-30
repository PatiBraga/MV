select
  DH_CARGA,
  DT_REFERENCIA,
  CD_CENTRO_CUSTO,
  RTRIM(DS_CENTRO_CUSTO) DS_CENTRO_CUSTO,
  CD_COLABORADOR,
  RTRIM(DS_COLABORADOR) DS_COLABORADOR,
  CD_TIPO_COLABORADOR,
  TIPO_CONTRATACAO,
  CD_CARGO,
  RTRIM(DS_CARGO) DS_CARGO,
  DT_ADMISSAO,
  cast(DT_DEMISSAO as timestamp) DT_DEMISSAO,
  UPPER(DS_MOTIVO_DEMISSAO) DS_MOTIVO_DEMISSAO,
  DS_GRAU_INSTRUCAO,
  DS_SEXO,
  VL_SALARIO_BASE,
  cast(DT_NASCIMENTO as timestamp) DT_NASCIMENTO,
  CASE
    WHEN QT_ANOS_IDADE > 0 THEN QT_ANOS_IDADE
    ELSE NULL
  END QT_ANOS_IDADE,
  QT_ANOS_EMPRESA,
  RACA,
  SN_PCD,
  CASE
    WHEN DS_MOTIVO_AFASTADO LIKE '%-Definitivo%' THEN 'SIM'
    ELSE 'NÃO'
  END SN_AFASTADO,
  LTRIM(RTRIM(DS_MOTIVO_AFASTADO)) DS_MOTIVO_AFASTADO,
  CASE
    WHEN CHAR_LENGTH(DS_MOTIVO_AFASTADO) > 1 THEN 1
    ELSE 0
  END QT_AFASTADOS,
  QT_COLABORADORES,
  QT_ADMITIDOS,
  QT_DEMITIDOS,
  CD_CENTRO_CUSTO||'-'||RTRIM(DS_CENTRO_CUSTO) CDDS_CENTRO_CUSTO,
  CD_COLABORADOR||'-'||RTRIM(DS_COLABORADOR) CDDS_COLABORADOR,
  CD_CARGO||'-'||RTRIM(DS_CARGO) CDDS_CARGO,
  CASE
    WHEN QT_ANOS_IDADE > 0 THEN
      CASE
        WHEN QT_ANOS_IDADE BETWEEN  0 AND 17 THEN '00-17 ANOS'
        WHEN QT_ANOS_IDADE BETWEEN 18 AND 24 THEN '18-24 ANOS'
        WHEN QT_ANOS_IDADE BETWEEN 25 AND 29 THEN '25-29 ANOS'
        WHEN QT_ANOS_IDADE BETWEEN 30 AND 44 THEN '30-44 ANOS'
        WHEN QT_ANOS_IDADE BETWEEN 45 AND 59 THEN '45-59 ANOS'
        WHEN QT_ANOS_IDADE              > 59 THEN '60-99 ANOS'
      END
    ELSE 'NÃO INFORMADA'
  END FAIXA_IDADE,
    CASE
    WHEN QT_ANOS_EMPRESA                = 0 THEN '00-00 ANOS'
    WHEN QT_ANOS_EMPRESA BETWEEN   1 AND  5 THEN '01-05 ANOS'
    WHEN QT_ANOS_EMPRESA BETWEEN   6 AND 10 THEN '06-10 ANOS'
    WHEN QT_ANOS_EMPRESA BETWEEN  11 AND 15 THEN '11-15 ANOS'
    WHEN QT_ANOS_EMPRESA BETWEEN  16 AND 20 THEN '16-20 ANOS'
    WHEN QT_ANOS_EMPRESA              > 20 THEN '20-99 ANOS'
  END FAIXA_TEMPO_EMPRESA,
  DT_ULTIMAS_FERIAS,
  case
  when DATEADD('month',12,DT_ADMISSAO) >= GETDATE() then
    (case
      when
          cast(concat(concat(concat(concat(extract(year from GETDATE()),'-'),extract(month from DT_ADMISSAO)),'-'),extract(day from DT_ADMISSAO)) as date) < GETDATE()
      then cast(concat(concat(concat(concat(extract(year from GETDATE())+1,'-'),extract(month from DT_ADMISSAO)),'-'),extract(day from DT_ADMISSAO)) as date)

      else cast(concat(concat(concat(concat(extract(year from GETDATE()),'-'),extract(month from DT_ADMISSAO)),'-'),extract(day from DT_ADMISSAO)) as date)
    end)
  else
    DATEADD('month',-3,(case
      when
          cast(concat(concat(concat(concat(extract(year from GETDATE()),'-'),extract(month from DT_ADMISSAO)),'-'),extract(day from DT_ADMISSAO)) as date) < GETDATE()
      then cast(concat(concat(concat(concat(extract(year from GETDATE())+1,'-'),extract(month from DT_ADMISSAO)),'-'),extract(day from DT_ADMISSAO)) as date)

      else cast(concat(concat(concat(concat(extract(year from GETDATE()),'-'),extract(month from DT_ADMISSAO)),'-'),extract(day from DT_ADMISSAO)) as date)
    end))
  end DT_VENC_FERIAS,
  DT_PERIODO_INICIAL PERIODO_AQUISITIVO_INICIAL,
  DT_PERIODO_FINAL PERIODO_AQUISITIVO_FINAL
from
  AggregatedFiles
where
 DT_REFERENCIA is not null /* Ignorar linhas em branco no CSV*/