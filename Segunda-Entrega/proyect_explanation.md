## CREACION DE UNA BASE DE DATOS, INSUMO PARA UN DASHBOARD DE GESTION DE UN COMPLEJO DE PADEL


### Problema:

El proyecto se basa en el desarrollo de un sistema integral de gestión de reservas para un complejo de pádel, donde nos encontramos con el desafío de crear una base de datos eficiente que pueda gestionar de manera óptima todas las operaciones relacionadas con las reservas y a posteriori la compra de productos. La complejidad de un complejo de pádel con múltiples canchas, clientes, y empleados requiere una solución robusta que garantice un flujo de operaciones ágil y eficaz.

### Descripción del Problema:

1. **Gestión de Clientes y Empleados**: Necesitamos una base de datos que nos permita registrar la información de los clientes que realizan reservas, así como de los empleados involucrados en el proceso de las mismas. En esta segunda etapa incorporamos la compra de productos y la gestion de los precios.

2. **Gestión de Canchas y Disponibilidad**: La base de datos debe permitirnos registrar la disponibilidad de las canchas , para asi permitirnos realizar promociones puntuales en dias de baja demanda. Esto es fundamental para garantizar una asignación eficiente de las canchas y evitar conflictos de reservas, ya que la mayoria se encuentra en la periferia e incurriria en perdida de tiempo para el cliente.

3. **Registro de Reservas**: Necesitamos un sistema que pueda registrar de manera detallada cada reserva realizada, incluyendo la fecha y hora de la reserva, el cliente que la realizó, la cancha a utilizar y la cantidad de horas que utilizara las instalaciones, entre otras informaciones.

### Objetivo:

Diseñar e implementar una base de datos relacional que satisfaga todas las necesidades de gestión de reservas para complejos de padel. Esta base de datos deberá ser eficiente, escalable y fácil de mantener, permitiendo una gestión ágil y precisa de todas las operaciones relacionadas con las reservas.


## A continuacion detallaremos los componentes de nuestro modelo relacional

Esta base de datos está diseñada para gestionar reservas en complejos de padel, así como la información relacionada con clientes, empleados y canchas. A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **CLIENTE**
   - Almacena información sobre los clientes que realizan reservas.
   - Atributos:
     - `id_cliente`: Identificador único del cliente.
     - `nombre`: Nombre del cliente.
     - `telefono`: Número de teléfono del cliente.
     - `correo`: Correo electrónico del cliente.
     - `direccion`: Dirección del cliente.
     - `documento`: Documento de identificación del cliente (único).

2. **EMPLEADO**
   - Contiene información sobre los empleados involucrados en el proceso de reservas y de atención.
   - Atributos:
     - `id_empleado`: Identificador único del empleado.
     - `nombre`: Nombre del empleado.
     - `telefono`: Número de teléfono del empleado.
     - `correo`: Correo electrónico del empleado.
     - `direccion`: Dirección del empleado.
     - `documento`: Documento de identificación del empleado (único).

3. **DUEÑO**
   - Guarda datos sobre los dueños de los complejos (no se utiliza explícitamente en el proceso de reservas por la confidencialidad de la información).
   - Atributos:
     - `id_dueno`: Identificador único del dueño.
     - `nombre`: Nombre del dueño.
     - `telefono`: Número de teléfono del dueño.
     - `correo`: Correo electrónico del dueño.
     - `direccion`: Dirección del dueño.
     - `documento`: Documento de identificación del dueño (único).

4. **TIPO_CANCHA**
   - Define diferentes tipos de cancha para clasificarlas según sus cualidades.
   - Atributos:
     - `id_tipo_cancha`: Identificador único del tipo de cancha.
     - `tipo_cancha`: Descripción del tipo de cancha.

5. **CANCHA**
   - Almacena información sobre las canchas y los complejos.
   - Atributos:
     - `id_cancha`: Identificador único de la cancha.
     - `numero_cancha`: Número de la cancha.
     - `tipo_cancha`: Tipo de cancha (referencia a `TIPO_CANCHA`).
     - `numero_complejo`: Número del complejo al que pertenece la cancha.
     - `descripcion_complejo`: Descripción del complejo.
     - `direccion_complejo`: Dirección del complejo.
     - `dueno`: Dueño del complejo (referencia a `DUEÑO`).

