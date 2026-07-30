 SELECT *
 FROM dbamv.log_exc_ped_rx l
 INNER JOIN dbamv.mot_exc_rx m
         ON m.cd_mot_exc = l.cd_mot_exc
 WHERE l.cd_ped_rx = 225526