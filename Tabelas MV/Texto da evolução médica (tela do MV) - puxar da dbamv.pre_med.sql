-- Texto da evolução médica (tela do MV) - puxar da dbamv.pre_med
select    pm.cd_pre_med,
                          pm.dt_referencia,
                          dc.dh_fechamento,
                          pm.cd_documento_clinico,
                          pm.ds_evolucao texto
                  from DBAMV.ATENDIME A
                  inner join dbamv.pre_med pm ON a.CD_ATENDIMENTO = 5673775
                                                                       and pm.cd_atendimento = a.cd_atendimento
                  inner join dbamv.pw_documento_clinico dc on dc.cd_documento_clinico = pm.cd_documento_clinico
                                                                                            and dc.cd_atendimento = pm.cd_atendimento
                                                                                            and dc.cd_objeto = 216 -- evolução médica
                                                                                            and dc.tp_status = 'FECHADO'