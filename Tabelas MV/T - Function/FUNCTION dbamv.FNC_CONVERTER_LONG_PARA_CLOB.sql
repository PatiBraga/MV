CREATE OR REPLACE FUNCTION dbamv.FNC_CONVERTER_LONG_PARA_CLOB(
    p_cd_atendimento IN NUMBER
) RETURN CLOB
IS
    v_clob CLOB;
    v_long LONG;
BEGIN
    SELECT pm.ds_evolucao
    INTO v_long
    FROM dbamv.pre_med pm
    WHERE pm.cd_atendimento = p_cd_atendimento
      AND pm.ds_evolucao IS NOT NULL
      AND ROWNUM = 1
    ORDER BY pm.dt_pre_med DESC;

    v_clob := TO_CLOB(v_long);

    RETURN v_clob;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN NULL;
END FNC_CONVERTER_LONG_PARA_CLOB;
