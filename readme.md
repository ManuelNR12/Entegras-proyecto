# Introduccion:

En nuestra floristería, nos dedicamos a la venta y distribución de flores y plantas frescas, ofreciendo productos de alta calidad y servicios personalizados para eventos especiales, celebraciones y decoración. Nuestro objetivo es brindar una experiencia única a cada cliente, con diseños florales creativos y un servicio excepcional.

Para mejorar nuestra eficiencia y poder ofrecer un mejor servicio, hemos decidido crear una base de datos integral que nos permita gestionar toda la información relacionada con nuestros clientes, proveedores, productos, pedidos, compras y entregas. Este sistema nos ayudará a llevar un control más preciso de nuestro inventario, gestionar de manera más ágil los pedidos y optimizar la logística de entregas. Con esta base de datos, buscamos simplificar nuestras operaciones, mejorar la organización y, en última instancia, ofrecer un servicio más rápido y de mayor calidad a nuestros clientes.

# Objetivo:

El objetivo principal de implementar una base de datos en nuestra floristería es optimizar la gestión integral de la información, permitiendo un control preciso y eficiente sobre los diferentes aspectos del negocio, como los clientes, proveedores, productos, pedidos, compras y entregas. Con este sistema, buscamos automatizar y agilizar los procesos relacionados con el inventario, los pedidos y la logística de entregas, lo que nos permitirá mantener un seguimiento constante y actualizado de nuestras operaciones. A través de esta herramienta, nos proponemos mejorar la organización interna, minimizar errores humanos, y reducir los tiempos de espera tanto para el cliente como para el personal encargado de las tareas operativas.

Además, la base de datos nos ayudará a tener un mejor manejo de las relaciones con los proveedores, optimizando las compras y garantizando que siempre tengamos los productos adecuados en stock. También se mejorará la experiencia del cliente, ya que podremos ofrecer un servicio más rápido y personalizado, asegurando que sus pedidos sean atendidos con precisión y en tiempo oportuno. En resumen, nuestro objetivo es aumentar la eficiencia operativa, mejorar la calidad del servicio, fortalecer la relación con nuestros clientes y proveedores, y optimizar la logística de nuestra floristería, todo ello con el fin de asegurar el crecimiento y la sostenibilidad del negocio a largo plazo.

# Situacion Problema:

Actualmente, nuestra floristería enfrenta dificultades para gestionar de manera eficiente la información relacionada con los clientes, proveedores, productos, pedidos, compras y entregas. La falta de un sistema centralizado y automatizado para el control de inventarios y la gestión de pedidos ha generado diversos inconvenientes, como errores en la actualización del stock, demoras en las entregas y dificultades para mantener un seguimiento adecuado de los pedidos y solicitudes de los clientes. Además, la falta de una herramienta que facilite la comunicación y coordinación con los proveedores ha provocado desabastecimientos de productos clave en momentos de alta demanda.

El manejo manual de estos procesos, a través de hojas de cálculo o registros en papel, también ha ocasionado problemas de organización, pérdida de datos importantes y una mayor carga de trabajo para el personal, lo que impacta negativamente en la calidad del servicio que ofrecemos. Esta situación limita nuestra capacidad para ofrecer una atención más rápida y personalizada, y dificulta la toma de decisiones estratégicas sobre inventario, compras y logística. En resumen, la falta de un sistema eficiente y centralizado está afectando nuestra operativa diaria y nuestra capacidad para satisfacer las necesidades de los clientes de manera óptima.

# Modelo de negocio:

El modelo de negocio de nuestra floristería se basa en la venta de flores y plantas frescas, así como en la oferta de servicios de diseño floral para eventos, celebraciones y decoración de espacios. A través de este modelo, buscamos atender tanto a clientes particulares como a empresas, ofreciendo productos personalizados y servicios adaptados a las necesidades de cada ocasión. Nuestra floristería no solo se enfoca en la venta de productos, sino también en crear experiencias únicas a través de arreglos florales y decoraciones especiales para bodas, aniversarios, cumpleaños y otros eventos.





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


