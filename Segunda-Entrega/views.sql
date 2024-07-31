
-- CREO VISTAS PARA DISTINTAS FUNCIONALIDADES

USE proyecto_padel;

DROP VIEW IF EXISTS top_10_clientes_ventas;

CREATE  OR REPLACE VIEW top_10_clientes_ventas AS
SELECT 
    r.id_cliente,
    c.nombre,
    SUM(vp.cantidad) AS total_venta
FROM 
    RESERVA r
JOIN 
    VENTAS_PRODUCTOS vp ON r.id_reserva = vp.id_venta
JOIN 
    CLIENTE c ON r.id_cliente = c.id_cliente
GROUP BY 
    r.id_cliente, c.nombre
ORDER BY 
    total_venta DESC
LIMIT 10;

-- chequeo creacion
SELECT *
FROM TOP_10_CLIENTES_VENTAS;


DROP VIEW IF EXISTS ranking_clientes_reservas;

CREATE OR REPLACE VIEW ranking_clientes_reservas AS
SELECT 
    r.id_cliente,
    c.nombre,
    COUNT(r.id_reserva) AS total_reservas,
    ROW_NUMBER() OVER (ORDER BY COUNT(r.id_reserva) DESC) AS ranking
FROM 
    RESERVA r
JOIN 
    CLIENTE c 
    ON r.id_cliente = c.id_cliente
WHERE 
    r.estado = 'Confirmada'
GROUP BY 
    r.id_cliente, c.nombre
ORDER BY 
    total_reservas DESC;
  
-- chequeo creacion
select *
from ranking_clientes_reservas;
 
DROP VIEW IF EXISTS reactivacion_clientes;

-- Crearia un Schema para marketing y dentro de el crearia la view {marketing].reactivacion_clientes

 CREATE OR REPLACE VIEW reactivacion_clientes AS
SELECT
	c.id_cliente,
    c.nombre,
    c.correo,
    c.telefono,
    COUNT(r.id_reserva) AS cantidad_reservas
FROM
    CLIENTE c
LEFT JOIN
    RESERVA r ON c.id_cliente = r.id_cliente
GROUP BY
    c.id_cliente, c.correo, c.telefono
ORDER BY
    cantidad_reservas ASC
LIMIT 10;

-- chequeo creacion
select *
from reactivacion_clientes;
 
 DROP VIEW IF EXISTS gastos_por_mes;
 
 CREATE OR REPLACE VIEW gastos_por_mes AS
SELECT 
    DATE_FORMAT(fecha_gasto, '%Y-%m') AS mes,
    SUM(importe_factura) AS total_gastos,
    concepto_factura
FROM 
    GASTOS
GROUP BY 
    DATE_FORMAT(fecha_gasto, '%Y-%m'),concepto_factura
ORDER BY 
    mes;
  
-- chequeo creacion
select *
from gastos_por_mes;
 


-- Eliminar la vista si ya existe
DROP VIEW IF EXISTS vista_precios_referencia;

-- Crear la vista
CREATE VIEW vista_precios_referencia AS
SELECT 
    p.id_cancha,
    c.numero_cancha,
    c.tipo_cancha,
    c.numero_complejo,
    c.descripcion_complejo,
    c.direccion_complejo,
    p.precio_por_hora AS precio_original,
	p.precio_por_hora - (p.precio_por_hora * 0.10) AS precio_con_descuento_10,
    p.precio_por_hora - (p.precio_por_hora * 0.15) AS precio_con_descuento_15,
    p.precio_por_hora - (p.precio_por_hora * 0.20) AS precio_con_descuento_20
FROM 
    PRECIOS p
JOIN 
    CANCHA c ON p.id_cancha = c.id_cancha; 

SELECT *
FROM vista_precios_referencia

 
 
