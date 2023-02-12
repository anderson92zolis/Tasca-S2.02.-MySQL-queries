USE tienda;

-- 1) Llista el nom de tots els productes que hi ha en la taula producto.
SELECT nombre FROM tienda.producto;
-- 2) Llista els noms i els preus de tots els productes de la taula producto.
SELECT nombre, precio From tienda.producto;
-- 3) Llista totes les columnes de la taula producto.
SELECT * From tienda.producto;
-- 4) Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
