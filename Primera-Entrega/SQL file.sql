-- GENERACION DEL DDL

DROP DATABASE IF EXISTS proyecto_padel ; 

CREATE DATABASE proyecto_padel;

USE proyecto_padel;

-- Tabla 1 RESERVA
CREATE TABLE RESERVA (
    id_reserva INT AUTO_INCREMENT , 
    id_cliente INT,
    id_empleado INT,
    FECHA DATETIME,
    estado VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_reserva)
    COMMENT 'Registra las reservas realizadas por los clientes'
);

-- Tabla 2 CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT 'USUARIO_DESCONOCIDO',
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
	direccion VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (id_cliente)
    COMMENT 'Almacena información sobre los clientes que realizan reservas'
);

-- Tabla 3 EMPLEADO
CREATE TABLE EMPLEADO (
    id_empleado INT AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT 'EMPLEADO_DESCONOCIDO',
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
	direccion VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (id_empleado)
	COMMENT 'Contiene información sobre los empleados involucrados en el proceso de reservas y de atencion'
);


-- Tabla 4 DUEÑO
CREATE TABLE DUENO (
    id_dueno INT AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT 'DUENO_DESCONOCIDO',
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
	direccion VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (id_dueno)
    COMMENT 'Guarda datos sobre los dueños de los complejos (no se utiliza explícitamente en el proceso de reservas por la confidencialidad de la informacion)'
);

-- Tabla 5 TIPOCANCHA
CREATE TABLE TIPOCANCHA (
    id_tipo_cancha INT AUTO_INCREMENT,
    tipo_cancha VARCHAR(50),
    PRIMARY KEY (id_tipo_cancha)
    COMMENT 'Define diferentes tipos de cancha para clasificarlas según sus cualidades'
);

-- Tabla 6 CANCHA
CREATE TABLE CANCHA (
    id_cancha INT AUTO_INCREMENT,
    numero_cancha INT,
    tipo_cancha INT,
    numero_complejo VARCHAR(20),
    descripcion_complejo VARCHAR(100),
    direccion_complejo VARCHAR(100),
    dueno INT,
    PRIMARY KEY (id_cancha)
	COMMENT 'Almacena información sobre las cachas y complejos'
);

-- Tabla 7 DISPONIBILIDAD
CREATE TABLE DISPONIBILIDAD (
    id_turno INT AUTO_INCREMENT,
    id_reserva INT,
    id_cancha INT,
    disponibilidad BOOLEAN,
    PRIMARY KEY (id_turno)
    COMMENT 'Contiene información indicando los turnos existentes y la disponibilidad de los mismos, los turnos son de 30 minutos cada 1 y una reserva puede ocupar varios turnos'
);

-- Definimos las llaves foraneas

-- RESERVA
ALTER TABLE RESERVA
    ADD CONSTRAINT FK_reserva_empleado
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado);

-- RESERVA
ALTER TABLE RESERVA
    ADD CONSTRAINT FK_reserva_cliente
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente);

-- DISPONIBILIDAD
ALTER TABLE DISPONIBILIDAD
    ADD CONSTRAINT FK_disponibilidad_reserva
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva);

-- DISPONIBILIDAD
ALTER TABLE DISPONIBILIDAD
    ADD CONSTRAINT FK_disponibilidad_cancha
    FOREIGN KEY (id_cancha) REFERENCES CANCHA(id_cancha);

-- CANCHA
ALTER TABLE CANCHA
    ADD CONSTRAINT FK_cancha_dueno
    FOREIGN KEY (dueno) REFERENCES DUENO(id_dueno);

-- CANCHA
ALTER TABLE CANCHA
    ADD CONSTRAINT FK_cancha_tipo_cancha
    FOREIGN KEY (tipo_cancha) REFERENCES TIPOCANCHA(id_tipo_cancha);
    

