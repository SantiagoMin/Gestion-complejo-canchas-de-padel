USE proyecto_padel;

-- GENERAR BLOCK PARA NUMEROS QUE NO SEAN CELULARES (URUGUAY XD)

DELIMITER //

DROP TRIGGER IF exists before_insert_cliente;

CREATE TRIGGER before_insert_cliente
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    CALL verificar_telefono(NEW.telefono);
END //

DELIMITER ;

DELIMITER //

DROP TRIGGER IF exists  before_update_cliente;

CREATE TRIGGER before_update_cliente
BEFORE UPDATE ON CLIENTE
FOR EACH ROW
BEGIN
    CALL verificar_telefono(NEW.telefono);
END //

DELIMITER ;

-- PROBAMOS CON ERROR LO CUAL ES EXITOSO PARA ESTOS TRIGGERS/PROCEDURE
INSERT INTO CLIENTE (nombre, telefono, correo, direccion, documento)
VALUES ('Ana Gómez', '12345678', 'ana@example.com', 'Avenida Siempre Viva 742', '87654321');


-- GENERAR AUTOMATICAMENTE UN HISTORIAL DE PRECIOS

DELIMITER //
DROP TRIGGER IF exists after_precio_update;

CREATE TRIGGER after_precio_update
AFTER UPDATE ON PRECIOS
FOR EACH ROW
BEGIN
    -- Insertar un registro en la tabla de historial
    INSERT INTO HISTORIAL_PRECIO (id_cancha, precio_antiguo, precio_nuevo, fecha_cambio)
    VALUES (
        OLD.id_cancha,           -- ID de la cancha afectada
        OLD.precio_por_hora,    -- Precio antiguo
        NEW.precio_por_hora,    -- Precio nuevo
        NOW()                    -- Fecha y hora del cambio
    );
END; //

DELIMITER ;

-- CHEQUEO

UPDATE PRECIOS
SET precio_por_hora = 60.00
WHERE id_cancha = 1;

SELECT * FROM HISTORIAL_PRECIO;

UPDATE PRECIOS
SET precio_por_hora = 50.00
WHERE id_cancha = 1;

SELECT * FROM HISTORIAL_PRECIO;

DELETE FROM HISTORIAL_PRECIO
WHERE ID_AUDITORIA IN ('1','2')
