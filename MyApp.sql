--Queries application
USE STOCK_MARKET_BBDD;
SELECT DATE_FORMAT(SYSDATE(), 'Emmanuel %Y-%m-%d');
/*INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);*/

INSERT INTO USERS (email, display_name, password, fecha)
VALUES ('user@dominio', 'user_1', MD5('adasdqwe13243qewr'), SYSDATE());
commit;
--UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition; 
select * from USERS;
select * from USERS_HISTORY;
UPDATE USERS SET display_name = 'user_4_tmp' WHERE user_id = 1;
SELECT DATE_FORMAT((select fecha_movimiento from USERS_HISTORY where user_id = 1), 'Emmanuel %Y-%m-%d');

select *,DATE_FORMAT(fecha_movimiento, '%Y-%m-%d') AS niceDate  from USERS_HISTORY where user_id = 1;
SELECT DATE_FORMAT(fecha_movimiento, '%Y-%m-%d  %H:%i:%s') AS 'NAME' from USERS_HISTORY where user_id = 1;