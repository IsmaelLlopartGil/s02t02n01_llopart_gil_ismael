USE universidad;

/*UNIVERSIDAD*/
select p.apellido1, p.apellido2, p.nombre from persona p where p.tipo='alumno' order by p.apellido1 asc, p.apellido2 asc, p.nombre asc;
select  p.nombre, p.apellido1, p.apellido2 from persona p where p.tipo='alumno' and p.telefono is null;
select * from persona p where p.tipo='alumno' and year(p.fecha_nacimiento) = 1999;
select * from persona p where p.tipo='profesor' and p.telefono is null and p.nif like '%K';
select * from asignatura where cuatrimestre=1 and curso=3  and id_grado=7;

select pe.apellido1, pe.apellido2, pe.nombre, d.nombre as Departamento from persona pe inner join profesor pr on pr.id_profesor=pe.id inner join departamento d on d.id=pr.id_departamento  order by pe.apellido1 asc, pe.apellido2 asc, pe.nombre asc;
select a.nombre, ce.anyo_inicio, ce.anyo_fin from persona pe inner join alumno_se_matricula_asignatura ama on ama.id_alumno=pe.id inner join curso_escolar ce on ce.id=ama.id_curso_escolar inner join asignatura a on a.id=id_asignatura where pe.nif='26902806M';
select d.nombre from departamento d left join profesor p on p.id_departamento=d.id left join asignatura asi on asi.id_profesor=p.id_profesor left join grado g on g.id=asi.id_grado where g.nombre='Grado en Ingeniería Informática (Plan 2015)' group by d.nombre;
select * from persona per left join alumno_se_matricula_asignatura ama on ama.id_alumno=per.id left join curso_escolar ces on ces.id=ama.id_curso_escolar  where ces.anyo_inicio=2018 group by per.id;

/*LEFT JOIN i RIGHT JOIN*/
select  dep.nombre as 'Nom del departament', per.apellido1 as 'Primer cognom', per.apellido2 as 'Segon cognom', per.nombre as 'nom del professor/a' from persona per left join profesor pro on pro.id_profesor=per.id left join departamento dep on dep.id=pro.id_departamento where per.tipo='profesor' order by dep.nombre asc, per.apellido1 asc, per.apellido2 asc, per.nombre asc;
select * from persona per where per.id not in (select per2.id from persona per2 right join profesor pro on pro.id_profesor=per2.id) and per.tipo='profesor';
select * from departamento dep where dep.id not in (select dep2.id from departamento dep2 right join profesor pro on pro.id_departamento=dep2.id);
select per.* from persona per left join profesor pro on pro.id_profesor=per.id left join asignatura asi on asi.id_profesor=pro.id_profesor where per.tipo='profesor' and asi.id_profesor is null group by per.id;
select * from asignatura asi where asi.id_profesor is null;

select * from departamento dep left join profesor pro on pro.id_departamento=dep.id left join asignatura asi on asi.id_profesor=pro.id_profesor where asi.id is null group by dep.id;

/*CONSULTES RESUM*/
select count(distinct ama.id_alumno) as 'Total d`alumnes' from alumno_se_matricula_asignatura ama ;
select count(per.id) as 'Nombre d`alumnes' from persona per where per.tipo='alumno' and year(fecha_nacimiento)=1999;
select dep.nombre, count(pro.id_profesor) as 'Nombre de professors/es'  from departamento dep inner join profesor pro on pro.id_departamento=dep.id group by dep.nombre order by count(dep.nombre) desc;
select dep.nombre, count(pro.id_profesor) as 'Nombre de professors/es'  from departamento dep left join profesor pro on pro.id_departamento=dep.id group by dep.nombre;
select g.nombre, count(a.id_grado) as 'Nombre d\'assignatures'  from grado g left join asignatura a on a.id_grado=g.id group by g.nombre;

select g.nombre, count(a.id_grado) as 'Nombre d\'assignatures'  from grado g left join asignatura a on a.id_grado=g.id group by g.nombre having count(a.id_grado)>40;
select g.nombre, a.tipo, sum(a.creditos) as  'Suma dels crèdits' from grado g inner join asignatura a on a.id_grado=g.id group by g.id, a.tipo;
select ce.anyo_inicio as 'Any d\'inici', count(distinct ama.id_alumno) as 'nombre d\'alumnes matriculats' from curso_escolar ce left join alumno_se_matricula_asignatura ama on ama.id_curso_escolar=ce.id group by ce.anyo_inicio;
select per.id, per.nombre, per.apellido1, per.apellido2, count(asi.id) as 'Nombre d\'assignatures' from persona per inner join profesor pro on pro.id_profesor=per.id left join asignatura asi on asi.id_profesor=pro.id_profesor group by per.id order by count(asi.id) desc; 
select p.* from persona p where p.tipo='alumno' order by p.fecha_nacimiento asc limit 1;  /* select p.*, min(p.fecha_nacimiento) from persona p where p.tipo='alumno'; */
select p.* from persona p where p.tipo='profesor' and p.id not in (select p2.id from persona p2 inner join profesor pr on pr.id_profesor=p2.id inner join asignatura a on a.id_profesor=pr.id_profesor);