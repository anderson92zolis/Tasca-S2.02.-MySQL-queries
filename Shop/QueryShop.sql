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
-- 11) Llista el codi dels fabricants que tenen productes en la taula producto.     ->   https://www.w3schools.com/sql/sql_join_inner.asp
SELECT codigo FROM tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo;    
-- 12) Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
   
