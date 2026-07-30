-- Modulos vinculados a um papel

select *
  from dbasgu.papel_mod pm
 inner join dbasgu.papel p
    on pm.cd_papel = p.cd_papel
 where cd_modulo like
       (&< name = "Tela" hint = "Tele" required = "no" type = "string"
        list = "select m.cd_modulo from dbasgu.modulos m" default = "%" >);