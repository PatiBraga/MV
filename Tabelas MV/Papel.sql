select *
from dbasgu.papel_mod a, dbasgu.papel b
where a.cd_papel = b.cd_papel
and cd_modulo = 'M_ANEXO_PACIENTE'