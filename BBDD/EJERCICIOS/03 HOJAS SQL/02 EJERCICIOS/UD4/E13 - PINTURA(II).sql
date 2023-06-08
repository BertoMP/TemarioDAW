SELECT * FROM MALETINES;
SELECT * FROM TUBOS_PINTURA;

/* a. Muestra la lista de marcas de pintura que comercializa la empresa, 
      ordenadas en orden alfab�tico. */
SELECT DISTINCT MARCA
FROM TUBOS_PINTURA
ORDER BY MARCA ASC;

/* b. Muestra, para cada marca de pintura, cu�ntos tubos de pintura tiene. */
SELECT MARCA, COUNT(*)
FROM TUBOS_PINTURA
GROUP BY MARCA;

/* c. Muestra las marcas que tienen m�s de 2 tubos de pintura. */
SELECT MARCA
FROM TUBOS_PINTURA
GROUP BY MARCA
HAVING COUNT(*) > 2;

/* d. Muestra, para cada marca de pintura, cu�ntos colores distintos tiene. */
SELECT MARCA, COUNT(DISTINCT COLOR)
FROM TUBOS_PINTURA
GROUP BY MARCA;

/* e. Muestra, para cada color de pintura, cu�ntas marcas de pintura lo tienen
      disponible. */
SELECT COLOR, COUNT(DISTINCT MARCA)
FROM TUBOS_PINTURA
GROUP BY COLOR;

/* f. Para cada marca de pintura y color de pintura, muestra cu�ntos tubos hay.
      El listado debe aparecer ordenado por marca. */
SELECT MARCA, COLOR, COUNT(*)
FROM TUBOS_PINTURA
GROUP BY MARCA, COLOR
ORDER BY MARCA ASC;

/* g. Para cada marca de pintura y color de pintura, muestra cuantos tubos hay.
      El listado debe aparecer ordenado por marca. S�lo deben aparecer los
      los colores de alg�n tipo de siena. */
SELECT MARCA, COLOR, COUNT(*)
FROM TUBOS_PINTURA
WHERE COLOR LIKE '%siena%'
GROUP BY MARCA, COLOR
ORDER BY MARCA ASC;

SELECT MARCA, COLOR, COUNT(*)
FROM TUBOS_PINTURA
GROUP BY MARCA, COLOR
HAVING COLOR LIKE '%siena%'
ORDER BY MARCA ASC;

/* h. Muestra cuantos tubos de pintura tiene dentro cada malet�n. Deben 
      aparecer todos los maletines (llenos y vac�os). */
SELECT M.COD_MALETIN, COUNT(REF)
FROM MALETINES M
LEFT JOIN TUBOS_PINTURA TP ON M.COD_MALETIN = TP.COD_MALETIN
GROUP BY M.COD_MALETIN;

SELECT M.COD_MALETIN, COUNT(REF)
FROM MALETINES M, TUBOS_PINTURA TP
WHERE M.COD_MALETIN = TP.COD_MALETIN(+)
GROUP BY M.COD_MALETIN;