6. **DISPONIBILIDAD**
   - Contiene información sobre los turnos disponibles para cada cancha.
   - Atributos:
     - `id_turno`: Identificador único del turno.
     - `id_reserva`: Identificador de la reserva asociada (si la hay).
     - `id_cancha`: Identificador de la cancha.
     - `disponibilidad`: Estado de disponibilidad del turno (TRUE o FALSE).

7. **RESERVA**
   - Registra las reservas realizadas por los clientes.
   - Atributos:
     - `id_reserva`: Identificador único de la reserva.
     - `id_cliente`: Identificador del cliente que realizó la reserva (referencia a `CLIENTE`).
     - `id_empleado`: Identificador del empleado que gestionó la reserva (referencia a `EMPLEADO`).
     - `FECHA`: Fecha y hora de la reserva.
     - `estado`: Estado de la reserva (por ejemplo, "confirmada", "cancelada").

8. **PRECIOS**
   - Define los precios por hora de las canchas.
   - Atributos:
     - `id_precio`: Identificador único del precio.
     - `id_cancha`: Identificador de la cancha (referencia a `CANCHA`).
     - `precio_por_hora`: Precio por hora de la cancha.

9. **PRODUCTOS**
   - Almacena información sobre los productos disponibles para la venta en el complejo de pádel.
   - Atributos:
     - `id_producto`: Identificador único del producto.
     - `nombre_producto`: Nombre del producto.
     - `descripcion_producto`: Descripción del producto.
     - `precio`: Precio del producto.

10. **GASTOS**
    - Almacena información sobre los gastos asociados a las canchas.
    - Atributos:
      - `id_gasto`: Identificador único del gasto.
      - `numero_complejo`: Número del complejo (referencia a `CANCHA`).
      - `numero_factura`: Número de la factura.
      - `proveedor`: Proveedor del gasto.
      - `concepto_factura`: Concepto del gasto.
      - `importe_factura`: Importe del gasto.
      - `fecha_gasto`: Fecha del gasto.

11. **VENTAS_PRODUCTOS**
    - Relaciona las ventas de productos con las reservas.
    - Atributos:
      - `id_venta`: Identificador único de la venta.
      - `id_reserva`: Identificador de la reserva asociada (referencia a `RESERVA`).
      - `id_producto`: Identificador del producto vendido (referencia a `PRODUCTOS`).
      - `cantidad`: Cantidad de producto vendido.

12. **HISTORIAL_PRECIO**
    - Registra el historial de cambios en los precios de las canchas.
    - Atributos:
      - `id_auditoria`: Identificador único del registro de auditoría.
      - `id_cancha`: Identificador de la cancha afectada (referencia a `CANCHA`).
      - `precio_antiguo`: Precio antiguo antes del cambio.
      - `precio_nuevo`: Precio nuevo después del cambio.
      - `fecha_cambio`: Fecha y hora del cambio de precio.



## Objetos que componen este modelo de datos

### Reseña de Funciones SQL

A continuación se presentan las funciones SQL utilizadas en la base de datos `proyecto_padel` para facilitar y automatizar ciertos procesos relacionados con las ventas y precios.

1. **`ventas_por_producto`**

   - **Descripción**: Esta función calcula el total de ventas de un producto específico. Utiliza el `id_producto` para sumar todas las cantidades vendidas del producto en la tabla `VENTAS_PRODUCTOS`.
   - **Firma**: `CREATE FUNCTION ventas_por_producto(p_id_producto INT) RETURNS DECIMAL(10, 2)`
   - **Detalles**:
     - **Entrada**: `p_id_producto` - Identificador del producto para el cual se desea calcular el total de ventas.
     - **Salida**: Total de ventas como un valor decimal.
     - **Ejemplo de Uso**: `SELECT ventas_por_producto(1);` - Retorna el total de ventas del producto con ID 1.

