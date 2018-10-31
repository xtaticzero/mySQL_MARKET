--Queries application
USE STOCK_MARKET_BBDD;
SELECT DATE_FORMAT(SYSDATE(), 'Emmanuel %Y-%m-%d');
/*INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);*/

INSERT INTO USERS (email, display_name, password, fecha)
VALUES ('user@dominio', 'admin', MD5('admin123'), SYSDATE());
commit;
--UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition; 
select * from USERS;
select * from USERS_HISTORY;
UPDATE USERS SET display_name = 'user_4_tmp' WHERE user_id = 1;
UPDATE USERS SET fechaTermino = SYSDATE() WHERE user_id = ?;

SELECT DATE_FORMAT((select fecha_movimiento from USERS_HISTORY where user_id = 1), 'Emmanuel %Y-%m-%d');

select *,DATE_FORMAT(fecha_movimiento, '%Y-%m-%d') AS niceDate  from USERS_HISTORY where user_id = 1;
SELECT DATE_FORMAT(fecha_movimiento, '%Y-%m-%d  %H:%i:%s') AS 'NAME' from USERS_HISTORY where user_id = 1;

select 
USR.user_id,
USR.email,
USR.display_name,
USR.password,
USR.fecha,
USR.fechaTermino,
USR.rol_id,
ROL.descripcion
from USERS USR
inner join ROL on USR.rol_id = ROL.rol_id
where 
USR.display_name = 'admin'
and 
USR.password = MD5('admin123');

USE STOCK_MARKET_BBDD;

select * from COTIZACION_DIARIA_HISTORY ORDER BY COTIZACION_HISTORY_ID DESC;
SELECT * FROM COTIZACION_DIARIA;

UPDATE COTIZACION_DIARIA SET costo_al_dia = 7.0,diaCotizacion = SYSDATE()
WHERE emisora_id = 1 AND COTIZACION_ID=1;

--- COTIZACION POR DIA
SELECT
EMI.nombre,
COT.costo_al_dia,
COT_H.costo_al_dia
FROM COTIZACION_DIARIA COT
INNER JOIN EMISORA EMI ON COT.emisora_id = EMI.emisora_id
LEFT JOIN COTIZACION_DIARIA_HISTORY COT_H ON COT.emisora_id = COT_H.emisora_id
WHERE COT.emisora_id = 1
AND
DATE_FORMAT(? - INTERVAL 1 DAY, '%Y-%m-%d 00:00:00') 
AND DATE_FORMAT(? - INTERVAL 1 DAY, '%Y-%m-%d 23:59:59') ORDER BY COT_H.diaCotizacion DESC LIMIT 1;

--- COTIZACION POR AÑO
SELECT
EMI.nombre,
COT.costo_al_dia,
COT_H.costo_al_dia
FROM COTIZACION_DIARIA COT
INNER JOIN EMISORA EMI ON COT.emisora_id = EMI.emisora_id
LEFT JOIN COTIZACION_DIARIA_HISTORY COT_H ON COT.emisora_id = COT_H.emisora_id
WHERE COT.emisora_id = ?
AND
DATE_FORMAT(?, '%Y-%m-%d 00:00:00') 
AND DATE_FORMAT(?, '%Y-%m-%d 23:59:59') ORDER BY COT_H.diaCotizacion ASC LIMIT 1;

select * from COTIZACION_DIARIA_HISTORY;
select * from COTIZACION_DIARIA;

SELECT 
COT_H.cotizacion_history_id,
COT.cotizacion_id,
COT_H.costo_al_dia,
COT.costo_al_dia,
COT_H.diaCotizacion,
COT.diaCotizacion,
COT.fecha_termino,
EMI.emisora_id,
EMI.nombre,
EMI.fechaEntrada,
EMI.fechaBaja
FROM COTIZACION_DIARIA_HISTORY COT_H
LEFT JOIN COTIZACION_DIARIA COT ON COT.cotizacion_id = COT_H.cotizacion_id
INNER JOIN EMISORA EMI ON COT_H.emisora_id = EMI.emisora_id
WHERE 1=1
AND 
EMI.emisora_id = 1
AND
(COT_H.diaCotizacion between  DATE_FORMAT((DATE_SUB(SYSDATE(), INTERVAL 1 YEAR) ) ,'%Y-01-01') AND SYSDATE() )
ORDER BY COT_H.diaCotizacion DESC;





