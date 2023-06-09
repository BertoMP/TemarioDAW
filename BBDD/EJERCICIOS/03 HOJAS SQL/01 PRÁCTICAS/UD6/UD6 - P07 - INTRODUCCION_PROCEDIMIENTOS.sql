CREATE OR REPLACE PROCEDURE REVISION_SALARIAL (P_APELLIDO EMPLE.APELLIDO%TYPE)
AS
    V_APELLIDO          EMPLE.APELLIDO%TYPE;
    V_DEPARTAMENTO      EMPLE.DEPT_NO%TYPE;
    V_SALARIO_EMPLEADO  EMPLE.SALARIO%TYPE;
    V_NUEVO_SALARIO     EMPLE.SALARIO%TYPE;
BEGIN
    V_APELLIDO := UPPER(P_APELLIDO);
    
    SELECT DEPT_NO, SALARIO
        INTO V_DEPARTAMENTO, V_SALARIO_EMPLEADO
    FROM EMPLE
    WHERE APELLIDO = V_APELLIDO;

    IF V_SALARIO_EMPLEADO < MEDIA_DEP(V_DEPARTAMENTO) THEN
        V_NUEVO_SALARIO := V_SALARIO_EMPLEADO * 1.1;
        UPDATE EMPLE
            SET SALARIO = V_NUEVO_SALARIO
            WHERE APELLIDO = V_APELLIDO;
        DBMS_OUTPUT.PUT_LINE('Se ha actualizado el salario de ' 
            || V_APELLIDO || ' de ' || V_SALARIO_EMPLEADO || ' a ' 
            || V_NUEVO_SALARIO || '.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se ha actualizado el salario de ' 
            || V_APELLIDO || '.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('El empleado ' || V_APELLIDO || ' no existe.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Hay varios empleados con el apellido ' 
            || V_APELLIDO || '.');
END;
/

EXECUTE REVISION_SALARIAL('JIMENO');
