--Data Application
USE STOCK_MARKET_BBDD;
INSERT ROL(descripcion) VALUES('ADMINISTRADOR');
INSERT ROL(descripcion) VALUES('OPERADOR');

INSERT INTO USERS (email, display_name, password, rol_id,fecha)
VALUES ('user@dominio.com', 'admin', MD5('admin123'), 1,SYSDATE());

INSERT INTO USERS (email, display_name, password, rol_id,fecha)
VALUES ('operador@dominio.com', 'operador', MD5('operador123'), 1,SYSDATE());
