/* a) Obt�n la suma de salarios, el salario m�ximo y el salario m�nimo por 
      cada departamento. */
SELECT SUM(SALARIO), MAX(SALARIO), MIN(SALARIO)
FROM EMPLE
GROUP BY DEPT_NO;

/* b) Visualiza el n�mero m�nimo de empleados que tiene alg�n departamento. */
SELECT MIN(COUNT(*))
FROM EMPLE
GROUP BY DEPT_NO;