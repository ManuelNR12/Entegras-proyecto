# Base de Datos: Floristería

La base de datos de **Floristería** tiene como objetivo gestionar información de clientes, proveedores, productos, pedidos, compras y entregas, proporcionando un sistema para el control de inventario, pedidos y logística de la floristería.

## Tablas y Relaciones

### Tabla: Cliente
- **Descripción**: Contiene información sobre los clientes de la floristería.
- **Campos**:
  - `ID_Cliente`: Identificador único del cliente (clave primaria).
  - `Nombre`: Nombre completo del cliente.
  - `Teléfono`: Número de teléfono del cliente.
  - `Correo`: Correo electrónico del cliente.
- **Propósito**: Permite almacenar y acceder a información de los clientes para gestionar sus pedidos y comunicaciones.

### Tabla: Proveedor
- **Descripción**: Contiene datos de los proveedores de productos.
- **Campos**:
  - `ID_Proveedor`: Identificador único del proveedor (clave primaria).
  - `Nombre`: Nombre del proveedor.
  - `Teléfono`: Número de teléfono del proveedor.
  - `Correo`: Correo electrónico del proveedor.
- **Propósito**: Facilita la gestión de relaciones con proveedores para la adquisición de productos necesarios para la floristería.

### Tabla: Producto
- **Descripción**: Almacena información sobre los productos disponibles para la venta.
- **Campos**:
  - `ID_Producto`: Identificador único del producto (clave primaria).
  - `Nombre`: Nombre del producto.
  - `Descripción`: Descripción del producto.
  - `Precio`: Precio del producto.
  - `Stock`: Cantidad disponible en inventario.
  - `Tipo`: Tipo o categoría del producto.
- **Propósito**: Permite el control de inventario y precios de los productos que ofrece la floristería.

### Tabla: Pedido
- **Descripción**: Contiene información sobre los pedidos realizados por los clientes.
- **Campos**:
  - `ID_Pedido`: Identificador único del pedido (clave primaria).
  - `Fecha`: Fecha en la que se realizó el pedido.
  - `Total`: Total del pedido.
  - `ID_Cliente`: Clave foránea que hace referencia a Cliente (`ID_Cliente`).
- **Propósito**: Almacena pedidos de clientes, facilitando el seguimiento de ventas y la creación de reportes de pedidos.

### Tabla: Compra
- **Descripción**: Almacena las compras realizadas a proveedores para abastecer inventario.
- **Campos**:
  - `ID_Compra`: Identificador único de la compra (clave primaria).
  - `Fecha`: Fecha de la compra.
  - `Total`: Total de la compra.
  - `ID_Proveedor`: Clave foránea que hace referencia a Proveedor (`ID_Proveedor`).
- **Propósito**: Permite el seguimiento de compras a proveedores y el control del gasto en adquisiciones.

### Tabla: Detalle_Pedido
- **Descripción**: Detalla los productos incluidos en cada pedido realizado por los clientes.
- **Campos**:
  - `ID_Detalle`: Identificador único del detalle (clave primaria).
  - `ID_Pedido`: Clave foránea que hace referencia a Pedido (`ID_Pedido`).
  - `ID_Producto`: Clave foránea que hace referencia a Producto (`ID_Producto`).
  - `Cantidad`: Cantidad del producto en el pedido.
  - `Precio_Unitario`: Precio unitario del producto en el pedido.
- **Propósito**: Almacena el desglose de cada pedido, esencial para el control de productos y la facturación.

### Tabla: Detalle_Compra
- **Descripción**: Detalla los productos incluidos en cada compra realizada a los proveedores.
- **Campos**:
  - `ID_Detalle_Compra`: Identificador único del detalle de compra (clave primaria).
  - `ID_Compra`: Clave foránea que hace referencia a Compra (`ID_Compra`).
  - `ID_Producto`: Clave foránea que hace referencia a Producto (`ID_Producto`).
  - `Cantidad`: Cantidad del producto comprado.
  - `Precio_Unitario`: Precio unitario del producto en la compra.
- **Propósito**: Permite registrar los productos adquiridos en cada compra, ayudando en la gestión del inventario y costos.

### Tabla: Logística
- **Descripción**: Almacena información sobre los métodos logísticos disponibles para los proveedores.
- **Campos**:
  - `ID_Logística`: Identificador único del método logístico (clave primaria).
  - `ID_Proveedor`: Clave foránea que hace referencia a Proveedor (`ID_Proveedor`).
  - `Método`: Método de envío.
  - `Costo`: Costo del envío.
  - `Tiempo_Estimado`: Tiempo estimado de entrega en días.
- **Propósito**: Facilita la gestión y elección de métodos logísticos para los envíos desde los proveedores.

### Tabla: Entrega
- **Descripción**: Almacena información sobre la entrega de pedidos.
- **Campos**:
  - `ID_Entrega`: Identificador único de la entrega (clave primaria).
  - `ID_Logística`: Clave foránea que hace referencia a Logística (`ID_Logística`).
  - `ID_Pedido`: Clave foránea que hace referencia a Pedido (`ID_Pedido`).
  - `Fecha_Entrega`: Fecha en la que se entregó el pedido.
  - `Estado`: Estado actual de la entrega.
- **Propósito**: Permite el seguimiento de la entrega de pedidos y facilita la administración de estados de entrega y tiempos de cumplimiento.


## Problemas Resueltos
- **Gestión de Inventario**: Control del stock y precios de productos, detallando las cantidades en cada pedido y compra.
- **Control de Pedidos y Entregas**: Seguimiento del estado y la logística de las entregas de los pedidos, mejorando la experiencia del cliente.
- **Administración de Relaciones con Proveedores**: Registro de proveedores, métodos logísticos y detalles de cada compra, optimizando las adquisiciones.
- **Gestión Financiera**: Registro y cálculo de totales en pedidos y compras, clave para el análisis de ingresos y gastos.

---

Esta estructura de base de datos es útil para optimizar las operaciones de la floristería, mejorar la eficiencia del servicio y aumentar la satisfacción del cliente a través de un seguimiento detallado de cada proceso.

