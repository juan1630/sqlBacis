# SQL

## SQL es un lenguaje de consulta de datos, su nombre viene de la siglas en ingles (Strucutre Query Language)
- Existen varios gestores de bases de dato como lo son SQL server, MySql, Oracle, etc.

### COMANDOS DE SELECCION
    
- SELECT

    - consultas con clausula WHERE 
    - Consultas con los operadores logicos ( AND, OR)
    - Consultas con los operadores de comparacion ( >=, <=, >, <, = )
    - Conultas entre rangos de fechas o de otros tipos de datos con la sentencia BETWEEN
    - Consultas con ORDER BY
    - Consultas con ORDER BY por varios parametros de ordenacion
    - Consultas de agrupacion o totales
    - Consultas con la clausula where
    - Consultas con las fuciones (SUM, AVG, MIN Y MAX)
    - Consultas SQL fucniones frecuentes Now, dateDiff, date_format, conact, la funcion now en sqlserver no se usa, se usa la getDate
    - Las consultas multitabla, son aquellas que mandan a llamar amultiples tablas, tambien se les llama consultas de union y existen 2 tipos, al de union interna y union externa
    - inner join este tipo de join sirve para darnos los registros que exiten en las 2 tablas
    - Subconsultas se dividen en 3 grupos, las escalonadas, de lista y correclacionadas
        - Subconsultas es una consulta dentro de otra, en otras palabras un select dentro de otro select
            - Las consultas escalonadas solo regresan un registro
            -   Las consultas de lista devuelven un listado de registros