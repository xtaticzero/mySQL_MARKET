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

--COSTOS VECTOR
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'ALFA'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'AMX'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'BIMBO'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'CEMEX'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'FEMSA'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'GENTERA'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'GFNORTE'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'GMEXICO'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'KIMBER'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'NAFTRAC'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(1.0,SYSDATE(),(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'WALMEX'));

--MOVIMIENTOS
INSERT MOVIMIENTO(descripcion) VALUES('COMPRA');
INSERT MOVIMIENTO(descripcion) VALUES('VENTA');
                                                                                  
--CAPITAL
INSERT INTO CAPITAL (montoEntrada, montoSalida, diaMovimiento) VALUES (1500,0,sysdate());
                                                                                  
