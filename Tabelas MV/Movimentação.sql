-- Movimentação

SELECT coleta.valor AS peso,
       coleta.tp_unidade AS unidadePeso,
       null AS altura,
       null AS unidadeAltura
  FROM (  SELECT isv1.valor valor,
                 (SELECT ds_unidade_afericao
                    FROM dbamv.pw_unidade_afericao
                   WHERE cd_unidade_afericao = isv1.cd_unidade_afericao) tp_unidade,
                 svi1.tp_sinal tp_sinal
            FROM dbamv.coleta_sinal_vital csv1,
                 dbamv.itcoleta_sinal_vital isv1,
                 dbamv.sinal_vital svi1,
                 dbamv.pw_documento_clinico docl
           WHERE csv1.cd_atendimento = docl.cd_atendimento
             AND docl.cd_paciente = ?
             AND svi1.tp_sinal = 'P'
             AND isv1.cd_coleta_sinal_vital = csv1.cd_coleta_sinal_vital
             AND svi1.cd_sinal_vital = isv1.cd_sinal_vital
             AND docl.cd_documento_clinico = csv1.cd_documento_clinico
             AND csv1.data_coleta >= (sysdate - 360)
             AND docl.tp_status IN ('FECHADO', 'ASSINADO')
        ORDER BY csv1.data_coleta DESC) coleta
 WHERE tp_sinal = 'P'
   AND Rownum = 1
 UNION ALL
SELECT null AS peso,
       null AS unidadePeso,
       coleta.valor AS altura,
       coleta.tp_unidade AS unidadeAltura
  FROM (  SELECT isv1.valor valor,
                 (SELECT ds_unidade_afericao
                    FROM dbamv.pw_unidade_afericao
                   WHERE cd_unidade_afericao = isv1.cd_unidade_afericao) tp_unidade,
                 svi1.tp_sinal tp_sinal
            FROM dbamv.coleta_sinal_vital csv1,
                 dbamv.itcoleta_sinal_vital isv1,
                 dbamv.sinal_vital svi1,
                 dbamv.pw_documento_clinico docl
           WHERE csv1.cd_atendimento = docl.cd_atendimento
             AND docl.cd_paciente = ?
             AND svi1.tp_sinal = 'A'
             AND isv1.cd_coleta_sinal_vital = csv1.cd_coleta_sinal_vital
             AND svi1.cd_sinal_vital = isv1.cd_sinal_vital
             AND docl.cd_documento_clinico = csv1.cd_documento_clinico
             AND csv1.data_coleta >= (sysdate - 360)
             AND docl.tp_status IN ('FECHADO', 'ASSINADO')
        ORDER BY csv1.data_coleta DESC) coleta
 WHERE tp_sinal = 'A'
   AND Rownum = 1

parameters:

  [407357, 407357]

rows:

  => 0 rows