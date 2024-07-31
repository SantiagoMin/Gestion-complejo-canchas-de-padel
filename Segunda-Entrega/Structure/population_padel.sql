
USE proyecto_padel;

-- Inserto datos en CLIENTE
INSERT INTO CLIENTE (nombre, telefono, correo, direccion, documento) VALUES
( 'Juan Pérez', '1234567890', 'juan.perez@example.com', 'Av. Libertador 123', '12345678A'),
('Ana Gómez', '0987654321', 'ana.gomez@example.com', 'Calle Mayor 456', '87654321B'),
('Luis Martínez', '1122334455', 'luis.martinez@example.com', 'Calle del Sol 789', '11223344C'),
('María López', '2233445566', 'maria.lopez@example.com', 'Calle de la Luna 321', '22334455D'),
( 'Carlos Ruiz', '3344556677', 'carlos.ruiz@example.com', 'Av. del Río 654', '33445566E'),
('Laura Martínez', '9988776655', 'laura.martinez@example.com', 'Calle del Mar 987', '99887766F'),
( 'Antonio García', '4455667788', 'antonio.garcia@example.com', 'Calle Nueva 159', '44556677G'),
( 'Elena Fernández', '5566778899', 'elena.fernandez@example.com', 'Plaza Mayor 753', '55667788H'),
('Roberto Torres', '6677889900', 'roberto.torres@example.com', 'Av. España 369', '66778899I'),
('Isabel González', '7788990011', 'isabel.gonzalez@example.com', 'Calle de la Paz 147', '77889900J'),
('María Fernández', '600123456', 'maria.fernandez@example.com', 'Calle del Reloj 12', 'B12345678'),
('Pedro Martínez', '600234567', 'pedro.martinez@example.com', 'Avenida de la Luz 45', 'C23456789'),
('Sofía López', '600345678', 'sofia.lopez@example.com', 'Plaza de la Estrella 7', 'D34567890'),
('Javier Gómez', '600456789', 'javier.gomez@example.com', 'Calle del Sol 21', 'E45678901'),
('Lucía Torres', '600567890', 'lucia.torres@example.com', 'Calle de la Luna 15', 'F56789012'),
('Miguel Ruiz', '600678901', 'miguel.ruiz@example.com', 'Av. del Norte 34', 'G67890123'),
('Laura Pérez', '600789012', 'laura.perez@example.com', 'Calle de la Paz 78', 'H78901234'),
('Antonio Jiménez', '600890123', 'antonio.jimenez@example.com', 'Avenida de la Libertad 89', 'I89012345'),
('Isabel Martínez', '600901234', 'isabel.martinez@example.com', 'Calle del Jardín 32', 'J90123456'),
('Carlos Fernández', '600012345', 'carlos.fernandez@example.com', 'Plaza Mayor 56', 'K01234567');


-- Inserto datos en EMPLEADO
INSERT INTO EMPLEADO (nombre, telefono, correo, direccion, documento) VALUES
('Pedro López', '2233445566', 'pedro.lopez@example.com', 'Av. San Martín 101', '22334455K'),
('María Fernández', '6677889900', 'maria.fernandez@example.com', 'Calle de la Luna 202', '66778899L'),
('Javier Díaz', '3344556677', 'javier.diaz@example.com', 'Calle del Sol 303', '33445566M'),
('Beatriz Romero', '9988776655', 'beatriz.romero@example.com', 'Av. del Río 404', '99887766N'),
('Ricardo López', '4455667788', 'ricardo.lopez@example.com', 'Calle Mayor 505', '44556677O'),
('Sofía Martínez', '5566778899', 'sofia.martinez@example.com', 'Plaza Mayor 606', '55667788P'),
('Luis Hernández', '6677889900', 'luis.hernandez@example.com', 'Av. Libertador 707', '66778899Q'),
('Gabriela Castro', '7788990011', 'gabriela.castro@example.com', 'Calle del Mar 808', '77889900R'),
('Héctor García', '8899001122', 'hector.garcia@example.com', 'Calle Nueva 909', '88990011S'),
('Pilar Fernández', '9900112233', 'pilar.fernandez@example.com', 'Av. España 1010', '99001122T');


