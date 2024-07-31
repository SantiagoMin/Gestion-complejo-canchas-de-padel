

USE proyecto_padel;

-- CREACION DE FUNCIONES PARA FACILITAR CIERTOS PROCESOS

-- VENTAS POR PRODUCTO

-- Cambiar el delimitador para manejar el bloque de la función
DELIMITER //

-- Eliminar la función si ya existe
DROP FUNCTION IF EXISTS ventas_por_producto;

-- Crear la función
CREATE FUNCTION ventas_por_producto(p_id_producto INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10, 2);

    -- Calcular la suma de las cantidades vendidas del producto especificado
    SELECT COALESCE(SUM(cantidad), 0) INTO total_ventas
    FROM VENTAS_PRODUCTOS
    WHERE id_producto = p_id_producto;

    RETURN total_ventas;
END //

-- Restablecer el delimitador
DELIMITER ;

SELECT  ventas_por_producto(1);

-- CHEQUEO
SELECT 
	SUM(CANTIDAD)
FROM VENTAS_PRODUCTOS
WHERE ID_PRODUCTO='1'

-- APLICAR DESCUENTOP PRECIO CANCHA

DELIMITER //

-- Eliminar la función si ya existe
DROP FUNCTION IF EXISTS aplicar_descuento_precio_cancha;

-- Crear la función
CREATE FUNCTION aplicar_descuento_precio_cancha(p_id_cancha INT, p_descuento DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE precio_original DECIMAL(10, 2);
    DECLARE precio_descuento DECIMAL(10, 2);

    -- Obtener el precio original de la cancha
    SELECT p.precio_por_hora
    INTO precio_original
    FROM PRECIOS p
    WHERE p.id_cancha = p_id_cancha;

    -- Aplicar el descuento al precio original
    SET precio_descuento = precio_original - (precio_original * p_descuento / 100);

    -- Devolver el precio después del descuento
    RETURN precio_descuento;
END //

-- Restablecer el delimitador
DELIMITER ;

SELECT aplicar_descuento_precio_cancha(1, 15) AS precio_con_descuento;

-- APLICAR DESCUENTO

DELIMITER //

DROP FUNCTION IF EXISTS aplicar_descuento;

CREATE FUNCTION aplicar_descuento(p_descuento DECIMAL(5, 2))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    -- Actualizar los precios con el descuento aplicado
    UPDATE PRECIOS
    SET precio_por_hora = precio_por_hora - (precio_por_hora * (p_descuento / 100));
    
    -- Devolver un mensaje de éxito
    RETURN CONCAT('Precios actualizados con un descuento del ', p_descuento, '%');
END //

DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

-- Llamar a la función para aplicar el descuento
SELECT aplicar_descuento(10);

-- Volver a activar el modo seguro
SET SQL_SAFE_UPDATES = 1;



