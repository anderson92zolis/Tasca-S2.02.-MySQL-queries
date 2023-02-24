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
-- SELECT nombre, ucase(LEFT(nombre,2)) FROM tienda.fabricante; solo dos caracteres.

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

-- 21) Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre AS 'nombre del producto', producto.precio ,fabricante.nombre AS 'nombre del fabricante' FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo;

-- 22) Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre AS 'nombre del producto', producto.precio ,fabricante.nombre AS 'nombre del fabricante' FROM producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo 
ORDER BY fabricante.nombre ASC;

-- 23) Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT producto.codigo AS 'Código Producto' , producto.nombre AS 'Nombre Producto' , fabricante.codigo AS 'Códio Fabricante' , fabricante.nombre AS 'Nombre de Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo;

-- 24) Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- ORDER BY
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio producto', fabricante.nombre AS 'Nombre de Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
ORDER BY precio
LIMIT 1;
-- WHERE MIN
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio producto', fabricante.nombre AS 'Nombre de Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE precio= (SELECT MIN(precio) FROM producto); 

-- 25) Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- ORDER BY
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio producto', fabricante.nombre AS 'Nombre de Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
ORDER BY precio DESC
LIMIT 1;
-- WHERE MIN
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio producto', fabricante.nombre AS 'Nombre de Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE precio= (SELECT MAX(precio) FROM producto); 

-- 26) Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.codigo AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

-- 27) Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.codigo AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND  producto.precio>200;

-- 28) Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.codigo AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre= 'Asus' OR fabricante.nombre= 'Hewlett-Packard' OR fabricante.nombre= 'Seagate';

-- 29) Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.   		->	 https://www.w3schools.com/mysql/mysql_in.asp
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.codigo AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30) Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre LIKE '%e';

-- 31) Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.		-> https://www.w3schools.com/mysql/mysql_wildcards.asp
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre LIKE '%W%';

-- 32) Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', fabricante.nombre AS 'Nombre Fabricante' From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE producto.precio>=180
ORDER BY producto.precio DESC, producto.nombre ASC ;

-- 33) Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT  fabricante.codigo AS 'Código Fabricante',fabricante.nombre AS 'Nombre Fabricante' From fabricante
INNER JOIN producto ON fabricante.codigo=producto.codigo_fabricante; 

-- 34) Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT  fabricante.nombre AS 'Nombre Fabricante', producto.nombre AS 'Nombre Producto' From fabricante
LEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante;				-- WHERE fabricante.nombre  IS NOT NULL    -> This is not necessary show LEFT(ALL SUPPLIER TABLE); 

-- 35) Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT  fabricante.nombre AS 'Nombre Fabricante', producto.nombre AS 'Nombre Producto' From fabricante
lEFT JOIN producto ON fabricante.codigo=producto.codigo_fabricante
WHERE producto.nombre  IS NULL;

-- 36) Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT   producto.nombre AS 'Nombre Producto' From producto
LEFT JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo
WHERE fabricante.nombre IN ('Lenovo');

-- 37) Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).   
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', producto.codigo_fabricante AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante'  From producto
LEFT JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE precio= (SELECT MAX(producto.precio) FROM producto WHERE fabricante.nombre = 'Lenovo');
																								
-- 38) Llista el nom del producte més car del fabricant Lenovo.
SELECT 
    producto.codigo AS 'Código Producto',
    producto.nombre AS 'Nombre Producto',
    producto.precio AS 'Precio Producto',
    producto.codigo_fabricante AS 'Código Fabricante',
    fabricante.nombre AS 'Nombre Fabricante'
FROM
    producto
        INNER JOIN
    fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE
    precio = (SELECT 
            MAX(producto.precio)
        FROM
            producto
                INNER JOIN
            fabricante ON producto.codigo_fabricante = fabricante.codigo
        WHERE
            fabricante.nombre = 'Lenovo');   --  -> more expensive that MAX(price of LENOVO)

-- 39) Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', producto.codigo_fabricante AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante'  From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo

WHERE precio= (SELECT MIN(producto.precio) FROM producto  INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' );               -- -> "Other solution "    WHERE precio= (SELECT MIN(producto.precio) FROM producto) AND fabricante.nombre = 'Hewlett-Packard';  
												 
-- 40) Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', producto.codigo_fabricante AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante'  From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE precio >= (SELECT MAX(producto.precio) FROM producto  INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo' ); 

-- 41)  Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.codigo AS 'Código Producto', producto.nombre AS 'Nombre Producto', producto.precio AS 'Precio Producto', producto.codigo_fabricante AS 'Código Fabricante', fabricante.nombre AS 'Nombre Fabricante'  From producto
INNER JOIN fabricante ON producto.codigo_fabricante= fabricante.codigo
WHERE fabricante.nombre = 'Asus' AND  precio >= (SELECT AVG(producto.precio) FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' ) ; 