-- Inserto datos en DUENO
INSERT INTO DUENO (nombre, telefono, correo, direccion, documento) VALUES
('Carlos Ruiz', '3344556677', 'carlos.ruiz@example.com', 'Calle del Mar 303', '33445566U'),
('Laura Martínez', '9988776655', 'laura.martinez@example.com', 'Av. del Río 404', '99887766V'),
('Alejandro Pérez', '2233445566', 'alejandro.perez@example.com', 'Calle Mayor 505', '22334455W'),
('Valeria Gómez', '6677889900', 'valeria.gomez@example.com', 'Calle Nueva 606', '66778899X');

-- Inserto datos en TIPOCANCHA
INSERT INTO TIPOCANCHA (tipo_cancha) VALUES
('Indoor'),
('Outdoor'),
('Grass'),
('Sintético'),
('Arcilla');

-- Inserto datos en CANCHA
INSERT INTO CANCHA (numero_cancha, tipo_cancha, numero_complejo, descripcion_complejo, direccion_complejo, dueno) VALUES
(1, 1, 'COMPLEJO_001', 'Cancha Indoor principal', 'Av. San Martín 101', 1),
(2, 2, 'COMPLEJO_002', 'Cancha Outdoor secundaria', 'Calle del Sol 789', 2),
(3, 3, 'COMPLEJO_003', 'Cancha Grass especial', 'Calle Mayor 456', 1),
(4, 4, 'COMPLEJO_004', 'Cancha Sintético central', 'Calle del Mar 123', 3),
(5, 5, 'COMPLEJO_005', 'Cancha Arcilla profesional', 'Av. del Río 654', 4),
(6, 1, 'COMPLEJO_006', 'Cancha Indoor secundaria', 'Calle Nueva 789', 1),
(7, 2, 'COMPLEJO_007', 'Cancha Outdoor auxiliar', 'Plaza Mayor 321', 2),
(8, 3, 'COMPLEJO_008', 'Cancha Grass estándar', 'Av. Libertador 987', 3),
(9, 4, 'COMPLEJO_009', 'Cancha Sintético profesional', 'Calle del Sol 654', 4),
(10, 5, 'COMPLEJO_010', 'Cancha Arcilla secundaria', 'Calle del Mar 321', 1);

