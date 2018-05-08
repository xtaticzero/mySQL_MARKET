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

--Constraint DB
ALTER TABLE STOCK_MARKET_BBDD.USERS_HISTORY ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES STOCK_MARKET_BBDD.USERS(user_id);
ALTER TABLE STOCK_MARKET_BBDD.USERS ADD CONSTRAINT fk_rol_id FOREIGN KEY (rol_id) REFERENCES STOCK_MARKET_BBDD.ROL(rol_id);

--TRIGGERS
USE STOCK_MARKET_BBDD;

CREATE TRIGGER `Trg_Users_Historico` AFTER UPDATE ON USERS
FOR EACH ROW
BEGIN
    IF (NEW.email != OLD.email || NEW.display_name != OLD.display_name || NEW.password != OLD.password || NEW.user_id != OLD.user_id) THEN
    	INSERT INTO STOCK_MARKET_BBDD.USERS_HISTORY (email, display_name, password, fecha_movimiento,user_id )
	            VALUES (OLD.email,OLD.display_name,OLD.password,CURRENT_TIMESTAMP(), OLD.user_id);
    END IF;
END;

--ROLL BACK
REVOKE ALL PRIVILEGES STOCK_MARKET_BBDD.* FROM 'user_market'@'localhost';
DROP USER 'user_market'@'localhost';
DROP TRIGGER IF EXISTS STOCK_MARKET_BBDD.Trg_Users_Historico;
DROP DATABASE IF EXISTS STOCK_MARKET_BBDD;
