-- R_LISTA_ATENDE_PERIODO

SELECT atendime.cd_atendimento cd_atendimento,
       TO_CHAR(atendime.dt_atendimento,'dd/mm/yyyy') || ' ' || TO_CHAR(atendime.hr_atendimento,'HH24:MI') data,
       paciente.cd_paciente cd_paciente,
       paciente.nm_paciente nm_paciente,
       convenio.nm_convenio nm_convenio,
       con_pla.ds_con_pla ds_con_pla,
       ori_ate.ds_ori_ate ds_ori_ate,
       prestador.nm_prestador nm_prestador
       , decode(convenio.tp_convenio, 'P', ''
                                    , 'C', ''
                                    , dbamv.fnc_paeu_tem_outro_atendimento(paciente.cd_paciente, atendime.cd_convenio)) tem_outro_atendimento
FROM   dbamv.atendime,
       dbamv.paciente,
       dbamv.ori_ate,
       dbamv.convenio,
       dbamv.con_pla,
       dbamv.prestador
WHERE  atendime.cd_paciente      = paciente.cd_paciente
AND    atendime.cd_ori_ate       = ori_ate.cd_ori_ate
AND    ori_ate.cd_multi_empresa  = $P{P_CD_MULTI_EMPRESA}  /* OP 41870 */
And    atendime.Cd_Multi_Empresa = $P{P_CD_MULTI_EMPRESA}  /PDA 205491/
AND    atendime.cd_convenio      = convenio.cd_convenio
AND    atendime.cd_con_pla       = con_pla.cd_con_pla(+)
AND    atendime.cd_prestador     = prestador.cd_prestador(+)  /PDA 188473/
AND    atendime.cd_convenio      = con_pla.cd_convenio(+)
AND    atendime.dt_atendimento between to_date(to_char($P{P_DT_INICIAL},'dd/mm/yyyy')||' 00:00:00','dd/mm/yyyy HH24:MI:SS') AND to_date(to_char($P{P_DT_FINAL},'dd/mm/yyyy')||' 23:59:59','dd/mm/yyyy HH24:MI:SS')
$P!{CF_CONVENIO}
$P!{CF_PRESTADOR}
$P!{CF_ORIGEM}
$P!{CF_TIPO_ATENDIMENTO}
$P!{CF_CID}
$P!{CF_MULTI_EMPRESA} -- PDA 111195
ORDER BY atendime.cd_atendimento, atendime.dt_atendimento, atendime.hr_atendimento