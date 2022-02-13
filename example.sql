use cursoSql;

/*
	Comandos de seleccion simple
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