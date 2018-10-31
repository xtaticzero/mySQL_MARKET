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
INSERT EMISORA(nombre,fechaEntrada) VALUES('AMX',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('BIMBO',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('CEMEX',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('FEMSA',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('GFNORTE',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('GMEXICO',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('KIMBER',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('NAFTRAC',SYSDATE());
INSERT EMISORA(nombre,fechaEntrada) VALUES('WALMEX',SYSDATE());


--COSTOS VECTOR
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(15.22,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'AMX'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(40.2,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'BIMBO'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(15.34,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'CEMEX'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(126.4,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'FEMSA'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(91.36,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'GFNORTE'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(43.23,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'GMEXICO'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(37.08,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'KIMBER'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(42.68,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'NAFTRAC'));
INSERT COTIZACION_DIARIA(costo_al_dia,diaCotizacion,emisora_id) VALUES(34.26,'2013-12-31',(SELECT EMI.emisora_id FROM EMISORA EMI WHERE nombre = 'WALMEX'));

--MOVIMIENTOS
INSERT MOVIMIENTO(descripcion) VALUES('COMPRA');
INSERT MOVIMIENTO(descripcion) VALUES('VENTA');
                                                                                  
--CAPITAL
INSERT INTO CAPITAL (montoEntrada, montoSalida, diaMovimiento) VALUES (1500,0,sysdate());

--INDICE IPC
INSERT INTO STOCK_MARKET_BBDD.INDICE_COTIZACION (valorIPC, porcentajeCotizacion, diaMovimiento )
VALUES(49354.42,0.010079010370853,'2017-12-29');
INSERT INTO STOCK_MARKET_BBDD.INDICE_COTIZACION (valorIPC, porcentajeCotizacion, diaMovimiento )
VALUES(50033.95,0.010079010370853,'2018-01-02');
INSERT INTO STOCK_MARKET_BBDD.INDICE_COTIZACION (valorIPC, porcentajeCotizacion, diaMovimiento )
VALUES(49782.23,0.010079010370853,'2018-01-03');
INSERT INTO STOCK_MARKET_BBDD.INDICE_COTIZACION (valorIPC, porcentajeCotizacion, diaMovimiento )
VALUES(49744.62,0.010079010370853,'2018-01-04');
INSERT INTO STOCK_MARKET_BBDD.INDICE_COTIZACION (valorIPC, porcentajeCotizacion, diaMovimiento )
VALUES(49887.74,0.010079010370853,'2018-01-05');

                                                                                  
