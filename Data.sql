--Data Application
USE STOCK_MARKET_BBDD;
--ROLES DEL APLICATIVO
INSERT ROL(descripcion) VALUES('ADMINISTRADOR');
INSERT ROL(descripcion) VALUES('OPERADOR');
--USUARIOS DEL APLICATIVO
INSERT INTO USERS (email, display_name, password, rol_id,fecha)
VALUES ('user@dominio.com', 'admin', MD5('admin123'), 1,SYSDATE());

INSERT INTO USERS (email, display_name, password, rol_id,fecha)
VALUES ('operador@dominio.com', 'operador', MD5('operador123'), 1,SYSDATE());
--COMISIONES DEL APLICATIVO
INSERT INTO COMISIONES(PORCENTAJE,DESCRIPCION) VALUES(0.00174,"Comisiones Casas de bolsa");

--EMISORAS
INSERT EMISORA(nombre,fechaEntrada) VALUES('ALFA',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('AMX',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('BIMBO',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('CEMEX',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('FEMSA',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('GENTERA',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('GFNORTE',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('GMEXICO',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('KIMBER',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('NAFTRAC',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('WALMEX',SYSDATE());
