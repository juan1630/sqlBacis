use cursoSql;

/*
    COMANNDOS DE SELECCION SIMPLE 
*/
select *  from CLIENTES;

select * from PRODUCTOS;
/*
    Solo muestra los datos seleciconados
*/


select empresa, poblaci_n  from CLIENTES;


/*
    CONSULTA CON SENTENCIA WHERE
    Ingresa un filtrado por el tipo de dato que se le pase
*/

SELECT  FECHA, SECCI_N, NOMBREART_CULO FROM PRODUCTOS WHERE SECCI_N='DEPORTES';

/*
    SENTENCIA WHERE CON OPERADORES LOGICOS
    El operador OR responde a la pregunata Y, es decir quiero los items de una seccion y la otra
    quiero ver los items de la seccion deportes y de la seccion ceramica
*/

SELECT  FECHA, SECCI_N, NOMBREART_CULO FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CONFECCI?N';



SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' AND PA_SDEORIGEN='USA';
/*
	Se usa el operador AND porque se quiere ver los articulos que sean unicamente de USA
*/


SELECT * FROM PRODUCTOS WHERE PRECIO=500000;
/*
	Trae los productos cuyo precio sea IGUAL a 500000
*/


SELECT * FROM PRODUCTOS WHERE PRECIO>=144;
/*
	Trae los productos cuyo precio sean MAYOR O IGUAL a 500000
*/



SELECT * FROM PRODUCTOS WHERE FECHA BETWEEN '2002-02-02' AND '2002-05-05';

/*
    Sentencia between ayuda a obtener rangos, en este caso es un rango de fechas pero si puede usar con otros tipos de datos
*/

/*
    Otra forma de hacer la misma consulta
*/


SELECT * FROM PRODUCTOS WHERE FECHA >= '2002-02-02' AND FECHA  <= '2002-05-05';



SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CER?MICA' ORDER BY SECCI_N;
/*
	La clausula order by orderna por el tipo de dato, si se trata de un tipo de dato de string ordena de forma alfabetica, si es de tipo de numerico por orden asendente
*/

SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CER?MICA' ORDER BY PA_SDEORIGEN;


SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CER?MICA' ORDER BY PA_SDEORIGEN DESC;
/*
    Ordenamos de manera descendente por medio de la sentencia DESC o de forma ascendente con ASNC
    podemos ordenar por diferentes campo un ejemplo puede ser el precio, fecha, color, etc.
*/


SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CER?MICA' ORDER BY NOMBREART_CULO  ASC;
/*
    Otro ejemplo de como se pueden order los campos
*/


SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CER?MICA' ORDER BY NOMBREART_CULO DESC, PRECIO ASC;
/*
    Ordenamos de forma descendente y por nombre del articulo, dentro de esa ordenacion ordenamos por precio de manera asnedente
*/


SELECT * FROM PRODUCTOS WHERE SECCI_N='DEPORTES' OR SECCI_N='CER?MICA' ORDER BY NOMBREART_CULO DESC, PRECIO ASC, PA_SDEORIGEN ASC;
/*
	Ordena por varios campos 
*/


SELECT SECCI_N, SUM( PRECIO ) FROM PRODUCTOS GROUP BY SECCI_N;
/*
	Ordena los registros por la seccion y de esos les saca la suma total de los productos
*/


SELECT SECCI_N, SUM( PRECIO ) AS SUMA_PRODUCTOS FROM PRODUCTOS GROUP BY SECCI_N ORDER BY SUMA_PRODUCTOS ASC;
/*
	EL AS agrega un alias a la columna 
*/


SELECT SECCI_N, AVG( PRECIO ) AS MEDIA_PRODUCTOS FROM PRODUCTOS GROUP BY SECCI_N  HAVING SECCI_N = 'DEPORTES' OR SECCI_N = 'OFICINA' ;


/**
	LA FUNCION AVG NOS TRAE LA MEDIA DE LOS ARTICULOS
*/

SELECT POBLACI_N  ,COUNT( C_DIGOCLIENTE ) AS NUMEROCLIENTES FROM CLIENTES  GROUP BY POBLACI_N ; 

/**
		La funcion count es igual a la fucnion avg y la funcion sum
*/



/**
    La funcion now nos devulve el dia y la hora a la que se ahce la consulta 
    Datediff nos devulev la diferencia que hay entre 2 fechas 
    Date_format nos permite formatear los resultados a mas legibles  
    Trucate 
    Concat permite concaenar las cadenas de texto
    Estas consultas se hace sobre registros individuales y no sobre grupos de datos
    */

select NOMBREART_CULO, PRECIO, SECCI_N, PRECIO*1.21 as precioIva from PRODUCTOS;
-- Ejecutamos la expresion matematica de multiplicar por el iva, para obtener el precio con el IVA


-- consulta con el round 
select NOMBREART_CULO, PRECIO, SECCI_N,ROUND (PRECIO*1.21, 2) as precioIva from PRODUCTOS;
--  redondea a 2 digitos en la consulta

select NOMBREART_CULO, PRECIO, SECCI_N ,PRECIO-3 as precioResta from PRODUCTOS;

--consulta con resta


-- palabra resevada union, se encarga de unir las dos tablas, estas consultas debe de cumplir con las siguinentes caracterisitcas:
    -- Deben de tener el mismo numero de campos en ambas tablas
    -- Tipos de datos compatibles deben de ser del mismo tipo de dato 
    --  las consultas se combinan 


SELECT * FROM PRODUCTOS WHERE SECCI_N = 'DEPORTES' UNION SELECT * FROM PRODUCTOS  WHERE SECCI_N = 'DEPORTES DE RIESGO';

