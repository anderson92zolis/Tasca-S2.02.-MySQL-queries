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
SELECT 
    departamento.nombre AS 'nombre departamento',
    persona.apellido1 AS 'Primer Apellido Profesor',
    persona.apellido2 AS 'Segundo Apellido Profesor',
    persona.nombre AS 'Nombre Profesor'
FROM
    universidad.persona
        LEFT JOIN
    UNIVERSIDAD.profesor ON profesor.id_profesor = persona.id
        LEFT JOIN
    universidad.departamento ON departamento.id = profesor.id_departamento
WHERE
    persona.tipo = 'profesor'
ORDER BY departamento.nombre ASC , persona.apellido1 ASC , persona.apellido2 ASC , persona.nombre;

-- 2) Retorna un llistat amb els professors/es que no estan associats a un departament.

SELECT 
    persona.nombre AS 'Nombre Profesor',
    persona.apellido1 AS 'Primer Apellido Profesor'
FROM
    universidad.persona
        LEFT JOIN
    UNIVERSIDAD.profesor ON profesor.id_profesor = persona.id
WHERE
    persona.tipo = 'profesor'
        AND profesor.id_departamento IS NULL
ORDER BY persona.apellido1 ASC , persona.nombre ASC;

-- 3) Retorna un llistat amb els departaments que no tenen professors/es associats.

SELECT 
    departamento.nombre AS 'Nombre departamento'
FROM
    departamento
        LEFT JOIN
    profesor ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento IS NULL;

-- 4) Retorna un llistat amb els professors/es que no imparteixen cap assignatura.

SELECT 
    persona.nombre AS 'Nombre profesor'
FROM
    universidad.persona
        LEFT JOIN
    profesor ON profesor.id_profesor = persona.id
        LEFT JOIN
    universidad.asignatura ON asignatura.id_profesor = profesor.id_profesor
WHERE
	persona.tipo ='profesor'  AND
    asignatura.nombre IS NULL;  
    
-- 5) Retorna un llistat amb les assignatures que no tenen un professor/a assignat.

SELECT 
    DISTINCT asignatura.nombre AS 'Nombre asignatura'
FROM
    universidad.asignatura
        LEFT JOIN
    universidad.profesor ON profesor.id_profesor = asignatura.id_profesor
WHERE
    asignatura.id_profesor IS NULL;  
    
-- 6) Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

SELECT 
    distinct departamento.nombre AS 'Nombre departamento'
FROM
    universidad.departamento
        LEFT JOIN
    universidad.profesor ON profesor.id_departamento = departamento.id
        LEFT JOIN
    universidad.asignatura ON asignatura.id_profesor = profesor.id_profesor
WHERE
    asignatura.curso IS NULL;
    
-- Consultes resum:

-- 1) Retorna el nombre total d'alumnes que hi ha.
SELECT 
    COUNT(persona.nombre) AS 'Alumnos totales'
FROM
    universidad.persona
WHERE
    persona.tipo = 'alumno';
    
-- 2) Calcula quants alumnes van néixer en 1999.
 
 SELECT 
    COUNT(persona.nombre) AS 'Alumnos totales nacidos en 1999'
FROM
    universidad.persona
WHERE
    persona.tipo = 'alumno' AND year(fecha_nacimiento)=1999;

-- 3) Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.

SELECT 
    departamento.nombre AS 'Nombre de departamento',
    COUNT(profesor.id_departamento) AS 'Numero de profesores'
FROM
    universidad.departamento
        INNER JOIN
    universidad.profesor ON profesor.id_departamento = departamento.id
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_departamento) DESC;

-- 4) Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.  

SELECT 
    departamento.nombre AS 'Nombre de departamento',
    COUNT(profesor.id_departamento) AS 'Numero de profesores'
FROM
    universidad.departamento
        LEFT JOIN
    universidad.profesor ON profesor.id_departamento = departamento.id
GROUP BY departamento.nombre
ORDER BY COUNT(profesor.id_departamento) DESC;

-- 5) Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

SELECT 
    grado.nombre AS 'Nombre de grado',
    COUNT(asignatura.nombre) AS 'Numero de asignatura'
FROM
    universidad.grado
        LEFT JOIN
    universidad.asignatura ON  asignatura.id_grado  = grado.id 
GROUP BY grado.nombre
ORDER BY COUNT(asignatura.nombre) DESC;

-- 6) Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

SELECT 
    grado.nombre AS 'Nombre de grado',
    COUNT(asignatura.nombre) AS 'Numero de asignatura'
FROM
    universidad.grado
	INNER JOIN
    universidad.asignatura ON  asignatura.id_grado  = grado.id 
GROUP BY grado.nombre
HAVING COUNT(asignatura.nombre) > 40 ;

-- 7) Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus. 

SELECT 
    grado.nombre AS 'Nombre de grado',
    asignatura.tipo AS 'Tipo  de asignatura',
    SUM(asignatura.creditos) AS 'suma de creditos por asignatura'
FROM
    universidad.grado
        INNER JOIN
    universidad.asignatura ON asignatura.id_grado = grado.id
GROUP BY grado.nombre, asignatura.tipo
ORDER BY SUM(asignatura.creditos) DESC;

-- 8) Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.

SELECT 
    curso_escolar.anyo_inicio AS 'Año de inicio Curso escolar',
    COUNT(alumno_se_matricula_asignatura.id_curso_escolar) AS 'Número de alumnos matriculados'
FROM
    universidad.curso_escolar
        LEFT JOIN
    alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
        LEFT JOIN
    universidad.asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
GROUP BY curso_escolar.anyo_inicio;

-- 9) Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
 
SELECT 
    profesor.id_profesor AS 'Profesor ID',
    persona.nombre AS 'Nombre',
    persona.apellido1 AS 'Primer Apellido ',
    persona.apellido2 AS 'Segundo apellido',
    COUNT(asignatura.nombre) AS 'Número de asignatura que importe cada profesor'
FROM
    universidad.persona
        LEFT JOIN
    universidad.profesor ON profesor.id_profesor = persona.id
        LEFT JOIN
    universidad.asignatura ON asignatura.id_profesor = profesor.id_profesor
WHERE persona.tipo= 'profesor'
group by profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2
ORDER BY COUNT(asignatura.nombre) DESC;


-- 10) Retorna totes les dades de l'alumne/a més jove.

SELECT 
    *
FROM
    persona
WHERE
    persona.tipo = 'alumno'
        AND persona.fecha_nacimiento = (SELECT 
            MAX(fecha_nacimiento)
        FROM
            persona);
 
 
 -- 11) Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
 
SELECT 
    persona.nombre AS 'nombre profesor',
    departamento.nombre AS 'nombre departamento',
    asignatura.nombre AS 'nombre asignatura'
    
FROM
    persona
        LEFT JOIN
    profesor ON profesor.id_profesor = persona.id
        LEFT JOIN
    departamento ON departamento.id = profesor.id_departamento
        LEFT JOIN
    asignatura ON asignatura.id_profesor = profesor.id_profesor
WHERE
    persona.tipo='profesor' and asignatura.nombre IS NULL 
ORDER BY departamento.nombre ASC;
 