## VISTAS

1. Vista de Producto con Stock Crítico
   - **Objetivo**: Identificar y monitorear productos con niveles de inventario bajos o críticos.
   - **Descripción**: Esta consulta genera un informe detallado del estado de inventario de los productos, clasificándolos según su nivel de stock.
   - **Tablas involucradas**: 
     * Tabla Producto
   - **Características principales**:
     * Muestra información como ID, Nombre, Tipo, Stock y Precio
     * Clasifica el estado del stock en tres niveles:
       - 'Crítico': 20 unidades o menos
       - 'Bajo': Entre 21 y 50 unidades
       - 'Normal': Más de 50 unidades
     * Calcula un porcentaje de stock en relación con el promedio general
     * Ordena los resultados de menor a mayor stock

2. Vista de Ingresos Mensuales (VW_Ingresos_Mensuales)
   - **Objetivo**: Proporcionar un análisis detallado de los ingresos por mes.
   - **Descripción**: Agrupa los pedidos por mes y calcula métricas financieras clave.
   - **Tablas involucradas**: 
     * Tabla Pedido
   - **Características principales**:
     * Agrupa los pedidos por año y mes
     * Calcula:
       - Número total de pedidos por mes
       - Ingresos totales
       - Valor promedio de pedido
       - Pedido mínimo
       - Pedido máximo
     * Ordena los resultados cronológicamente

3. Vista de Ingresos por Logística
   - **Objetivo**: Analizar los ingresos generados por diferentes métodos de logística.
   - **Descripción**: Relaciona los pedidos con sus métodos de entrega para evaluar el rendimiento financiero.
   - **Tablas involucradas**:
     * Tabla Entrega
     * Tabla Logística
     * Tabla Pedido
   - **Características principales**:
     * Agrupa los ingresos por método de logística
     * Suma el total de ingresos para cada método
     * Ordena los resultados de mayor a menor ingreso

Estas vistas serviran para análisis estratégico para la floristería, permitiendo:
- Gestionar eficientemente el inventario
- Monitorear el rendimiento financiero mensual
- Evaluar la efectividad de los diferentes métodos de logística

## funciones

Función GetEstadoStockProducto(p_ID_Producto INT)

Objetivo: Determinar el estado del stock de un producto específico basado en su cantidad disponible.
Parámetros de entrada:

p_ID_Producto: Identificador único del producto


Valor de retorno:

Cadena de texto (VARCHAR) que describe el estado del stock


Tablas manipuladas:

Tabla Producto


Lógica de clasificación:

Stock ≤ 20: 'Crítico'
Stock entre 21 y 50: 'Bajo'
Stock > 50: 'Normal'


Uso práctico:

Permite rápidamente identificar el estado de inventario de cualquier producto
Útil para alertas de reabastecimiento y gestión de inventario




Función GetPromedioProductosPorPedido(p_FechaInicio DATE, p_FechaFin DATE)

Objetivo: Calcular el promedio de productos por pedido en un rango de fechas específico.
Parámetros de entrada:

p_FechaInicio: Fecha de inicio del período de análisis
p_FechaFin: Fecha de finalización del período de análisis


Valor de retorno:

Número decimal que representa el promedio de productos por pedido


Tablas manipuladas:

Tabla Detalle_Pedido
Tabla Pedido


Proceso de cálculo:

Suma total de productos en el rango de fechas
Cuenta total de pedidos en el rango de fechas
Calcula el promedio dividiendo total de productos por total de pedidos


Consideraciones especiales:

Devuelve 0 si no hay pedidos en el rango de fechas
Redondea el resultado a 2 decimales


Uso práctico:

Análisis de volumen de ventas
Evaluación de la composición típica de los pedidos




Función GetIngresosCliente(p_ID_Cliente INT, p_FechaInicio DATE, p_FechaFin DATE)

Objetivo: Calcular los ingresos totales generados por un cliente específico en un rango de fechas determinado.
Parámetros de entrada:

