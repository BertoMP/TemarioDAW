create table obras_teatro(
titulo varchar(40),
estreno number(4),
duracion number(3),
categoria varchar2(30) check (categoria in ('musical','drama','comedia','experimental')),
primary key (titulo,estreno)
);
insert into obras_teatro values ('El Rey Le�n',1997,160,'musical');
insert into obras_teatro values ('La La Land',2004,95,'drama');
insert into obras_teatro values ('El Verdugo',1921,110,'drama');
insert into obras_teatro values ('El Verdugo',2020,70,'experimental');
commit;

/* a. Muestra en un �nico listado los t�tulos y a�os de estreno de todas las 
      obras (de teatro y pel�culas), ordenadas de m�s antiguas a m�s modernas. */
SELECT TITULO, ESTRENO
FROM OBRAS_TEATRO
UNION
SELECT TITULO, A�O
FROM PELICULAS
ORDER BY ESTRENO;

/* b. Muestra el t�tulo de las obras que se han hecho tanto en pel�cula como 
      en obra de teatro. */
SELECT TITULO
FROM OBRAS_TEATRO
INTERSECT
SELECT TITULO
FROM PELICULAS;

/* c. En ocasiones puede ser interesante utilizar operadores de conjuntos para 
      realizar consultas sobre una misma tabla. Obt�n, utilizando operadores 
      de conjuntos, los t�tulos de obras de teatro que se han estrenado como 
      dramas y adem�s como otras categor�as.*/
SELECT TITULO
FROM OBRAS_TEATRO
WHERE CATEGORIA = 'drama'
INTERSECT
SELECT TITULO
FROM OBRAS_TEATRO
WHERE CATEGORIA != 'drama';