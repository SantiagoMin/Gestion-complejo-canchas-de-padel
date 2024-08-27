USE proyecto_padel;


DELIMITER //

DROP PROCEDURE IF  EXISTS verificar_telefono;

CREATE PROCEDURE verificar_telefono(p_telefono VARCHAR(20))
BEGIN
    IF CHAR_LENGTH(p_telefono) < 9 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de teléfono debe tener al menos 9 dígitos';
    END IF;
END //

DELIMITER ;



DELIMITER //

DROP PROCEDURE IF  EXISTS obtener_disponibilidad_cancha;

CREATE PROCEDURE obtener_disponibilidad_cancha(
    IN p_id_cancha INT, 
    IN p_fecha_inicio DATETIME, 
    IN p_fecha_fin DATETIME
)
BEGIN
    -- Suponiendo que solo deseas ver la disponibilidad para la cancha en general, sin fecha específica
    SELECT id_turno, disponibilidad
    FROM DISPONIBILIDAD
    WHERE id_cancha = p_id_cancha
      AND disponibilidad = TRUE;
END //

DELIMITER ;

-- PRUEBA

CALL obtener_disponibilidad_cancha(2, '2023-07-01 00:00:00', '2025-07-02 23:59:59');

