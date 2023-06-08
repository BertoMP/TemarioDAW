SELECT * FROM EMPLE;

/* a) Obt�n el apellido del empleado que tiene mayor salario. */

SELECT APELLIDO FROM EMPLE
WHERE SALARIO = (SELECT MAX(SALARIO) FROM EMPLE);

/* b) Obt�n los apellidos de los empleados con salarios superior a la media. */

SELECT APELLIDO FROM EMPLE
WHERE SALARIO > (SELECT AVG(SALARIO) FROM EMPLE);

/* c) Obt�n los apellidos de los empleados con salario superior a 
      la media de los salarios de los directores. */

SELECT APELLIDO FROM EMPLE
WHERE SALARIO > (SELECT AVG(SALARIO) FROM EMPLE
                 WHERE OFICIO = 'DIRECTOR');