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

# Descripción de Tablas de la Base de Datos

## 1. **Cliente**
- **ID_Cliente**: Identificador único del cliente. Tipo de dato: `INT`. Clave primaria.
- **Nombre**: Nombre del cliente. Tipo de dato: `VARCHAR(100)`. No nulo.
- **Teléfono**: Número de teléfono del cliente. Tipo de dato: `VARCHAR(15)`.
- **Correo**: Correo electrónico del cliente. Tipo de dato: `VARCHAR(100)`.

## 2. **Proveedor**
- **ID_Proveedor**: Identificador único del proveedor. Tipo de dato: `INT`. Clave primaria.
- **Nombre**: Nombre del proveedor. Tipo de dato: `VARCHAR(100)`. No nulo.
- **Teléfono**: Número de teléfono del proveedor. Tipo de dato: `VARCHAR(15)`.
- **Correo**: Correo electrónico del proveedor. Tipo de dato: `VARCHAR(100)`.

## 3. **Producto**
- **ID_Producto**: Identificador único del producto. Tipo de dato: `INT`. Clave primaria.
- **Nombre**: Nombre del producto. Tipo de dato: `VARCHAR(100)`. No nulo.
- **Descripción**: Descripción del producto. Tipo de dato: `TEXT`.
- **Precio**: Precio del producto. Tipo de dato: `DECIMAL(10, 2)`. No nulo.
- **Stock**: Cantidad disponible del producto en inventario. Tipo de dato: `INT`. No nulo.
- **Tipo**: Tipo de producto (flor, planta, etc.). Tipo de dato: `VARCHAR(50)`.

## 4. **Pedido**
- **ID_Pedido**: Identificador único del pedido. Tipo de dato: `INT`. Clave primaria.
- **Fecha**: Fecha de realización del pedido. Tipo de dato: `DATE`. No nulo.
- **Total**: Total del pedido. Tipo de dato: `DECIMAL(10, 2)`. No nulo.
- **ID_Cliente**: Identificador del cliente que realizó el pedido. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Cliente`.

## 5. **Compra**
- **ID_Compra**: Identificador único de la compra. Tipo de dato: `INT`. Clave primaria.
- **Fecha**: Fecha de realización de la compra. Tipo de dato: `DATE`. No nulo.
- **Total**: Total de la compra. Tipo de dato: `DECIMAL(10, 2)`. No nulo.
- **ID_Proveedor**: Identificador del proveedor de la compra. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Proveedor`.

## 6. **Detalle_Pedido**
- **ID_Detalle**: Identificador único del detalle del pedido. Tipo de dato: `INT`. Clave primaria.
- **ID_Pedido**: Identificador del pedido al que pertenece este detalle. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Pedido`.
- **ID_Producto**: Identificador del producto en este detalle. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Producto`.
- **Cantidad**: Cantidad del producto en el detalle del pedido. Tipo de dato: `INT`. No nulo.
- **Precio_Unitario**: Precio unitario del producto en el momento del pedido. Tipo de dato: `DECIMAL(10, 2)`. No nulo.

## 7. **Detalle_Compra**
- **ID_Detalle_Compra**: Identificador único del detalle de la compra. Tipo de dato: `INT`. Clave primaria.
- **ID_Compra**: Identificador de la compra a la que pertenece este detalle. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Compra`.
- **ID_Producto**: Identificador del producto en este detalle de compra. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Producto`.
- **Cantidad**: Cantidad del producto en el detalle de la compra. Tipo de dato: `INT`. No nulo.
- **Precio_Unitario**: Precio unitario del producto en el momento de la compra. Tipo de dato: `DECIMAL(10, 2)`. No nulo.

