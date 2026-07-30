-- ACESSOS DO PAPEL
SELECT DISTINCT
       modulo,
       tela,
       cd_papel,
       ds_papel,
       cd_usuario,
       nm_usuario

  FROM
       (
         SELECT
                nm_sistema Modulo
                ,cd_modulo Tela
                ,cd_usuario
                ,nm_usuario
                ,nvl(cd_papel,0) cd_papel
                ,ds_papel
           FROM
                (
                  SELECT
                         sistema.nm_sistema,
                         modulos.cd_modulo,
                         modulos.nm_modulo,
                         usuarios.cd_usuario,
                         usuarios.nm_usuario,
                         tp_modulo,
                         0 cd_papel,
                         NULL ds_papel
                    FROM
                         dbasgu.sistema,
                         dbasgu.modulos,
                         dbasgu.usuarios,
                         dbasgu.mod_sis,
                         dbasgu.aut_mod
                   WHERE
                         sistema.cd_sistema = mod_sis.cd_sistema
                     AND modulos.cd_modulo = mod_sis.cd_modulo
                     AND modulos.cd_modulo = aut_mod.cd_modulo
                     AND usuarios.cd_usuario = aut_mod.cd_usuario
                     AND usuarios.sn_ativo = 'S'
                   GROUP BY
                         nm_sistema,
                         modulos.cd_modulo,
                         nm_modulo,
                         usuarios.cd_usuario,
                         nm_usuario,
                         tp_modulo
                   UNION
                  SELECT
                         sistema.nm_sistema,
                         modulos.cd_modulo,
                         modulos.nm_modulo,
                         usuarios.cd_usuario,
                         usuarios.nm_usuario,
                         tp_modulo,
                         papel.cd_papel,
                         papel.ds_papel
                    FROM
                         dbasgu.sistema,
                         dbasgu.mod_sis,
                         dbasgu.modulos,
                         dbasgu.usuarios,
                         dbasgu.papel_mod,
                         dbasgu.papel,
                         dbasgu.papel_usuarios p_usu
                   WHERE
                         sistema.cd_sistema = mod_sis.cd_sistema
                         AND mod_sis.cd_modulo = modulos.cd_modulo
                         AND modulos.cd_modulo = papel_mod.cd_modulo
                         AND papel_mod.cd_papel = p_usu.cd_papel
                         AND papel_mod.cd_papel = papel.cd_papel
                         AND p_usu.cd_usuario = usuarios.cd_usuario
                         AND usuarios.sn_ativo = 'S'


                   GROUP BY
                         nm_sistema,
                         modulos.cd_modulo,
                         nm_modulo,
                         usuarios.cd_usuario,
                         nm_usuario,
                         tp_modulo,
                         papel.cd_papel,
                         papel.ds_papel

                ))            -- M_SOLIC_COLETA
                 WHERE
                       cd_usuario = 'FULANO.SILVA'
                        AND CD_PAPEL = 125
                        --AND  tela LIKE '%M_ATEND%'
                 ORDER BY

                       cd_usuario, 1