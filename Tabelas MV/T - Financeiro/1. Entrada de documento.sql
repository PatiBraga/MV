SELECT *
FROM dbamv.documento_entrada
WHERE nr_documento = '44212';



SELECT *
FROM dbamv.ent_pro ent
WHERE cd_fornecedor = '8003'  -- AND nr_documento = '31220'
ORDER BY dt_entrada desc




SELECT *
FROM ent_pro
WHERE nr_documento IN  ('31220', '44212');



UPDATE ent_pro
SET sn_importada_fnfi = 'S'
WHERE nr_documento = '31220' AND cd_ent_pro = '23362'



SELECT *
FROM ent_pro
WHERE nr_documento IN  ('31220', '44212');



SELECT *
FROM dbamv.ent_pro
WHERE nr_documento = '44212'




SELECT *
FROM dbamv.DEV_FOR
WHERE nr_documento = '44212'



SELECT *
FROM dbamv.con_pag
WHERE nr_documento = '44212'



SELECT *
FROM dbamv.con_pag
WHERE nr_documento = '44212'



SELECT *
FROM tip_doc
ORDER BY cd_tip_doc;