2. **`aplicar_descuento_precio_cancha`**

   - **Descripción**: Esta función calcula el nuevo precio de una cancha después de aplicar un descuento. Utiliza el `id_cancha` para obtener el precio original y aplica un descuento especificado por `p_descuento`.
   - **Firma**: `CREATE FUNCTION aplicar_descuento_precio_cancha(p_id_cancha INT, p_descuento DECIMAL(5, 2)) RETURNS DECIMAL(10, 2)`
   - **Detalles**:
     - **Entrada**: 
       - `p_id_cancha` - Identificador de la cancha para la cual se desea aplicar el descuento.
       - `p_descuento` - Porcentaje de descuento a aplicar.
     - **Salida**: Nuevo precio después de aplicar el descuento.
     - **Ejemplo de Uso**: `SELECT aplicar_descuento_precio_cancha(1, 15) AS precio_con_descuento;` - Retorna el precio de la cancha con ID 1 después de aplicar un descuento del 15%.

3. **`aplicar_descuento`**

   - **Descripción**: Esta función actualiza todos los precios de las canchas aplicando un descuento global. Se usa para ajustar el precio de todas las canchas en la tabla `PRECIOS` basándose en el porcentaje de descuento proporcionado.
   - **Firma**: `CREATE FUNCTION aplicar_descuento(p_descuento DECIMAL(5, 2)) RETURNS VARCHAR(255)`
   - **Detalles**:
     - **Entrada**: `p_descuento` - Porcentaje de descuento a aplicar a todos los precios.
     - **Salida**: Mensaje de confirmación indicando que los precios han sido actualizados con el descuento aplicado.
     - **Ejemplo de Uso**: 
       - Desactivar el modo seguro para permitir la actualización masiva: `SET SQL_SAFE_UPDATES = 0;`
       - Aplicar el descuento: `SELECT aplicar_descuento(10);` - Actualiza los precios con un descuento del 10% y retorna un mensaje de éxito.
       - Reactivar el modo seguro: `SET SQL_SAFE_UPDATES = 1;`
      
### Reseña de Procedimientos SQL

A continuación se presentan los procedimientos almacenados utilizados en la base de datos `proyecto_padel` para realizar ciertas validaciones y consultas específicas.

1. **`verificar_telefono`**

   - **Descripción**: Este procedimiento verifica si un número de teléfono tiene al menos 9 dígitos. Si el número de teléfono es menor a 9 dígitos, se genera una excepción con un mensaje de error.
   - **Firma**: `CREATE PROCEDURE verificar_telefono(p_telefono VARCHAR(20))`
   - **Detalles**:
     - **Entrada**: `p_telefono` - Número de teléfono a verificar.
     - **Acción**: Comprueba la longitud del número de teléfono y lanza un error si la longitud es menor a 9 dígitos.
     - **Ejemplo de Uso**: `CALL verificar_telefono('12345678');` - Lanza un error si el número de teléfono tiene menos de 9 dígitos.

2. **`obtener_disponibilidad_cancha`**

   - **Descripción**: Este procedimiento consulta la disponibilidad de una cancha en un rango de fechas especificado. Devuelve los turnos disponibles para una cancha específica.
   - **Firma**: `CREATE PROCEDURE obtener_disponibilidad_cancha(IN p_id_cancha INT, IN p_fecha_inicio DATETIME, IN p_fecha_fin DATETIME)`
   - **Detalles**:
     - **Entrada**: 
       - `p_id_cancha` - Identificador de la cancha para la cual se desea consultar la disponibilidad.
       - `p_fecha_inicio` - Fecha y hora de inicio del rango para verificar la disponibilidad.
       - `p_fecha_fin` - Fecha y hora de fin del rango para verificar la disponibilidad.
     - **Salida**: Lista de turnos y su disponibilidad (TRUE o FALSE) para la cancha especificada.
     - **Ejemplo de Uso**: `CALL obtener_disponibilidad_cancha(2, '2023-07-01 00:00:00', '2025-07-02 23:59:59');` - Retorna los turnos disponibles para la cancha con ID 2 en el rango de fechas proporcionado.

### Reseña de Triggers SQL

A continuación se describen los triggers configurados en la base de datos `proyecto_padel`, los cuales automatizan ciertas acciones en la base de datos y aseguran la integridad de los datos.

