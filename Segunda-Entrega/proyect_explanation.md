## CREACION DE UNA BASE DE DATOS, INSUMO PARA UN DASHBOARD DE GESTION DE UN COMPLEJO DE PADEL


### Problema:

El proyecto se basa en el desarrollo de un sistema integral de gestión de reservas para un complejo de pádel, donde nos encontramos con el desafío de crear una base de datos eficiente que pueda gestionar de manera óptima todas las operaciones relacionadas con las reservas y a posteriori la compra de productos. La complejidad de un complejo de pádel con múltiples canchas, clientes, y empleados requiere una solución robusta que garantice un flujo de operaciones ágil y eficaz.

### Descripción del Problema:

1. **Gestión de Clientes y Empleados**: Necesitamos una base de datos que nos permita registrar la información de los clientes que realizan reservas, así como de los empleados involucrados en el proceso de las mismas. Para en una segunda etapa poder incorporar la compra de productos y la gestion de los pagos.

2. **Gestión de Canchas y Disponibilidad**: La base de datos debe permitirnos registrar la disponibilidad de las canchas y las barbacoas, para asi permitirnos realizar promociones puntuales en dias de baja demanda. Esto es fundamental para garantizar una asignación eficiente de las canchas y evitar conflictos de reservas, ya que la mayoria se encuentra en la periferia e incurriria en perdida de tiempo para el cliente.

3. **Registro de Reservas**: Necesitamos un sistema que pueda registrar de manera detallada cada reserva realizada, incluyendo la fecha y hora de la reserva, el cliente que la realizó, la cancha o barbacoa a utilizar y la cantidad de horas que utilizara las instalaciones, entre otras informaciones.

### Objetivo:

Diseñar e implementar una base de datos relacional que satisfaga todas las necesidades de gestión de reservas para complejos de padel. Esta base de datos deberá ser eficiente, escalable y fácil de mantener, permitiendo una gestión ágil y precisa de todas las operaciones relacionadas con las reservas.


## A continuacion detallaremos los componentes de nuestro modelo relacional

Esta base de datos está diseñada para gestionar reservas en complejos de padel, así como la información relacionada con clientes, empleados y canchas. A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **CLIENTE**:

Almacena información sobre los clientes que realizan reservas.
Atributos:
id_cliente: Identificador único del cliente.
nombre: Nombre del cliente.
telefono: Número de teléfono del cliente.
correo: Correo electrónico del cliente.
direccion: Dirección del cliente.
documento: Documento de identificación del cliente (único).

2. **EMPLEADO**:

Contiene información sobre los empleados involucrados en el proceso de reservas y de atención.
-Atributos:
-id_empleado: Identificador único del empleado.
-nombre: Nombre del empleado.
-telefono: Número de teléfono del empleado.
-correo: Correo electrónico del empleado.
-direccion: Dirección del empleado.
-documento: Documento de identificación del empleado (único).

3. **DUEÑO**:

Guarda datos sobre los dueños de los complejos (no se utiliza explícitamente en el proceso de reservas por la confidencialidad de la información).
Atributos:
id_dueno: Identificador único del dueño.
nombre: Nombre del dueño.
telefono: Número de teléfono del dueño.
correo: Correo electrónico del dueño.
direccion: Dirección del dueño.
documento: Documento de identificación del dueño (único).

4. **TIPO_CANCHA**:

Define diferentes tipos de cancha para clasificarlas según sus cualidades.
Atributos:
id_tipo_cancha: Identificador único del tipo de cancha.
tipo_cancha: Descripción del tipo de cancha.

5. **CANCHA**:

Almacena información sobre las canchas y los complejos.
Atributos:
id_cancha: Identificador único de la cancha.
numero_cancha: Número de la cancha.
tipo_cancha: Tipo de cancha (referencia a TIPO_CANCHA).
numero_complejo: Número del complejo al que pertenece la cancha.
descripcion_complejo: Descripción del complejo.
direccion_complejo: Dirección del complejo.
dueno: Dueño del complejo (referencia a DUEÑO).

6. **DISPONIBILIDAD**:

Contiene información sobre los turnos disponibles para cada cancha.
Atributos:
id_turno: Identificador único del turno.
id_reserva: Identificador de la reserva asociada (si la hay).
id_cancha: Identificador de la cancha.
disponibilidad: Estado de disponibilidad del turno (TRUE o FALSE).

7. **RESERVA**:

Registra las reservas realizadas por los clientes.
Atributos:
id_reserva: Identificador único de la reserva.
id_cliente: Identificador del cliente que realizó la reserva (referencia a CLIENTE).
id_empleado: Identificador del empleado que gestionó la reserva (referencia a EMPLEADO).
FECHA: Fecha y hora de la reserva.
estado: Estado de la reserva (por ejemplo, "confirmada", "cancelada").

8. **PRECIOS**:

Define los precios por hora de las canchas.
Atributos:
id_precio: Identificador único del precio.
id_cancha: Identificador de la cancha (referencia a CANCHA).
precio_por_hora: Precio por hora de la cancha.

9. **PRODUCTOS**:

Almacena información sobre los productos disponibles para la venta en el complejo de pádel.
Atributos:
id_producto: Identificador único del producto.
nombre_producto: Nombre del producto.
descripcion_producto: Descripción del producto.
precio: Precio del producto.

10. **GASTOS**:

Almacena información sobre los gastos asociados a las canchas.
Atributos:
id_gasto: Identificador único del gasto.
numero_complejo: Número del complejo (referencia a CANCHA).
numero_factura: Número de la factura.
proveedor: Proveedor del gasto.
concepto_factura: Concepto del gasto.
importe_factura: Importe del gasto.
fecha_gasto: Fecha del gasto.

11. **VENTAS_PRODUCTOS**:

Relaciona las ventas de productos con las reservas.
Atributos:
id_venta: Identificador único de la venta.
id_reserva: Identificador de la reserva asociada (referencia a RESERVA).
id_producto: Identificador del producto vendido (referencia a PRODUCTOS).
cantidad: Cantidad de producto vendido.

12. **HISTORIAL_PRECIO**:

Registra el historial de cambios en los precios de las canchas.
Atributos:
id_auditoria: Identificador único del registro de auditoría.
id_cancha: Identificador de la cancha afectada (referencia a CANCHA).
precio_antiguo: Precio antiguo antes del cambio.
precio_nuevo: Precio nuevo después del cambio.
fecha_cambio: Fecha y hora del cambio de precio.

### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de reserva en complejos de padel, desde la información de los clientes hasta la disponibilidad de canchas y el registro de reservas. Algunos aspectos que aborda incluyen:

- Registro de clientes y empleados involucrados en el proceso de reserva.
- Clasificación de las reservas según su tipo.
- Gestión de la disponibilidad de cabchas en cada complejo.
- Registro detallado de las reservas realizadas, incluyendo la fecha, cliente, cancha/barbacoa, empleado y tipo de reserva.

En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de reserva en complejos de padel, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar los tiempos muertos.

### ESQUEMA DEL MODELO

![alt text](https://github.com/user-attachments/assets/f7316bc9-258a-4013-8d07-a7e9f0006802)