p_ID_Cliente: Identificador único del cliente
p_FechaInicio: Fecha de inicio del período de análisis
p_FechaFin: Fecha de finalización del período de análisis


Valor de retorno:

Número decimal que representa el total de ingresos del cliente


Tablas manipuladas:

Tabla Pedido


Proceso de cálculo:

Suma los totales de los pedidos del cliente en el rango de fechas especificado
Redondea el resultado a 2 decimales


Consideraciones especiales:

Devuelve 0 si no hay ingresos o pedidos para el cliente en el rango de fechas


Uso práctico:

Análisis de valor de cliente
Seguimiento de compras por cliente
Identificación de clientes más importantes

Beneficios generales de estas funciones:

Facilitan consultas complejas mediante funciones predefinidas
Mejoran la modularidad y mantenibilidad del código de base de datos
Permiten análisis rápidos y flexibles de diferentes aspectos del negocio

Recomendaciones de uso:

Pueden ser utilizadas en consultas SELECT, WHERE y en otras funciones o procedimientos
Útiles para informes, dashboard y análisis de negocio


## procedure

1. Procedimiento `ActualizarStockProducto`
   - **Objetivo**: Actualizar automáticamente el stock de un producto después de una venta.
   - **Parámetros de entrada**:
     * `p_ID_Producto`: Identificador único del producto
     * `p_CantidadVendida`: Número de unidades vendidas
   - **Tablas manipuladas**:
     * Tabla `Producto`
   - **Funcionalidad**:
     * Resta la cantidad vendida del stock actual del producto
     * Permite una gestión dinámica y automática del inventario
   - **Beneficios**:
     * Evita la actualización manual de stock
     * Reduce errores de conteo
     * Mantiene el inventario actualizado en tiempo real

2. Procedimiento `ObtenerIngresosPorProducto`
   - **Objetivo**: Generar un informe de ingresos totales por producto en un rango de fechas específico.
   - **Parámetros de entrada**:
     * `p_FechaInicio`: Fecha de inicio del período de análisis
     * `p_FechaFin`: Fecha de finalización del período de análisis
   - **Tablas involucradas**:
     * Tabla `Detalle_Pedido`
     * Tabla `Producto`
     * Tabla `Pedido`
   - **Características del informe**:
     * Muestra el nombre del producto
     * Calcula los ingresos totales por producto
     * Ordena los resultados de mayor a menor ingreso
   - **Beneficios**:
     * Análisis rápido de rendimiento de productos
     * Identificación de productos más rentables
     * Apoyo en la toma de decisiones de inventario y marketing

3. Procedimiento `ObtenerOrdenVentasPorRangoFechas`
   - **Objetivo**: Proporcionar un detalle cronológico de ventas en un período específico.
   - **Parámetros de entrada**:
     * `p_FechaInicio`: Fecha de inicio del período de análisis
     * `p_FechaFin`: Fecha de finalización del período de análisis
   - **Tablas involucradas**:
     * Tabla `Detalle_Pedido`
     * Tabla `Producto`
     * Tabla `Pedido`
   - **Características del informe**:
     * Muestra la fecha de venta
     * Incluye detalles del producto vendido
     * Detalla cantidad vendida y precio unitario
     * Calcula el total de venta por línea de pedido
     * Ordena los resultados cronológicamente
   - **Beneficios**:
     * Seguimiento detallado de ventas
     * Análisis de patrones de venta
     * Facilita la auditoría y control de ventas

**Beneficios generales de estos procedimientos**:
- Automatizan procesos de gestión de inventario y análisis de ventas
- Proporcionan información precisa y actualizada
- Mejoran la eficiencia operativa
- Facilitan la toma de decisiones estratégicas

**Casos de uso recomendados**:
- Generación de informes periódicos
- Análisis de rendimiento de productos
- Seguimiento de inventario
- Planificación de compras y reabastecimiento

**Consideraciones importantes**:
- Pueden ser llamados directamente desde aplicaciones o herramientas de gestión
- Proporcionan una capa de abstracción para operaciones complejas de base de datos