-- Inserto datos en RESERVA
INSERT INTO RESERVA (id_cliente, id_empleado, FECHA, estado) VALUES
(1, 1, '2024-03-10 09:00:00', 'Confirmada'),
(2, 2, '2024-03-15 14:00:00', 'Cancelada'),
(3, 3, '2024-03-20 11:00:00', 'Confirmada'),
(4, 4, '2024-03-25 16:00:00', 'Pendiente'),
(5, 5, '2024-03-30 12:00:00', 'Confirmada'),
(6, 6, '2024-04-05 09:30:00', 'Confirmada'),
(7, 7, '2024-04-10 10:00:00', 'Cancelada'),
(8, 8, '2024-04-15 15:00:00', 'Confirmada'),
(9, 9, '2024-04-20 13:30:00', 'Pendiente'),
(10, 10, '2024-04-25 14:00:00', 'Confirmada'),
(11, 1, '2024-05-01 16:00:00', 'Confirmada'),
(12, 2, '2024-05-06 12:00:00', 'Cancelada'),
(13, 3, '2024-05-11 09:30:00', 'Confirmada'),
(14, 4, '2024-05-16 10:00:00', 'Pendiente'),
(15, 5, '2024-05-21 11:00:00', 'Confirmada'),
(16, 6, '2024-06-01 12:00:00', 'Cancelada'),
(17, 7, '2024-06-06 14:00:00', 'Confirmada'),
(18, 8, '2024-06-11 15:00:00', 'Pendiente'),
(19, 9, '2024-06-16 09:00:00', 'Confirmada'),
(20, 10, '2024-06-21 10:30:00', 'Confirmada'),
(1, 2, '2024-07-01 10:00:00', 'Confirmada'),
(2, 3, '2024-07-02 11:30:00', 'Pendiente'),
(3, 4, '2024-07-03 12:00:00', 'Cancelada'),
(4, 5, '2024-07-04 09:00:00', 'Confirmada'),
(5, 6, '2024-07-05 14:00:00', 'Confirmada'),
(6, 7, '2024-07-06 16:00:00', 'Pendiente'),
(7, 8, '2024-07-07 15:00:00', 'Cancelada'),
(8, 9, '2024-07-08 13:00:00', 'Confirmada'),
(9, 10, '2024-07-09 17:00:00', 'Confirmada'),
(10, 1, '2024-07-10 10:30:00', 'Pendiente'),
(11, 2, '2024-07-11 12:00:00', 'Confirmada'),
(12, 3, '2024-07-12 09:30:00', 'Cancelada'),
(13, 4, '2024-07-13 11:00:00', 'Confirmada'),
(14, 5, '2024-07-14 14:30:00', 'Pendiente'),
(15, 6, '2024-07-15 15:00:00', 'Confirmada'),
(16, 7, '2024-07-16 10:00:00', 'Cancelada'),
(17, 8, '2024-07-17 12:00:00', 'Confirmada'),
(1, 9, '2024-07-18 16:30:00', 'Pendiente'),
(1, 10, '2024-07-19 13:00:00', 'Confirmada'),
(2, 1, '2024-07-20 14:00:00', 'Cancelada'),
(2, 2, '2024-07-21 11:30:00', 'Confirmada'),
(2, 3, '2024-07-22 10:00:00', 'Pendiente'),
(3, 4, '2024-07-23 15:00:00', 'Confirmada'),
(4, 5, '2024-07-24 13:30:00', 'Cancelada'),
(5, 6, '2024-07-25 12:00:00', 'Confirmada'),
(6, 7, '2024-07-26 14:00:00', 'Pendiente'),
(7, 8, '2024-07-27 09:00:00', 'Confirmada'),
(2, 9, '2024-07-28 11:00:00', 'Cancelada'),
(2, 10, '2024-07-29 16:00:00', 'Confirmada'),
(3, 1, '2024-07-30 13:00:00', 'Pendiente');



-- Inserto datos en DISPONIBILIDAD
INSERT INTO DISPONIBILIDAD (id_reserva, id_cancha, disponibilidad) VALUES
(1, 1, TRUE),
(2, 2, FALSE),
(3, 3, TRUE),
(4, 4, TRUE),
(5, 5, FALSE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, FALSE),
(9, 9, TRUE),
(10, 10, TRUE);

-- Inserto datos en PRECIOS
INSERT INTO PRECIOS (id_cancha, precio_por_hora) VALUES
(1, 50.00),
(2, 40.00),
(3, 45.00),
(4, 55.00),
(5, 60.00),
(6, 50.00),
(7, 40.00),
(8, 45.00),
(9, 55.00),
(10, 60.00);

-- Inserto datos en PRODUCTOS
INSERT INTO PRODUCTOS (nombre_producto, descripcion_producto, precio) VALUES
('Pelota de Pádel', 'Pelota de pádel de alta calidad', 15.00),
('Raqueta de Pádel', 'Raqueta de pádel profesional', 120.00),
('Camiseta Deportiva', 'Camiseta ligera y transpirable', 25.00),
('Zapatillas de Pádel', 'Zapatillas especializadas para pádel', 80.00),
('Protector para Raqueta', 'Protector de goma para raquetas', 5.00),
('Bolas de Pádel', 'Bolsa con 3 bolas de pádel', 10.00),
('Gorra Deportiva', 'Gorra para jugadores de pádel', 12.00),
('Muñequera', 'Muñequera absorbente para el sudor', 7.00),
('Toalla Deportiva', 'Toalla compacta para entrenamiento', 8.00),
('Ropa Interior Deportiva', 'Ropa interior transpirable para deporte', 18.00);

