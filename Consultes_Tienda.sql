USE mydb;

/*TIENDA*/
select Nombre from producto;
select Nombre, Precio from producto;
describe producto;
select Nombre , Precio , Precio*1.06 from producto;
select Nombre as 'Nom de producto' , Precio as Euros, ROUND(Precio*1.06, 2) as Dòlars from producto;

select upper(Nombre), Precio from producto;
select lower(Nombre), Precio from producto;
select Nombre, upper(substring(Nombre, 1, 2)) as Inicial from Fabricante;
select Nombre, round(Precio,2) as Precio from producto;
select Nombre, truncate(Precio,0) as Precio from producto;

select f.Nombre from fabricante f inner join producto p on f.codigo=p.codigo_fabricante;
select f.Nombre from fabricante f inner join producto p on f.codigo=p.codigo_fabricante group by f.nombre;
select nombre from fabricante order by nombre asc;
select nombre from fabricante order by nombre desc;
select nombre from producto order by nombre asc, precio desc;

select * from fabricante limit 5;
select * from fabricante limit 3, 2;
select nombre, precio from producto order by precio asc limit 1;
select nombre, precio from producto order by precio desc limit 1;
select p.nombre from fabricante f inner join producto p on f.codigo=p.codigo_fabricante where f.codigo=2;

select p.nombre as Producte, p.precio as Preu, f.nombre as Fabricant from producto p inner join fabricante f on f.codigo=p.codigo_fabricante;
select p.nombre as Producte, p.precio as Preu, f.nombre as Fabricant from producto p inner join fabricante f on f.codigo=p.codigo_fabricante order by f.nombre asc;
select p.codigo, p.nombre, f.codigo, f.nombre from producto p inner join fabricante f on f.codigo = p.codigo_fabricante;
select p.nombre, MIN(p.precio), f.nombre from producto p inner join fabricante f on f.codigo=p.codigo_fabricante;
select p.nombre, MAX(p.precio), f.nombre from producto p inner join fabricante f on f.codigo=p.codigo_fabricante;

select p.nombre, p.precio from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where f.nombre='Lenobo';
select p.nombre, p.precio from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where f.nombre='Crucial' and p.precio > 200;
select p.nombre, p.precio from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Asus' or f.nombre='Hewlett-Packard' or f.nombre='Seagate';
select p.nombre, p.precio from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
select p.nombre, p.precio from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where f.nombre like '%e';

select p.nombre, p.precio from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where f.nombre like '%w%';
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on f.codigo = p.codigo_fabricante where p.precio >= 180 order by p.precio desc, p.nombre asc;
select f.codigo, f.nombre from fabricante f inner join producto p on p.codigo_fabricante=f.codigo group by f.nombre;
select f.nombre as Fabricant, p.nombre as Producte from fabricante f left join producto p on p.codigo_fabricante=f.codigo;
select f.nombre as Fabricant from fabricante f where not exists (select null from producto p where p.codigo_fabricante=f.codigo);

select * from producto p where p.codigo_fabricante in (select f.codigo from fabricante f where f.nombre='Lenobo');
select * from producto where precio in (select max(p.precio) from producto p left join fabricante f on f.codigo=p.codigo_fabricante where f.nombre='Lenobo');
select p.nombre, MAX(p.precio) as Precio from producto p left join fabricante f on f.codigo=p.codigo_fabricante where f.nombre='Lenobo';
select p.nombre, MIN(p.precio) as Precio from producto p left join fabricante f on f.codigo=p.codigo_fabricante where f.nombre='Hewlett-Packard';
select * from producto where precio >= (select max(p.precio) from producto p left join fabricante f on f.codigo=p.codigo_fabricante where f.nombre='Lenobo');

select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on f.codigo = p.codigo_fabricante and f.nombre='Asus' where p.precio > (select avg(p.precio) from producto p left join fabricante f on f.codigo=p.codigo_fabricante where f.nombre='Asus');
