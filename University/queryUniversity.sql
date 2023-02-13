USE universidad;

-- 1) Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

SELECT 
    apellido1, apellido2, nombre
FROM
    universidad.persona
WHERE
    persona.tipo = 'alumno'
ORDER BY apellido1 ASC , apellido2 ASC , nombre ASC;

-- 2) Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.

SELECT 
    nombre, apellido1, apellido2
FROM
    universidad.persona
WHERE
    telefono  IS NULL;
    
-- 3) Retorna el llistat dels alumnes que van néixer en 1999.

SELECT 
    *
FROM
    universidad.persona
WHERE
    persona.tipo = 'alumno'
        AND YEAR(fecha_nacimiento) = '1999'; 
    
 -- 4) Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.   
 
SELECT 
    *
FROM
    universidad.persona
WHERE
    persona.tipo = 'profesor' AND telefono IS NULL AND persona.nif like '%k';