-- Inserto datos en GASTOS
INSERT INTO GASTOS (numero_complejo, numero_factura, proveedor, concepto_factura, importe_factura, fecha_gasto) VALUES
('COMPLEJO_001', 'FAC-001', 'Proveedor A', 'Mantenimiento de canchas', 300.00, '2024-01-10 10:00:00'),
('COMPLEJO_002', 'FAC-002', 'Proveedor B', 'Compra de pelotas de pádel', 150.00, '2024-02-15 11:00:00'),
('COMPLEJO_003', 'FAC-003', 'Proveedor C', 'Reparación de redes', 200.00, '2024-03-20 12:00:00'),
('COMPLEJO_004', 'FAC-004', 'Proveedor D', 'Instalación de nuevo sistema de iluminación', 500.00, '2024-04-05 09:00:00'),
('COMPLEJO_005', 'FAC-005', 'Proveedor E', 'Compra de nuevas raquetas', 350.00, '2024-05-10 14:00:00'),
('COMPLEJO_006', 'FAC-006', 'Proveedor F', 'Reparación de sistemas de agua', 250.00, '2024-06-15 13:00:00'),
('COMPLEJO_007', 'FAC-007', 'Proveedor G', 'Instalación de nuevo sistema de iluminación', 600.00, '2024-07-30 08:30:00'),
('COMPLEJO_008', 'FAC-008', 'Proveedor H', 'Compra de nuevos balones', 210.00, '2024-08-10 09:30:00'),
('COMPLEJO_009', 'FAC-009', 'Proveedor I', 'Reparación de redes', 140.00, '2024-09-20 13:00:00'),
('COMPLEJO_010', 'FAC-010', 'Proveedor J', 'Mantenimiento de canchas', 250.00, '2024-10-15 15:30:00');

-- Inserto datos en VENTAS_PRODUCTOS
INSERT INTO VENTAS_PRODUCTOS (id_reserva, id_producto, cantidad) VALUES
(1, 1, 2),  -- 2 Pelotas de Pádel
(2, 2, 1),  -- 1 Raqueta de Pádel
(3, 3, 1),  -- 1 Camiseta Deportiva
(4, 4, 2),  -- 2 Zapatillas de Pádel
(5, 5, 1),  -- 1 Protector para Raqueta
(6, 6, 3),  -- 3 Bolas de Pádel
(7, 7, 1),  -- 1 Gorra Deportiva
(8, 8, 1),  -- 1 Muñequera
(9, 9, 2),  -- 2 Toallas Deportivas
(10, 10, 1), -- 1 Ropa Interior Deportiva
(11, 1, 2),  -- 2 Pelotas de Pádel
(12, 2, 1),  -- 1 Raqueta de Pádel
(13, 3, 1),  -- 1 Camiseta Deportiva
(14, 4, 2),  -- 2 Zapatillas de Pádel
(15, 5, 1),  -- 1 Protector para Raqueta
(16, 6, 3),  -- 3 Bolas de Pádel
(17, 7, 1),  -- 1 Gorra Deportiva
(18, 8, 1),  -- 1 Muñequera
(19, 9, 2),  -- 2 Toallas Deportivas
(20, 10, 1), -- 1 Ropa Interior Deportiva
(21, 1, 2),  -- 2 Pelotas de Pádel
(22, 2, 1),  -- 1 Raqueta de Pádel
(23, 3, 1),  -- 1 Camiseta Deportiva
(24, 4, 2),  -- 2 Zapatillas de Pádel
(25, 5, 1),  -- 1 Protector para Raqueta
(26, 6, 3),  -- 3 Bolas de Pádel
(27, 7, 1),  -- 1 Gorra Deportiva
(28, 8, 1),  -- 1 Muñequera
(29, 9, 2),  -- 2 Toallas Deportivas
(30, 10, 1); -- 1 Ropa Interior Deportiva

