--Acessos a papéis e telas--
SELECT DISTINCT
       cd_sistema,
       modulo,
       tela,
       cd_papel,
       ds_papel,
      cd_usuario,
       nm_usuario

  FROM
       (
         SELECT
                cd_sistema
                ,nm_sistema Modulo
                ,cd_modulo Tela
                ,cd_usuario
                ,nm_usuario
                ,nvl(cd_papel,0) cd_papel
                ,ds_papel
           FROM
                (
                  SELECT
                         sistema.cd_sistema,
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
                         sistema.cd_sistema,
                         nm_sistema,
                         modulos.cd_modulo,
                         nm_modulo,
                         usuarios.cd_usuario,
                         nm_usuario,
                         tp_modulo
                   UNION
                  SELECT
                         sistema.cd_sistema,
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
                         sistema.cd_sistema,
                         nm_sistema,
                         modulos.cd_modulo,
                         nm_modulo,
                         usuarios.cd_usuario,
                         nm_usuario,
                         tp_modulo,
                         papel.cd_papel,
                         papel.ds_papel
                   ORDER BY
                         1 ASC,
                         2 ASC,
                         3 ASC,
                         6 ASC,
                         4 ASC,
                         5 ASC,
                         nm_sistema,
                         nm_modulo,
                         nm_usuario,
                         tp_modulo
                ))
                 WHERE
                       --CD_USUARIO IN ('FERNANDA.SLIMA')
                        TELA LIKE 'R_INTERNACOESCONVENIO'
                       --AND MODULO LIKE '%LABORATO%'
                        --cd_papel = 157
                       --AND CD_USUARIO IN(SELECT CD_ID_USUARIO FROM USUARIO_MULTI_EMPRESA WHERE CD_MULTI_EMPRESA = 3)
                 ORDER BY
                       --cd_papel ASC,
                       --cd_usuario,
                       tela,
                       modulo,
                       6,4