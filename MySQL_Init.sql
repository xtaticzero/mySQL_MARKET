SHOW VARIABLES LIKE "%version%";
CREATE DATABASE IF NOT EXISTS STOCK_MARKET_BBDD CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'user_market'@'localhost' IDENTIFIED BY 'Admin123';
GRANT CREATE ON STOCK_MARKET_BBDD.* TO 'user_market'@'localhost';
GRANT INSERT ON STOCK_MARKET_BBDD.* TO 'user_market'@'localhost';
GRANT SELECT ON STOCK_MARKET_BBDD.* TO 'user_market'@'localhost';
GRANT UPDATE ON STOCK_MARKET_BBDD.* TO 'user_market'@'localhost';

CREATE TABLE STOCK_MARKET_BBDD.USERS (
  user_id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(80) NOT NULL,
  display_name VARCHAR(50) NOT NULL,
  password CHAR(41) NOT NULL,
  fecha DATETIME NOT NULL,
  fechaTermino DATETIME,
  rol_id INT NOT NULL,
  PRIMARY KEY (user_id),
  UNIQUE INDEX (email)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.USERS_HISTORY (
  user_history_id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(80) NOT NULL,
  display_name VARCHAR(50) NOT NULL,
  password CHAR(41) NOT NULL,
  PRIMARY KEY (user_history_id),
  fecha_movimiento DATETIME NOT NULL,
  user_id INT NOT NULL  
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.ROL (
  rol_id INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(50) NOT NULL,
  fechaTermino DATETIME,
  PRIMARY KEY (rol_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.COMISIONES (
  comision_id INT NOT NULL AUTO_INCREMENT,
  porcentaje DOUBLE NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  PRIMARY KEY (comision_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.MOVIMIENTO (
  movimiento_id INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(90) NOT NULL,
  PRIMARY KEY (movimiento_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.ACCION (
  accion_id INT NOT NULL AUTO_INCREMENT,
  fechaCompra DATETIME NOT NULL,
  fechaVenta DATETIME,
  costoUnitario DOUBLE NOT NULL,
  existencia INT NOT NULL,
  PRIMARY KEY (accion_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.EMISORA (
  emisora_id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  fechaEntrada DATETIME NOT NULL,
  fechaBaja DATETIME,
  PRIMARY KEY (emisora_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.CAPA (
  capa_id INT NOT NULL AUTO_INCREMENT,
  emisora_id INT NOT NULL,
  activo BOOL NOT NULL,
  PRIMARY KEY (capa_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.CAPA_ACCION (
  ca_id INT NOT NULL AUTO_INCREMENT,
  accion_id INT NOT NULL,
  capa_id INT NOT NULL,	
  PRIMARY KEY (ca_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.TRANSACCION (
  transaccion_id INT NOT NULL AUTO_INCREMENT,
  ca_id INT NOT NULL,
  movimiento_id INT NOT NULL,
  fechaTransaccion DATETIME NOT NULL,
  cantidad INT NOT NULL,
  costoUnitario DOUBLE NOT NULL,
  total DOUBLE NOT NULL,
  utilidad DOUBLE NOT NULL,
  porcentajeMovimiento DOUBLE NOT NULL,
  PRIMARY KEY (transaccion_id)
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.COTIZACION_DIARIA (
  cotizacion_id INT NOT NULL AUTO_INCREMENT,
  costo_al_dia DOUBLE NOT NULL,
  diaCotizacion DATETIME NOT NULL,
  indiceCotizacion DOUBLE,
  fecha_termino DATETIME,
  emisora_id INT NOT NULL,
  PRIMARY KEY (cotizacion_id)  
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.COTIZACION_DIARIA_HISTORY (
  cotizacion_history_id INT NOT NULL AUTO_INCREMENT,
  costo_al_dia DOUBLE NOT NULL,
  diaCotizacion DATETIME NOT NULL,
  indiceCotizacion DOUBLE,
  cotizacion_id INT NOT NULL,
  emisora_id INT NOT NULL,
  PRIMARY KEY (cotizacion_history_id)  
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.CAPITAL (
  capital_id INT NOT NULL AUTO_INCREMENT,
  montoEntrada DOUBLE,
  montoSalida DOUBLE,
  diaMovimiento DATETIME NOT NULL,
  PRIMARY KEY (capital_id)  
) ENGINE=INNODB;

CREATE TABLE STOCK_MARKET_BBDD.INDICE_COTIZACION (
  indiceCotizacion_id INT NOT NULL AUTO_INCREMENT,
  valorIPC DOUBLE NOT NULL,
  porcentajeCotizacion DOUBLE DEFAULT 0.0,
  diaMovimiento DATETIME NOT NULL,
  PRIMARY KEY (indiceCotizacion_id)  
) ENGINE=INNODB;

--Constraint DB
ALTER TABLE STOCK_MARKET_BBDD.USERS_HISTORY ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES STOCK_MARKET_BBDD.USERS(user_id);
ALTER TABLE STOCK_MARKET_BBDD.USERS ADD CONSTRAINT fk_rol_id FOREIGN KEY (rol_id) REFERENCES STOCK_MARKET_BBDD.ROL(rol_id);
ALTER TABLE STOCK_MARKET_BBDD.CAPA ADD CONSTRAINT fk_emisoroid_capa FOREIGN KEY (emisora_id) REFERENCES STOCK_MARKET_BBDD.EMISORA(emisora_id);
ALTER TABLE STOCK_MARKET_BBDD.TRANSACCION ADD CONSTRAINT fk_caid_transaccion FOREIGN KEY (ca_id) REFERENCES STOCK_MARKET_BBDD.CAPA_ACCION(ca_id);
ALTER TABLE STOCK_MARKET_BBDD.TRANSACCION ADD CONSTRAINT fk_movimientoid_transaccion FOREIGN KEY (movimiento_id) REFERENCES STOCK_MARKET_BBDD.MOVIMIENTO(movimiento_id);
ALTER TABLE STOCK_MARKET_BBDD.CAPA_ACCION ADD CONSTRAINT fk_accionid_ca FOREIGN KEY (accion_id) REFERENCES STOCK_MARKET_BBDD.ACCION(accion_id);
ALTER TABLE STOCK_MARKET_BBDD.CAPA_ACCION ADD CONSTRAINT fk_capaid_ca FOREIGN KEY (capa_id) REFERENCES STOCK_MARKET_BBDD.CAPA(capa_id);
ALTER TABLE STOCK_MARKET_BBDD.COTIZACION_DIARIA_HISTORY ADD CONSTRAINT fk_cot_id FOREIGN KEY (cotizacion_id) REFERENCES STOCK_MARKET_BBDD.COTIZACION_DIARIA(cotizacion_id);
ALTER TABLE STOCK_MARKET_BBDD.COTIZACION_DIARIA_HISTORY ADD CONSTRAINT fk_cot_capa FOREIGN KEY (emisora_id) REFERENCES STOCK_MARKET_BBDD.EMISORA(emisora_id);

--TRIGGERS
USE STOCK_MARKET_BBDD;
--history user
CREATE TRIGGER `Trg_Users_Historico` AFTER UPDATE ON STOCK_MARKET_BBDD.USERS
FOR EACH ROW
BEGIN
    IF (NEW.email != OLD.email || NEW.display_name != OLD.display_name || NEW.password != OLD.password || NEW.user_id != OLD.user_id) THEN
    	INSERT INTO STOCK_MARKET_BBDD.USERS_HISTORY (email, display_name, password, fecha_movimiento,user_id )
	            VALUES (OLD.email,OLD.display_name,OLD.password,CURRENT_TIMESTAMP(), OLD.user_id);
    END IF;
END;
--
USE STOCK_MARKET_BBDD;
--history cotizacion
USE STOCK_MARKET_BBDD;
--history cotizacion
CREATE TRIGGER `Trg_Cotizacion_Historico` AFTER UPDATE ON STOCK_MARKET_BBDD.COTIZACION_DIARIA
FOR EACH ROW
BEGIN
    IF NEW.costo_al_dia <> OLD.costo_al_dia || NEW.diaCotizacion <> OLD.diaCotizacion THEN  
            INSERT INTO STOCK_MARKET_BBDD.COTIZACION_DIARIA_HISTORY (costo_al_dia, diaCotizacion, indiceCotizacion,cotizacion_id,emisora_id ) 
            VALUES( OLD.costo_al_dia, OLD.diaCotizacion, OLD.indiceCotizacion,OLD.cotizacion_id, OLD.emisora_id );
    END IF;
END;

--IPC cotizacion
CREATE TRIGGER `Trg_IPC_Historico`
BEFORE INSERT
   ON STOCK_MARKET_BBDD.INDICE_COTIZACION FOR EACH ROW

BEGIN
    DECLARE ipc_value DOUBLE;
    DECLARE porcentage DOUBLE;
    
    (SELECT IND_COT.valorIPC INTO ipc_value FROM INDICE_COTIZACION IND_COT ORDER BY indiceCotizacion_id DESC LIMIT 1);
    (SELECT ((NEW.valorIPC - ipc_value)/ipc_value) INTO porcentage);
    
    SET new.porcentajeCotizacion = porcentage; 
END;

  

--ROLL BACK
REVOKE ALL PRIVILEGES STOCK_MARKET_BBDD.* FROM 'user_market'@'localhost';
DROP USER 'user_market'@'localhost';
DROP TRIGGER IF EXISTS STOCK_MARKET_BBDD.Trg_Users_Historico;
DROP TRIGGER IF EXISTS STOCK_MARKET_BBDD.Trg_Cotizacion_Historico;
DROP TRIGGER IF EXISTS STOCK_MARKET_BBDD.Trg_IPC_Historico;
DROP TABLE IF EXISTS INDICE_COTIZACION;
DROP DATABASE IF EXISTS STOCK_MARKET_BBDD;

