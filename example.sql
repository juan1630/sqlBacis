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