SELECT * FROM PRODUCTOS WHERE PRECIO > 500 UNION SELECT * FROM PRODUCTOS WHERE SECCI_N = 'ALTA COSTURA';

-- la senetcia union si hay registrados repetidos no los muestra, el unionall, hace lo contrario 

lA CONSULTA INNER JOIN SOLO MUESTRA LOS DATOS QUE SE ENCUENTRAN REPETIDOS EN AMBAS TABLAS

SELECT * FROM CLIENTES INNER JOIN PEDIDOS ON CLIENTES.C_DIGOCLIENTE = PEDIDOS.C_DIGO_CLIENTE  WHERE POBLACI_N = 'MADRID' ;
-- ESPECIFICAMOS LA RELACION QUE HAY ENTRE LOS CAMPOS POR MEDIO DEL CODIGO CLIENTE


SELECT CLIENTES.C_DIGOCLIENTE, CLIENTES.POBLACI_N, CLIENTES.DIRECCI_N, PEDIDOS.C_DIGO_CLIENTE, PEDIDOS.FORMA_DE_PAGO FROM  CLIENTES INNER JOIN PEDIDOS ON CLIENTES.C_DIGOCLIENTE=PEDIDOS.C_DIGO_CLIENTE;
--INNER JOIN CON DATOS EN COMUN


SELECT CLIENTES.C_DIGOCLIENTE, CLIENTES.POBLACI_N, CLIENTES.DIRECCI_N, PEDIDOS.C_DIGO_CLIENTE, PEDIDOS.FORMA_DE_PAGO FROM  CLIENTES INNER JOIN PEDIDOS ON CLIENTES.C_DIGOCLIENTE=PEDIDOS.C_DIGO_CLIENTE WHERE POBLACI_N = 'MADRID' AND PEDIDOS.C_DIGO_CLIENTE IS NULL;


SELECT NOMBREART_CULO, SECCI_N FROM PRODUCTOS WHERE PRECIO < (SELECT AVG(PRECIO) AS PRECIOMEDIA FROM PRODUCTOS);
-- AVG NOS DEVULVE LA MEDIA Y DENTRO DE LOS PARENTESIS VA LA SYBCONSULTA
-- ESTE ES UN TIPO DE CONSULTA ESCALONADA , ESTE TIPO DE CONSULTA DEVUELVE UN DATO


SELECT * FROM PRODUCTOS WHERE PRECIO > ALL (SELECT PRECIO FROM PRODUCTOS WHERE SECCI_N = 'CER?MICA');
-- eL OPERADOR TRAE TODOS LOS REGISTROS SI LO CAMBIAMOS POR UN ANY 

SELECT * FROM PRODUCTOS WHERE PRECIO > ALL (SELECT PRECIO FROM PRODUCTOS WHERE SECCI_N = 'JUGUETER?A');

SELECT * FROM PRODUCTOS WHERE PRECIO > ANY (SELECT PRECIO FROM PRODUCTOS WHERE SECCI_N = 'JUGUETER?A');
--  TRAEMOS LOS PRODUCTOS QUE SEAN MAYOR A CUALQUIERA DE LOS DE LA SUBCONSULTA

SELECT * FROM PRODUCTOS WHERE  SECCI_N = 'DEPORTES';
UPDATE PRODUCTOS SET PRECIO = PRECIO -20 WHERE SECCI_N = 'DEPORTES';
-- ATULIZACIO DE LOS DATOS, EN ESTE CASO EL PRECIO

SELECT * INTO CLIENTES_MADRID FROM CLIENTES WHERE POBLACI_N = 'MADRID';

SELECT * FROM CLIENTES_MADRID;
-- CREAMOS UNA TABLA APARTIR DE OTRA 
--No es lo mismo el create table que el select into, ya que no especifica los tipos de datos de las tablas


/*
    convertir tipos de datos en SQL
        Para convertir un dtipo de dato en otro, se usa la sentencia CAST O CONVERT
*/


SELECT MAX( convert(totalCompra, DECIMAL) ) AS compraAlta FROM ventasservicios;	
-- Se usa el convert para convertir de un tipo text a un numero y obtener la venta mas alta 
SELECT MIN( convert(totalCompra, DECIMAL) ) AS compraAlta FROM ventasservicios;	
--Obtenemos la venta mas baja 



/*
    Queries de Sql para Horizonte 
*/



USE PRUEBAS;
SELECT * FROM ventasservicios;
SELECT * FROM ventasservicios ORDER BY folio;
SELECT SUM( totalCompra ) FROM ventasservicios;
select * from ventasservicios where _id LIKE '%61916b8be902aa2b84883b60%';

SELECT COUNT( compraConMembresia ) AS compraConMembresia FROM ventasservicios WHERE compraConMembresia = 'True';
SELECT COUNT( compraConMembresia )  AS TOTAL FROM ventasservicios; 


SELECT SUM( totalCompra ) FROM ventasservicios WHERE compraConMembresia = 'True';
SELECT SUM( totalCompra ) FROM ventasservicios WHERE compraConMembresia = 'False';

SELECT * FROM totalCompra;


SELECT SUM( convert(totalCompra, DECIMAL) ) AS total  FROM ventasservicios;


SELECT MAX( convert(totalCompra, DECIMAL) ) AS compraAlta FROM ventasservicios;	
SELECT MIN( convert(totalCompra, DECIMAL) ) AS compraAlta FROM ventasservicios;	

SELECT * FROM ventasservicios WHERE totalCompra = 165000;

SELECT totlaCompra FROM ventasservicios; 