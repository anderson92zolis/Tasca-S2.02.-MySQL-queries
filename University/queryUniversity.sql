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
    
-- 5) Retorna el llistat dels alumnes que van néixer en 1999.

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
    
-- 5) Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.

SELECT 
    asignatura.nombre
FROM
    universidad.asignatura
        INNER JOIN
    universidad.grado ON asignatura.id_grado = grado.id
WHERE
    asignatura.cuatrimestre = 1
        AND asignatura.curso = 3
        AND grado.id = 7;
        
-- 6) Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.

SELECT 
    persona.apellido1 AS 'Primer Apellido Profesor',
    persona.apellido2 AS 'Segundo Apellido Profesor',
    persona.nombre AS 'Nombre Profesor',
    departamento.nombre AS 'Nombre departament'
FROM
    universidad.persona
        iNNER JOIN
    universidad.profesor
        INNER JOIN
    universidad.departamento 
    ON persona.id = profesor.id_profesor AND profesor.id_departamento = departamento.id
WHERE Persona.tipo = 'profesor'
ORDER BY persona.apellido1 ASC , persona.apellido2 ASC , persona.nombre ASC;

-- 7) Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.

SELECT 
    asignatura.nombre AS 'Nombre Asignatura',
    curso_escolar.anyo_inicio AS 'Año de inicio',
    curso_escolar.anyo_fin AS 'Fín de año'
FROM
    universidad.asignatura
        INNER JOIN
    curso_escolar
        INNER JOIN
    persona
        INNER JOIN
    alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
        AND alumno_se_matricula_asignatura.id_asignatura = asignatura.id
        AND alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE
    persona.nif = '26902806M';
    
-- 8) Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). 

SELECT DISTINCT
    departamento.nombre AS 'Nombre Departament'
FROM
    universidad.departamento
        INNER JOIN
    universidad.profesor ON departamento.id = profesor.id_departamento    
        INNER JOIN
    universidad.asignatura  ON profesor.id_profesor =  asignatura.id_profesor
        INNER JOIN
    universidad.grado ON asignatura.id_grado= grado.id
WHERE
    grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
    
-- 9) Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.

SELECT DISTINCT
    persona.nif AS 'NIF Alumno',
    persona.nombre AS 'Nombre Alumno',
    persona.apellido1 AS 'Apellido Alumno'
FROM
    universidad.persona
        INNER JOIN
    alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
        INNER JOIN
    asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
        INNER JOIN
    curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE
    persona.tipo = 'alumno'
        AND (curso_escolar.anyo_inicio = 2018
        AND curso_escolar.anyo_fin = 2019);
    
    
-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1) Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.


        

