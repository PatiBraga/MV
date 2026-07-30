SELECT cd_tuss,
ds_tuss,
To_Char(dt_inicio_vigencia, 'dd/mm/rrrr') AS  dt_inicio_vigencia,
To_Char(dt_fim_vigencia, 'dd/mm/rrrr') AS  dt_fim_vigencia,
tuss.cd_convenio,
convenio.nm_convenio,
tuss.cd_pro_fat,
pro_fat.ds_pro_fat,
tip_tuss.cd_tip_tuss,
tip_tuss.cd_tip_tuss || ' - ' ||  tip_tuss.ds_tip_tuss nome
FROM
tuss,
pro_fat,
convenio,
tip_tuss

WHERE tuss.cd_pro_fat = pro_fat.cd_pro_fat
and tuss.cd_convenio = convenio.cd_convenio
and tip_tuss.cd_tip_tuss = tuss.cd_tip_tuss
AND  dt_fim_vigencia IS NOT NULL
AND pro_fat.sn_ativo  = 'S'
AND tuss.cd_convenio IS NOT null
AND tip_tuss.cd_tip_tuss = ({V_TUSS})
AND {V_VAR}

