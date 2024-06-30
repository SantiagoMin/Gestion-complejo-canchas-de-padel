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
   - Almacena información sobre los clientes que realizan reservas.
   - Atributos: id_cliente, documento, nombre, direccion, correo.

2. **EMPLEADO**:
   - Contiene información sobre los empleados involucrados en el proceso de reservas y de atencion.
   - Atributos: id_empleado, documento, nombre, direccion, correo.

3. **DUEÑO**:
   - Guarda datos sobre los dueños de los complejos (no se utiliza explícitamente en el proceso de reservas por la confidencialidad de la informacion).
   - Atributos: id_dueno, documento, nombre, direccion, correo.

4. **TIPO_CANCHA**:
   - Define diferentes tipos de cancha para clasificarlas según sus cualidades.
   - Atributos: id_tipo_cancha, tipo_cancha.

5. **CANCHA**:
   - Almacena información sobre las cachas.
   - Atributos: id_cancha, numero_cancha, tipo_cancha, numero_complejo, descripcion_complejo, direccion_complejo, dueno.

6. **DISPONIBILIDAD**:
   - Contiene información indicando los turnos existentes y la disponibilidad de los mismos, los turnos son de 30 minutos cada 1 y una reserva puede ocupar varios turnos.
   - Atributos: id_turno, id_reserva, id_cancha, disponibilidad.

7. **RESERVA**:
   - Registra las reservas realizadas por los clientes.
   - Atributos: id_reserva, id_cliente, id_empleado, fecha_reserva, estado.

### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de reserva en complejos de padel, desde la información de los clientes hasta la disponibilidad de canchas y el registro de reservas. Algunos aspectos que aborda incluyen:

- Registro de clientes y empleados involucrados en el proceso de reserva.
- Clasificación de las reservas según su tipo.
- Gestión de la disponibilidad de cabchas en cada complejo.
- Registro detallado de las reservas realizadas, incluyendo la fecha, cliente, cancha/barbacoa, empleado y tipo de reserva.

En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de reserva en complejos de padel, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar los tiempos muertos.

### ESQUEMA DEL MODELO


![alt text](https://github.com/SantiagoMin/Gestion-complejo-canchas-de-padel/assets/100095294/12c267da-1aea-4b3e-9617-fd6749a05343)

