--A)
SELECT EMP_NO, APELLIDO, OFICIO, DEPT_NO "DEPARTAMENTO" FROM EMPLE 
WHERE DEPT_NO=20
ORDER BY APELLIDO ASC;
--B)
SELECT * FROM EMPLE
WHERE OFICIO='ANALISTA'
ORDER BY EMP_NO ASC;
--C)
SELECT * FROM EMPLE
WHERE DEPT_NO=20
ORDER BY APELLIDO DESC, EMP_NO DESC;