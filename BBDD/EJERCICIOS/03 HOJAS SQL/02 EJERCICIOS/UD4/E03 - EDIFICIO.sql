create table edificio(
    pais varchar2(30),
    cod_direccion varchar(10),
    uso varchar2(10) check (uso in ('p�blico','privado')),
    inicio_obras date,
    fin_obras date,
    plantas number(4),
    altura_planta_cm number(6),
    aforo_planta number(5),
    metros_planta number(5),
    altura_total_cm number(7),
    material varchar2(30),
    extintores number(5),
    cod_arquitec varchar2(5),
    cod_constructora varchar2(5) not null,
    precio number(9),
        constraint PK_EDIFICIO primary key (pais,cod_direccion)
);

/*3.1 El c�digo de direcci�n y la altura total de cada edificio de Francia. 
      La altura debe verse en metros y debe aparecer con el t�tulo 
      �altura (metros)�.*/
SELECT COD_DIRECCION, (ALTURA_TOTAL_CM)/100 "ALTURA (METROS)" FROM EDIFICIO
WHERE PAIS = 'Francia';

/*3.2 El pa�s y el tiempo que duraron las obras para todos los edificios que ha 
      construido la constructora �AAA0�. Debe aparecer con el t�tulo �duraci�n 
      obras (d�as)�. Los datos deben estar ordenados por pa�s y por la duraci�n 
      de las obras.*/
SELECT PAIS, (FIN_OBRAS - INICIO_OBRAS) "DURACI�N OBRAS (D�AS)" FROM EDIFICIO
WHERE COD_CONSTRUCTORA = 'AAA0'
ORDER BY PAIS ASC, (FIN_OBRAS - INICIO_OBRAS) ASC;

/*3.3. Los metros cuadrados totales (hay que calcularlo teniendo en cuenta los 
       metros por planta y el n�mero de plantas) de todos los edificios p�blicos
       construidos despu�s del a�o 2000. Debe aparecer con el t�tulo �superficie
       total (m2)�.
       Tambi�n aparecer� el pa�s, c�digo de direcci�n, material de construcci�n,
       metros por planta y n�mero de plantas. Aparecer�n ordenados por material,
       y dentro de material por pa�s.*/
SELECT (METROS_PLANTA * PLANTAS) "SUPERFICIE TOTAL (m2)", PAIS, COD_DIRECCION, 
    MATERIAL, METROS_PLANTA, PLANTAS FROM EDIFICIO
WHERE USO = 'p�blico' AND FIN_OBRAS >= '01/01/01'
ORDER BY MATERIAL ASC, PAIS ASC;

/*3.4 Mostrar todas las constructoras cuyo n�mero medio de extintores por 
      planta en alg�n edificio sea inferior a 5. Ten en cuenta que habr� que 
      calcular el n�mero medio de extintores por planta, ya que ese dato no 
      aparece directamente en la tabla.*/
SELECT DISTINCT COD_CONSTRUCTORA FROM EDIFICIO
WHERE (EXTINTORES / PLANTAS) < 5;

/*3.5 Mostrar la media de extintores por metros cuadrados totales de cada 
      edificio. Este dato debe calcularse dividiendo el n�mero total de 
      extintores entre el n�mero total de metros cuadrados del edificio.
      Solo aparecer�n aquellos edificios que tengan menos de 10 plantas y 
      se construyeran antes de 1999.*/
SELECT ROUND(EXTINTORES / (METROS_PLANTA * PLANTAS), 2) FROM EDIFICIO
WHERE PLANTAS < 10 AND FIN_OBRAS < '01/01/99';

/*3.6 El precio medio por planta en millones de euros, en orden decreciente, 
      de los edificios brasile�os con m�s de 10 extintores por planta. 
      Tambi�n se mostrar� la constructora. S�lo se tendr�n en cuenta los 
      edificios realizados en cemento.
      El precio medio por planta debe aparecer con el t�tulo 
      �precio x planta (mill.)�.*/
SELECT ROUND((PRECIO / PLANTAS) / 1000000, 2) "PRECIO X PLANTA (MILL.)", 
    COD_CONSTRUCTORA FROM EDIFICIO
WHERE PAIS = 'Brasil' AND (EXTINTORES / PLANTAS) > 10 AND MATERIAL = 'cemento'
ORDER BY (PRECIO / 1000000) DESC;

/*3.7 Mostrar los edificios que tardaron m�s de 1 a�o en construirse, 
      que sean de madera y se encuentren en Jap�n.
      Ten en cuenta que cuando se operan fechas (se suman o restan dos fechas), 
      el resultado aparece en d�as.*/
SELECT * FROM EDIFICIO
WHERE (FIN_OBRAS - INICIO_OBRAS) > 365 AND MATERIAL = 'madera' AND PAIS = 'Jap�n';

/*3.8 Mostrar edificios los cuya direcci�n acaba en 0, que tienen m�s de 20 
      plantas y con al menos 3 extintores por planta (calcula la media de 
      extintores por planta).*/
SELECT * FROM EDIFICIO
WHERE COD_DIRECCION LIKE '%0' AND PLANTAS > 20 AND (EXTINTORES / PLANTAS) > 3;

/*3.9 Mostrar los edificios brasile�os con un 2 en la pen�ltima posici�n de su
      c�digo de direcci�n.*/
SELECT * FROM EDIFICIO
WHERE PAIS = 'Brasil' AND COD_DIRECCION LIKE '%2_';
    
/*3.10 Los edificios espa�oles o italianos: cuyo precio medio por planta supere 
       los tres millones de euros o bien cuya altura sea mayor de 50 metros 
       (s�lo si no est�n hechos de madera)*/
SELECT * FROM EDIFICIO
WHERE PAIS IN('Espa�a','Italia') AND (((PRECIO / PLANTAS) / 1000000 > 3) 
    OR ((ALTURA_TOTAL_CM / 100) > 50 AND MATERIAL != 'madera'));