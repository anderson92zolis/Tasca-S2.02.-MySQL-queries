USE tienda;

-- 1) Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM tienda.producto;

-- 2) Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio FROM tienda.producto;

-- 3) Llista totes les columnes de la taula producto.
SELECT * FROM tienda.producto;

-- 4) Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, ROUND(precio,2) AS PrecioEUROS  , ROUND(precio*(1/0.93),2 ) AS PrecioDolares_USD FROM tienda.producto;

-- 5) Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
SELECT nombre AS 'nom de producto' , ROUND(precio,2) AS euros  , ROUND(precio*(1/0.93),2 ) AS dòlars FROM tienda.producto;

-- 6) Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre) AS nombre, precio FROM tienda.producto;  

-- 7) Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
SELECT lOWER(nombre) AS nombre, precio FROM tienda.producto;  

-- 8) Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.nombre    link-> W3SCHOOL SUBTRING &  https://www.tutorialspoint.com/How-can-we-capitalize-only-first-letter-of-a-string-with-the-help-of-MySQL-function-s
SELECT nombre, CONCAT(UPPER(SUBSTRING(nombre,1,2)) , LOWER(SUBSTRING(nombre,3)) ) as Nombre FROM tienda.fabricante;

-- 9) Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) AS precio FROM tienda.producto;

-- 10) Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.    ->  https://www.w3schools.com/sql/func_mysql_truncate.asp
SELECT nombre, TRUNCATE(precio,0) AS precio FROM tienda.producto; 
 
-- 11) Llista el codi dels fabricants que tenen productes en la taula producto.    		 ->   https://www.w3schools.com/sql/sql_join_inner.asp   // if there is a column with similar name use the table.column
SELECT fabricante.codigo FROM tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;   
 
-- 12) Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT(fabricante.codigo) FROM tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;
 
-- 13) Llista els noms dels fabricants ordenats de manera ascendent.    				 ->https://www.w3schools.com/sql/sql_orderby.asp
SELECT nombre FROM tienda.fabricante
ORDER BY nombre ASC;

-- 14) Llista els noms dels fabricants ordenats de manera descendent
SELECT nombre FROM tienda.fabricante
ORDER BY nombre DESC;

-- 15) Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio FROM tienda.producto
ORDER BY nombre ASC, precio DESC;

-- 16) Retorna una llista amb les 5 primeres files de la taula fabricante.					->	https://www.w3schools.com/mysql/mysql_limit.asp
SELECT * FROM tienda.fabricante
LIMIT 5;

-- 17) Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.  			->	https://stackoverflow.com/questions/8805538/how-to-select-n-records-from-a-table-in-mysql
SELECT * FROM tienda.fabricante
LIMIT 3,2;


-- 18) Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto
ORDER BY precio
LIMIT 1;

-- 19) Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto
ORDER BY precio DESC
LIMIT 1;

-- 20) Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT producto.nombre FROM tienda.producto 
INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo=2;   