USE tienda;
/*1.Llista el nom de tots els productes que hi ha en la taula producto.*/
SELECT nombre FROM producto;
/*2.Llista els noms i els preus de tots els productes de la taula producto*/
SELECT nombre, precio FROM producto;
/*3.Llista totes les columnes de la taula producto.*/
DESCRIBE producto;
/*4.Llista totes les columnes de la taula producto. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).*/
SELECT nombre, precio, precio*1.05 FROM producto;
/*5.Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.*/
SELECT nombre AS 'nom de producto', precio AS 'euros', precio*1.05 AS 'dòlars' FROM producto;
/*6.Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.*/
SELECT UPPER(nombre), precio FROM producto;
/*7.Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.*/
SELECT LOWER(nombre), precio FROM producto;
/*8.Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
/*9.Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.*/
SELECT nombre, ROUND(precio) FROM producto;
/*10.Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
/*11.Llista el codi dels fabricants que tenen productes en la taula producto.*/
SELECT codigo_fabricante FROM producto;
/*12.Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.*/
SELECT DISTINCT codigo_fabricante FROM producto; 
/*13.Llista els noms dels fabricants ordenats de manera ascendent.*/
SELECT nombre FROM fabricante ORDER BY nombre;
/*14.Llista els noms dels fabricants ordenats de manera descendent.*/
SELECT nombre FROM fabricante ORDER BY nombre DESC;
/*15.Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.*/
SELECT nombre, precio FROM producto ORDER BY nombre, precio DESC;
/*16.Retorna una llista amb les 5 primeres files de la taula fabricante.*/
SELECT * FROM fabricante LIMIT 5;
/*17.Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
SELECT * FROM fabricante LIMIT 3, 2;
/*18.Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.*/
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
/*19.Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*20.Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
/*21.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.*/
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*22.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.*/
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
/*23.Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.*/
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*24.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.*/
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio LIMIT 1;
/*25.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.*/
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
/*26.Retorna una llista de tots els productes del fabricant Lenovo.*/
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
/*27.Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.*/
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
/*28.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.*/
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
/*29.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN*/
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ( 'Asus', 'Hewlett-Packard', 'Seagate');
/*30.Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e*/
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
/*31.Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.*/
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
/*32.Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).*/
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre;
/*33.Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.*/
SELECT fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*34.Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.*/
SELECT fabricante.*, producto.* FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
/*35.Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.*/
SELECT fabricante.* FROM producto RIGHT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;
/*36.Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).*/
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
/*37.Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).*/
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
/*38.Llista el nom del producte més car del fabricant Lenovo.*/
SELECT nombre FROM producto WHERE codigo = (SELECT codigo FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1);
/*39.Llista el nom del producte més barat del fabricant Hewlett-Packard.*/
SELECT nombre FROM producto WHERE codigo = (SELECT codigo FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio LIMIT 1);
/*40.Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.*/
SELECT producto.* FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
/*41.Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.*/
SELECT producto.* FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus')) AND fabricante.nombre = 'Asus';
/*tabla universidad*/
USE universidad;
/*1.Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/*2.Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
/*3.Retorna el llistat dels alumnes que van néixer en 1999.*/
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN CAST('1999-01-01' AS DATE) AND CAST('1999-12-31' AS DATE);
/*4.Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
/*5.Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7;
/*6.Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido1, persona.nombre;
/*7.Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM alumno_se_matricula_asignatura JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE alumno_se_matricula_asignatura.id_alumno = id_alumno = (SELECT id FROM persona WHERE nif = '26902806M');
/*8.Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
SELECT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/*9.Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
SELECT persona.* FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE alumno_se_matricula_asignatura.id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018);
/*1.Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
/*2.Retorna un llistat amb els professors/es que no estan associats a un departament.*/
SELECT persona.* FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL;
/*3.Retorna un llistat amb els departaments que no tenen professors/es associats.*/
SELECT departamento.* FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
/*4.Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/
SELECT persona.* FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
/*5.Retorna un llistat amb les assignatures que no tenen un professor/a assignat.*/
SELECT asignatura.* FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
/*6.Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/
SELECT  departamento.* FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar RIGHT JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor RIGHT JOIN departamento ON departamento.id = profesor.id_departamento  GROUP BY departamento.id HAVING COUNT(curso_escolar.id) = 0;
/*1.Retorna el nombre total d'alumnes que hi ha.*/
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno';
/*2.Calcula quants alumnes van néixer en 1999.*/
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN CAST('1999-01-01' AS DATE) AND CAST('1999-12-31' AS DATE);
/*3.Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
SELECT departamento.nombre, COUNT(profesor.id_departamento) AS 'nombre professors' FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY COUNT(profesor.id_departamento) DESC;
/*4.Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.*/
SELECT departamento.nombre, COUNT(profesor.id_departamento) AS 'nombre professors' FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.id ORDER BY COUNT(profesor.id_departamento) DESC;
/*5.Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
SELECT grado.nombre, COUNT(asignatura.id_grado) AS 'nombre assignatures' FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id ORDER BY COUNT(asignatura.id) DESC;
/*6.Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.*/
SELECT grado.nombre, COUNT(asignatura.id_grado) AS 'nombre assignatures' FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id HAVING COUNT(asignatura.id) > 40;
/*7.Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.*/
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id, asignatura.tipo;
/*8.Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.*/
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_curso_escolar) FROM alumno_se_matricula_asignatura JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.id;
/*9.Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.*/
SELECT profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) FROM profesor JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor GROUP BY profesor.id_profesor ORDER BY COUNT(asignatura.id_profesor) DESC;
/*10.Retorna totes les dades de l'alumne/a més jove.*/
SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = "alumno");
/*11.Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.*/
SELECT persona.* FROM persona JOIN profesor ON profesor.id_profesor = persona.id JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor GROUP BY profesor.id_profesor HAVING COUNT(asignatura.id_profesor) = 0;