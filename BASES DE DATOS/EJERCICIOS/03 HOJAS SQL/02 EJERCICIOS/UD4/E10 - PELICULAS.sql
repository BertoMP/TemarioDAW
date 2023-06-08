SELECT * FROM PELICULAS;

/* a) Visualiza la pel�cula con mayor presupuesto. */

SELECT * 
FROM PELICULAS
WHERE PRESUPUESTO = (SELECT MAX(PRESUPUESTO) 
                     FROM PELICULAS);

/* b) Visualiza la pel�cula m�s larga. */

SELECT * 
FROM PELICULAS
WHERE DURACION = (SELECT MAX(DURACION) 
                  FROM PELICULAS);

/* c) El nombre, a�o y recaudaci�n de la pel�cula con menor recaudaci�n.
      La recaudaci�n se mostrar� sin decimales (redondear). */

SELECT TITULO, A�O, ROUND(RECAUDACION,0) RECAUDACION 
FROM PELICULAS
WHERE RECAUDACION = (SELECT MIN(RECAUDACION) 
                     FROM PELICULAS);

/* d) El nombre, a�o y beneficio de la pel�cula m�s antigua. El beneficio
      se calculara a partir del presupuesto y la recaudaci�n. */

SELECT TITULO, A�O, (RECAUDACION - PRESUPUESTO) BENEFICIO 
FROM PELICULAS
WHERE A�O = (SELECT MIN(A�O) 
             FROM PELICULAS);

/* e) Para cada pel�cula se ver� el t�tulo, a�o y la diferencia de duraci�n
      que tiene con la duraci�n media de las peliculas de la tabla. Este
      �ltimo campo aparecer� redondeado sin decimales y con nombre
      "difiere de la media". */

SELECT TITULO, A�O, ROUND((DURACION - (SELECT AVG(DURACION) 
                                       FROM PELICULAS)),0) "DIFIERE DE LA MEDIA" 
FROM PELICULAS;

/* f) Para cada pel�cula se ver� el t�tulo, a�o y la diferencia de recaudaci�n
      con respecto a la mayor recaudaci�n (redondeado a las unidades de
      millar). */

SELECT TITULO, A�O, ROUND(RECAUDACION - (SELECT MAX(RECAUDACION) 
                                         FROM PELICULAS),-3) DIFIERE 
FROM PELICULAS;
