/* 5.1 Cu�ntos ejemplares de Pino Carrasco hay en total. */
SELECT COUNT(*) FROM EJEMPLAR_ARBOL
WHERE ESPECIE = 'PINO CARRASCO';

/* 5.2 Cu�ntos ejemplares hay de Pino Carrasco en Asturias */
SELECT COUNT(*) FROM EJEMPLAR_ARBOL
WHERE ESPECIE = 'PINO CARRASCO' AND PROVINCIA = 'ASTURIAS';

/* 5.3 En cu�ntas provincias hay Pino Carrasco.*/
SELECT COUNT(DISTINCT PROVINCIA) FROM EJEMPLAR_ARBOL
WHERE ESPECIE = 'PINO CARRASCO';

/* 5.4 Listar las provincias en las que hay alg�n ejemplar de Pino Carrasco. 
       Ten en cuenta que no aporta informaci�n �til el que una misma provincia 
       aparezca m�s de una vez.*/
SELECT DISTINCT PROVINCIA FROM EJEMPLAR_ARBOL
WHERE ESPECIE = 'PINO CARRASCO';

/* 5.5 Lista, para cada �rbol, todos sus campos de su clave primaria y el tipo 
       de riego (campo �riego�), ordenados por el tipo de riego. Los �rboles 
       que no tengan configurado tipo de riego deben aparecer con el texto 
       �SIN RIEGO� en ese campo, en lugar de null.*/
SELECT * FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'EJEMPLAR_ARBOL';

SELECT ESPECIE, POBLACION, PROVINCIA, ORDEN_REG, NVL(RIEGO, 'SIN RIEGO')
    FROM EJEMPLAR_ARBOL
ORDER BY RIEGO ASC;