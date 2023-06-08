--2.1 Los �rboles plantados entre 2010 y 2012.
SELECT * FROM EJEMPLAR_ARBOL
WHERE A�O_PLANT BETWEEN 2010 AND 2012;

/*2.2 Los �rboles de Madrid que no tienen poda registrada (campo �ultima_poda�) 
      y miden m�s de 300 cent�metros.*/
SELECT * FROM EJEMPLAR_ARBOL
WHERE PROVINCIA = 'MADRID' AND ULTIMA_PODA = 'NO REGISTRADA' 
    AND ALTURA_CM > 300;

/*2.3 Los alcornoques plantados en Oviedo antes del 2007 que miden 
      m�s de 500 cent�metros.
      Mostrar todos los datos del �rbol, ordenados por altura.*/
SELECT * FROM EJEMPLAR_ARBOL 
WHERE ESPECIE = 'ALCORNOQUE' AND POBLACION = 'OVIEDO'
AND A�O_PLANT < 2007 AND ALTURA_CM > 500
ORDER BY ALTURA_CM ASC;

/*2.4 Las poblaciones y provincias que han podado �rboles (campo �ultima_poda�) 
      y sin embargo no ten�an recomendada ninguna poda 
      (campo �rec_periodicidad_poda�).
      Ordenar por provincia, y dentro de provincia por poblaci�n, en orden 
      alfab�tico (debe aparecer a la izquierda la provincia y a la derecha 
      la poblaci�n).*/
SELECT DISTINCT PROVINCIA, POBLACION FROM EJEMPLAR_ARBOL
WHERE ULTIMA_PODA != 'NO REGISTRADA' AND REC_PERIODICIDAD_PODA = 'NO PODA'
ORDER BY PROVINCIA ASC, POBLACION ASC;

/*2.5 Las alturas de los �rboles que tienen riego de alg�n tipo y se plantaron 
      antes del a�o 2000.
      Deben aparecer ordenadas de mayor a menor.*/
SELECT ALTURA_CM FROM EJEMPLAR_ARBOL
WHERE RIEGO IS NOT NULL AND A�O_PLANT < 2000
ORDER BY ALTURA_CM DESC;

/*2.6 La especie, orden de registro, recomendaci�n de poda y �ltima poda de 
      �rboles de la provincia de Madrid. Ordenar por la �ltima poda realizada.
      No deben aparecer �rboles que no tienen poda registrada 
      (campo �ultima_poda�).
      El resultado debe expresar el nombre de las columnas 
      �rec_periodicidad_poda� y �orden_reg� como �recomendaci�n de poda� y 
      �orden de alta en BD�, respectivamente.*/
SELECT ESPECIE, ORDEN_REG "ORDEN DE ALTA EN BD", REC_PERIODICIDAD_PODA
    "RECOMENDACI�N DE PODA", ULTIMA_PODA FROM EJEMPLAR_ARBOL
WHERE ULTIMA_PODA != 'NO REGISTRADA' AND PROVINCIA = 'MADRID'
ORDER BY ULTIMA_PODA ASC;

/*2.7 Las ciudades que tienen alg�n tipo de pino plantado (observa bien las 
      especies, hay diversos pinos). Tambi�n debe mostrarse la especie de pino.
      Hay que tener en cuenta que pueden insertarse nuevos tipos de pino en la 
      base de datos, y la consulta debe seguir siendo v�lida.*/
SELECT DISTINCT POBLACION, ESPECIE FROM EJEMPLAR_ARBOL
WHERE ESPECIE LIKE 'PINO%';

/*2.8 Las poblaciones que tienen m�s de una palabra. Hay que mostrar la 
      poblaci�n y su provincia, ordenadas por provincia.*/
SELECT POBLACION, PROVINCIA FROM EJEMPLAR_ARBOL
WHERE POBLACION LIKE '% %'
ORDER BY PROVINCIA ASC;

/*2.9 Los �rboles que est�n enfermos (campo estado) y no tienen riego de 
      ning�n tipo (campo riego).*/
SELECT * FROM EJEMPLAR_ARBOL
WHERE ESTADO = 'ENFERMO' AND RIEGO IS NULL;

/*2.10 Los �rboles plantados en las ciudades de Madrid y Barcelona, los a�os 
       2000, 2010 y 2015, ordenados por ciudad y dentro de ciudad por altura.*/
SELECT * FROM EJEMPLAR_ARBOL
WHERE POBLACION IN('MADRID','BARCELONA') AND A�O_PLANT IN(2000,2010,2015)
ORDER BY POBLACION ASC, ALTURA_CM ASC;