create database pruebas;

create table usuarios1 (
	name varchar(255),
    correo varchar(255)
);

use pruebas;

select count(totalCompra) from ventasservicios;

select avg(totalCompra) from ventasservicios;


select sum(totalCompra) from ventasservicios;

show tables from pruebas;