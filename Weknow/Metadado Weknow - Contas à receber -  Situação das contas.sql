select
 mes,
 recebido * 100 / previsto perc_recebido,
 recuperado * 100 / previsto perc_recuperado,
 pendente_receber * 100 / previsto perc_pendente_receber,
 (glosa_aceita + recebido_baixa_contabil + recuperado_baixa_contabil) * 100 / previsto perc_glosa_aceita,
 (previsto - recebido - recuperado - glosa_aceita - recebido_baixa_contabil - recuperado_baixa_contabil - pendente_receber) 
     * 100 / previsto perc_recurso,
 recebido,
 recuperado,
 pendente_receber,
 glosa_aceita + recebido_baixa_contabil + recuperado_baixa_contabil glosa_aceita,
 previsto - recebido - recuperado - glosa_aceita - recebido_baixa_contabil - recuperado_baixa_contabil - pendente_receber recurso,
 previsto vl_competencia
from
( 
Select
 mes,
 sum(previsto) previsto,
 --sum(rec_ini) recebido,
  sum(rec_ini) - sum(rec_ini_acre) +  sum(rec_ini_desc) recebido,  --sem descontro e acrescimo aplicado
 --sum(rec_recup) recuperado,
 sum(rec_recup) - sum(rec_recup_acre) +  sum(rec_recup_desc) recuperado, --sem descontro e acrescimo aplicado
 sum(rec_baixa) recebido_baixa_contabil,
 sum(recup_baixa) recuperado_baixa_contabil,
 sum(n_recebido) pendente_receber,
 sum(glosa) glosa_identificada,
 sum(glosa_aceita) glosa_aceita

From
(
 Select
   to_char(nf.dt_emissao,'yyyy/mm') mes,
   convenio.nm_convenio,
   c.cd_con_rec,
   c.cd_nota_fiscal,
   i.cd_itcon_rec,
   NVL(i.vl_duplicata,0) previsto,
   NVL(i.vl_glosa,0) glosa,
   NVL(i.vl_recurso,0) recurso,
   NVL(i.vl_glosa_aceita,0) glosa_aceita,
   NVL((select sum(nvl( r.vl_recebido,0)) 
         from dbamv.reccon_rec r 
        where i.cd_itcon_rec = r.cd_itcon_rec 
              and r.cd_remessa_glosa is null
              and r.cd_processo <> 159),0) rec_ini,

   NVL((select sum(nvl( r.vl_acrescimo,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec 
               and r.cd_remessa_glosa is null),0) rec_ini_acre,

   NVL((select sum(nvl( r.vl_desconto,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec  
               and r.cd_remessa_glosa is null),0) rec_ini_desc,

   NVL((select sum(nvl( r.vl_recebido,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec 
               and r.cd_remessa_glosa is not null
               and r.cd_processo <> 159),0) rec_recup,

   NVL((select sum(nvl( r.vl_acrescimo,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec 
               and r.cd_remessa_glosa is not null),0) rec_recup_acre,

   NVL((select sum(nvl( r.vl_desconto,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec 
                and r.cd_remessa_glosa is not null),0) rec_recup_desc,

   NVL((select sum(nvl( r.vl_recebido,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec 
               and r.cd_remessa_glosa is null
               and r.cd_processo = 159),0) rec_baixa,


   NVL((select sum(nvl( r.vl_recebido,0)) 
          from dbamv.reccon_rec r 
         where i.cd_itcon_rec = r.cd_itcon_rec 
               and r.cd_remessa_glosa is not null
               and r.cd_processo = 159),0) recup_baixa,

   CASE 
    WHEN not exists(select 1 from dbamv.reccon_rec r where i.cd_itcon_rec = r.cd_itcon_rec) then i.vl_duplicata
      else 0
    END n_recebido

 from
      dbamv.con_rec c,
      dbamv.itcon_rec i,
      dbamv.nota_fiscal nf,
      dbamv.convenio
 where  
      convenio.cd_convenio not in (13,12,9,40) -- somente convênios 
      and c.cd_con_rec = i.cd_con_rec   
      and c.cd_multi_empresa = :P_CD_MULTI_EMPRESA      
      AND c.CD_NOTA_FISCAL = nf.cd_nota_fiscal(+)
      and nf.cd_convenio = convenio.cd_convenio (+)
      and c.dt_cancelamento is null
      and i.dt_cancelamento is null
      and nf.dt_cancelamento is null 
      and i.cd_con_rec_agrup is null      
      AND C.VL_PREVISTO > 0          
      AND nf.dt_emissao  between :ini and  to_date(:fin) + 86399/86400
      and (:convenio is null or '%,'||:convenio||',%' like '%,'||convenio.cd_convenio||',%')
)
group by
 mes
)
ORDER BY 
 1