1. **`before_insert_cliente`**

   - **Descripción**: Este trigger se activa antes de que se inserte un nuevo registro en la tabla `CLIENTE`. Su función es validar el número de teléfono del cliente utilizando el procedimiento `verificar_telefono`. Si el número de teléfono no tiene al menos 9 dígitos, se genera una excepción.
   - **Firma**: `CREATE TRIGGER before_insert_cliente BEFORE INSERT ON CLIENTE FOR EACH ROW BEGIN CALL verificar_telefono(NEW.telefono); END`
   - **Detalles**:
     - **Evento**: Antes de la inserción (`BEFORE INSERT`).
     - **Acción**: Llama al procedimiento `verificar_telefono` para validar el número de teléfono.
     - **Ejemplo de Uso**: Si intentas insertar un cliente con un número de teléfono que no cumple con el requisito de longitud, el trigger generará un error y evitará la inserción.

2. **`before_update_cliente`**

   - **Descripción**: Este trigger se activa antes de que se actualice un registro existente en la tabla `CLIENTE`. Verifica la validez del número de teléfono utilizando el procedimiento `verificar_telefono`. Si el número es menor a 9 dígitos, se genera una excepción.
   - **Firma**: `CREATE TRIGGER before_update_cliente BEFORE UPDATE ON CLIENTE FOR EACH ROW BEGIN CALL verificar_telefono(NEW.telefono); END`
   - **Detalles**:
     - **Evento**: Antes de la actualización (`BEFORE UPDATE`).
     - **Acción**: Llama al procedimiento `verificar_telefono` para validar el número de teléfono antes de permitir la actualización del registro.
     - **Ejemplo de Uso**: Si intentas actualizar un cliente con un número de teléfono no válido, el trigger evitará la actualización y generará un error.

3. **`after_precio_update`**

   - **Descripción**: Este trigger se activa después de que se actualice un registro en la tabla `PRECIOS`. Registra el cambio de precio en la tabla `HISTORIAL_PRECIO`, almacenando el ID de la cancha afectada, el precio antiguo, el precio nuevo, y la fecha y hora del cambio.
   - **Firma**: `CREATE TRIGGER after_precio_update AFTER UPDATE ON PRECIOS FOR EACH ROW BEGIN INSERT INTO HISTORIAL_PRECIO (id_cancha, precio_antiguo, precio_nuevo, fecha_cambio) VALUES (OLD.id_cancha, OLD.precio_por_hora, NEW.precio_por_hora, NOW()); END`
   - **Detalles**:
     - **Evento**: Después de la actualización (`AFTER UPDATE`).
     - **Acción**: Inserta un registro en `HISTORIAL_PRECIO` con la información sobre el cambio en los precios.
     - **Ejemplo de Uso**: Cuando se actualiza el precio de una cancha, se registra automáticamente el cambio en la tabla de historial.
       
### Reseña de Vistas SQL

1. **`top_10_clientes_ventas`**
   - Muestra los 10 clientes con mayores ventas totales.
   - Basada en la suma de productos vendidos por cliente.

2. **`ranking_clientes_reservas`**
   - Lista los clientes ordenados por el número de reservas confirmadas.
   - Incluye un ranking basado en el total de reservas.

3. **`reactivacion_clientes`**
   - Identifica los 10 clientes con menos reservas.
   - Utilizada para estrategias de marketing de reactivación.

4. **`gastos_por_mes`**
   - Detalla los gastos mensuales agrupados por concepto.
   - Muestra el total de gastos por mes y concepto.

5. **`vista_precios_referencia`**
   - Presenta los precios de las canchas y sus descuentos aplicados.
   - Incluye precios originales y con descuentos del 10%, 15%, y 20%.


### ESQUEMA DEL MODELO

![alt text](https://github.com/user-attachments/assets/f7316bc9-258a-4013-8d07-a7e9f0006802)


### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de reserva en complejos de padel, desde la información de los clientes hasta la disponibilidad de canchas y el registro de reservas. Algunos aspectos que aborda incluyen:

- Registro de clientes y empleados involucrados en el proceso de reserva.
- Clasificación de las reservas según su tipo.
- Gestión de la disponibilidad de canchas en cada complejo.
- Registro detallado de las reservas realizadas, incluyendo la fecha, cliente, cancha, empleado y tipo de reserva.

En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de reserva en complejos de padel, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar los tiempos muertos.