## 8. **Logística**
- **ID_Logística**: Identificador único de la logística. Tipo de dato: `INT`. Clave primaria.
- **ID_Proveedor**: Identificador del proveedor encargado de la logística. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Proveedor`.
- **Método**: Método de transporte o entrega utilizado. Tipo de dato: `VARCHAR(100)`.
- **Costo**: Costo del servicio logístico. Tipo de dato: `DECIMAL(10, 2)`.
- **Tiempo_Estimado**: Tiempo estimado de entrega (en días). Tipo de dato: `INT`.

## 9. **Entrega**
- **ID_Entrega**: Identificador único de la entrega. Tipo de dato: `INT`. Clave primaria.
- **ID_Logística**: Identificador de la logística utilizada para la entrega. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Logística`.
- **ID_Pedido**: Identificador del pedido que se está entregando. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Pedido`.
- **Fecha_Entrega**: Fecha en que se realiza la entrega. Tipo de dato: `DATE`.
- **Estado**: Estado de la entrega (por ejemplo, pendiente, completada). Tipo de dato: `VARCHAR(50)`.

## 10. **Evento**
- **ID_Evento**: Identificador único del evento. Tipo de dato: `INT`. Clave primaria.
- **Nombre**: Nombre del evento. Tipo de dato: `VARCHAR(100)`. No nulo.
- **Descripción**: Descripción del evento. Tipo de dato: `TEXT`.
- **Fecha_Inicio**: Fecha de inicio del evento. Tipo de dato: `DATE`.
- **Fecha_Fin**: Fecha de finalización del evento. Tipo de dato: `DATE`.
- **Lugar**: Lugar donde se llevará a cabo el evento. Tipo de dato: `VARCHAR(100)`.

## 11. **Inventario**
- **ID_Inventario**: Identificador único del registro de inventario. Tipo de dato: `INT`. Clave primaria.
- **ID_Producto**: Identificador del producto al que se refiere el registro de inventario. Tipo de dato: `INT`. Clave foránea que hace referencia a la tabla `Producto`.
- **Stock_Anterior**: Cantidad de producto antes de la actualización. Tipo de dato: `INT`. No nulo.
- **Stock_Actual**: Cantidad de producto después de la actualización. Tipo de dato: `INT`. No nulo.
- **Fecha**: Fecha del registro de inventario. Tipo de dato: `DATE`.

## 12. **Descuento**
- **ID_Descuento**: Identificador único del descuento. Tipo de dato: `INT`. Clave primaria.
- **Descripción**: Descripción del descuento. Tipo de dato: `TEXT`.
- **Monto**: Monto o porcentaje del descuento. Tipo de dato: `DECIMAL(10, 2)`.
- **Fecha_Inicio**: Fecha de inicio del descuento. Tipo de dato: `DATE`.
- **Fecha_Fin**: Fecha de finalización del descuento. Tipo de dato: `DATE`.

## 13. **Reporte_Financiero**
- **ID_Reporte**: Identificador único del reporte. Tipo de dato: `INT`. Clave primaria.
- **Fecha**: Fecha del reporte financiero. Tipo de dato: `DATE`. No nulo.
- **Ingresos**: Total de ingresos reportados en ese periodo. Tipo de dato: `DECIMAL(10, 2)`. No nulo.
- **Gastos**: Total de gastos reportados en ese periodo. Tipo de dato: `DECIMAL(10, 2)`. No nulo.
- **Beneficio**: Beneficio neto, calculado como ingresos menos gastos. Tipo de dato: `DECIMAL(10, 2)`. No nulo.

## 14. **Productos_Temporales**
- **ID_Producto**: Identificador único del producto temporal. Tipo de dato: `INT`. Clave primaria.
- **Nombre**: Nombre del producto temporal. Tipo de dato: `VARCHAR(100)`. No nulo.
- **Descripción**: Descripción del producto. Tipo de dato: `TEXT`.
- **Precio**: Precio del producto temporal. Tipo de dato: `DECIMAL(10, 2)`. No nulo.
- **Cantidad**: Cantidad disponible en inventario. Tipo de dato: `INT`. No nulo.
- **Tipo**: Tipo de producto (flor, planta, arreglo). Tipo de dato: `VARCHAR(50)`.
- **Estación**: Estación en la que está disponible el producto temporal (Primavera, Verano, Otoño, Invierno). Tipo de dato: `ENUM('Primavera', 'Verano', 'Otoño', 'Invierno')`.

## 15. **Registro_Generico**
- **ID_Registro**: Identificador único del registro. Tipo de dato: `INT`. Clave primaria.
- **Tipo_Registro**: Tipo de registro (Ejemplo: Evento, Actividad, Noticia, etc.). Tipo de dato: `VARCHAR(100)`.
- **Descripción**: Descripción detallada del registro. Tipo de dato: `TEXT`.
- **Fecha**: Fecha del registro. Tipo de dato: `DATE`. No nulo.
- **Usuario_Registro**: Usuario que registró la información (Ej. Administrador, Empleado, etc.). Tipo de dato: `VARCHAR(100)`.
- **Estado**: Estado del registro (Ej. Activo, Inactivo, Concluido). Tipo de dato: `VARCHAR(50)`.



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

## informe analisis 

# Informe de Análisis Estratégico para la Floristería

Este informe ha sido generado utilizando las vistas, funciones y procedimientos definidos en la base de datos de la floristería, y tiene como objetivo proporcionar una visión clara y detallada de los aspectos clave del negocio, como el inventario, las ventas, los ingresos y el rendimiento logístico. El análisis está estructurado para facilitar la toma de decisiones informadas y mejorar la gestión operativa.

---

## 1. Vista de Producto con Stock Crítico

### Objetivo:
Identificar y monitorear productos con niveles de inventario bajos o críticos para gestionar eficientemente el stock.

### Descripción:
Esta vista clasifica los productos según su nivel de stock, dividiéndolos en tres categorías:
- **Crítico**: 20 unidades o menos.
- **Bajo**: Entre 21 y 50 unidades.
- **Normal**: Más de 50 unidades.

### Características Principales:
- Muestra detalles como ID, nombre, tipo, stock y precio de cada producto.
- Calcula un porcentaje de stock en relación con el promedio general de todos los productos.
- Ordena los resultados por nivel de stock de menor a mayor.

### Beneficios:
- Facilita la gestión de inventarios al alertar sobre productos con bajo stock.
- Permite la planificación de compras y reposiciones a tiempo.

---

## 2. Vista de Ingresos Mensuales (VW_Ingresos_Mensuales)

### Objetivo:
Proporcionar un análisis detallado de los ingresos por mes para monitorear el rendimiento financiero a lo largo del tiempo.

### Descripción:
Agrupa los pedidos por mes y calcula métricas clave sobre las ventas.

### Características Principales:
- Agrupa los pedidos por año y mes.
- Calcula:
  - Número total de pedidos por mes.
  - Ingresos totales.
  - Valor promedio de pedido.
  - Pedido mínimo y máximo.
- Ordena los resultados cronológicamente.

### Beneficios:
- Ayuda a identificar patrones estacionales de ventas.
- Permite la comparación de ingresos mes a mes y la evaluación del rendimiento financiero de la floristería.

---

## 3. Vista de Ingresos por Logística

### Objetivo:
Analizar los ingresos generados por diferentes métodos de logística para evaluar la efectividad de las opciones de entrega.

### Descripción:
Relaciona los pedidos con sus métodos de entrega y calcula los ingresos generados por cada uno de ellos.

### Características Principales:
- Agrupa los ingresos por método de logística.
- Suma el total de ingresos para cada método de entrega.
- Ordena los resultados de mayor a menor ingreso.

### Beneficios:
- Permite evaluar la rentabilidad de los diferentes métodos logísticos.
- Facilita la toma de decisiones sobre la optimización de métodos de entrega y costos asociados.

---

## 4. Funciones Utilizadas en el Análisis

### Función GetEstadoStockProducto(p_ID_Producto INT)

- **Objetivo**: Determina el estado del stock de un producto específico.
- **Lógica**:
  - Stock ≤ 20: 'Crítico'
  - Stock entre 21 y 50: 'Bajo'
  - Stock > 50: 'Normal'
- **Uso práctico**: Permite rápidamente identificar el estado de inventario de cualquier producto, útil para alertas de reabastecimiento.

### Función GetPromedioProductosPorPedido(p_FechaInicio DATE, p_FechaFin DATE)

- **Objetivo**: Calcular el promedio de productos por pedido en un período específico.
- **Uso práctico**: Análisis del volumen de ventas y evaluación de la composición típica de los pedidos.

### Función GetIngresosCliente(p_ID_Cliente INT, p_FechaInicio DATE, p_FechaFin DATE)

- **Objetivo**: Calcular los ingresos totales generados por un cliente específico.
- **Uso práctico**: Evaluación del valor de cliente y seguimiento de compras por cliente.

---

## 5. Procedimientos Utilizados en el Análisis

### Procedimiento ActualizarStockProducto

- **Objetivo**: Actualizar automáticamente el stock de un producto después de una venta.
- **Funcionalidad**: Resta la cantidad vendida del stock actual.
- **Beneficios**: Mantiene el inventario actualizado en tiempo real y evita la actualización manual del stock.

### Procedimiento ObtenerIngresosPorProducto

- **Objetivo**: Generar un informe de ingresos totales por producto en un rango de fechas específico.
- **Beneficios**: Ayuda a identificar los productos más rentables y evaluar el rendimiento de productos específicos.

### Procedimiento ObtenerOrdenVentasPorRangoFechas

- **Objetivo**: Proporcionar un detalle cronológico de ventas en un período específico.
- **Beneficios**: Facilita el seguimiento de ventas y el análisis de patrones de compra.

---

## 6. Beneficios Generales de las Vistas, Funciones y Procedimientos

- **Optimización de Inventarios**: Las vistas de stock crítico y las funciones asociadas ayudan a gestionar y mantener el inventario en niveles óptimos, evitando desabastecimientos o excesos de stock.
  
- **Monitoreo Financiero**: Las vistas de ingresos mensuales y por logística ofrecen un análisis detallado de las métricas financieras clave, permitiendo evaluar el rendimiento económico del negocio a lo largo del tiempo y por distintos métodos de entrega.

- **Eficiencia Operativa**: Los procedimientos automatizan la actualización de stock y la generación de informes, lo que mejora la eficiencia operativa y reduce el margen de error humano.

- **Toma de Decisiones Estratégicas**: Las funciones y vistas proporcionan información clave para la toma de decisiones informadas sobre compras, ventas y estrategias logísticas.

---

## 7. Recomendaciones de Uso

- **Informes Periódicos**: Utilizar las vistas y procedimientos en informes periódicos (semanales, mensuales, trimestrales) para hacer un seguimiento constante del inventario, las ventas y los ingresos.
  
- **Análisis de Rendimiento de Productos**: Aprovechar la función `ObtenerIngresosPorProducto` para analizar el rendimiento de productos específicos, y ajustar la oferta según la demanda y rentabilidad.

- **Planificación de Compras y Reabastecimiento**: Usar la vista de **Producto con Stock Crítico** para identificar qué productos requieren reposición urgente y evitar desabastecimientos.


# Herramientas utilizadas

El uso combinado de **MySQL Workbench**, **GitHub** y **Visual Studio Code** permitió un flujo de trabajo eficiente y organizado para la creación y gestión de la base de datos de la floristería.

- **MySQL Workbench** facilitó la creación y administración de la base de datos, así como la ejecución de consultas y pruebas
- **GitHub** A traves de Github permitio el almacenamiento y la gestion del proyecto de manera eficiente.
- **Visual Studio Code** A traves de visual studio se pudo realizar la ejecucion del codigo y el enlazamiento con github

## Resumen:


La floristería se dedica a la venta de flores y plantas frescas, además de ofrecer servicios personalizados para eventos y celebraciones. Para mejorar la eficiencia operativa, se ha decidido implementar una base de datos integral que facilitará la gestión de clientes, proveedores, productos, pedidos, compras y entregas. Esta herramienta permitirá optimizar el control de inventarios, agilizar los pedidos y mejorar la logística, lo que se traducirá en un servicio más rápido y de mayor calidad.

Actualmente, la floristería enfrenta problemas como errores en el inventario, demoras en las entregas y dificultades para coordinarse con los proveedores, debido a la falta de un sistema centralizado. Estos inconvenientes afectan la organización y la calidad del servicio, impidiendo una atención rápida y personalizada. La implementación de la base de datos solucionará estos problemas al automatizar los procesos, mejorar la comunicación con los proveedores y mantener un control preciso de los productos en stock. Esto permitirá una atención más eficiente, minimizando errores y reduciendo tiempos de espera.

Con la base de datos, la floristería podrá gestionar de manera más ágil los pedidos, optimizar las compras, mejorar las relaciones con los proveedores y ofrecer un servicio más rápido y personalizado. Esto contribuirá a mejorar la experiencia del cliente, optimizar la logística y asegurar el crecimiento y la sostenibilidad del negocio a largo plazo.







