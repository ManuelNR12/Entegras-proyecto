USE floristeria;

--  Cliente

INSERT INTO  Cliente (Nombre, Teléfono, Correo) VALUES
('María González', '555-1234', 'maria.gonzalez@email.com'),
('Carlos Rodríguez', '555-5678', 'carlos.rodriguez@email.com'),
('Ana Martínez', '555-9012', 'ana.martinez@email.com'),
('Luis Fernández', '555-3456', 'luis.fernandez@email.com'),
('Sofía López', '555-7890', 'sofia.lopez@email.com');

-- proveedor

INSERT INTO Proveedor (Nombre, Teléfono, Correo) VALUES
('Flores del Jardín S.A.', '555-2345', 'contacto@floresdeljadin.com'),
('Vivero Natural', '555-6789', 'ventas@viveronatural.com');

--  Producto
INSERT INTO Producto (Nombre, Descripción, Precio, Stock, Tipo) VALUES
('Rosa Roja', 'Rosa de color rojo intenso', 15.50, 100, 'Flor'),
('Orquídea Blanca', 'Orquídea elegante y delicada', 45.00, 50, 'Orquídea'),
('Bouquet Primaveral', 'Arreglo floral con flores variadas', 75.00, 25, 'Arreglo'),
('Cactus Decorativo', 'Cactus pequeño para interiores', 20.00, 75, 'Planta'),
('Girasol', 'Girasol de tallo alto', 12.00, 60, 'Flor');

--  Pedido
INSERT INTO Pedido (Fecha, Total, ID_Cliente) VALUES
('2024-02-15', 90.50, 1),
('2024-02-16', 150.00, 2),
('2024-02-17', 225.00, 3),
('2024-02-18', 60.00, 4),
('2024-02-19', 180.50, 5);

--   Compra
INSERT INTO Compra (Fecha, Total, ID_Proveedor) VALUES
('2024-02-10', 500.00, 1),
('2024-02-11', 750.00, 2),
('2024-02-12', 600.50, 2),
('2024-02-13', 450.00, 1),
('2024-02-14', 550.75, 1);

--   Detalle_Pedido
INSERT INTO Detalle_Pedido (ID_Pedido, ID_Producto, Cantidad, Precio_Unitario) VALUES
(1, 1, 2, 15.50),
(1, 3, 1, 75.00),
(2, 2, 3, 45.00),
(3, 4, 2, 20.00),
(4, 5, 5, 12.00);

--  Detalle_Compra
INSERT INTO Detalle_Compra (ID_Compra, ID_Producto, Cantidad, Precio_Unitario) VALUES
(1, 1, 50, 10.00),
(2, 2, 25, 30.00),
(3, 3, 10, 60.00),
(4, 4, 40, 15.00),
(5, 5, 60, 9.00);

--  logistica interna
INSERT INTO Logística (ID_Proveedor, Método, Costo, Tiempo_Estimado) VALUES
(1, 'Entrega Local', 10.00, 1),
(1, 'Entrega Metropolitana', 20.00, 2),
(1, 'Entrega Regional', 35.00, 3),
(2, 'Entrega Nacional', 50.00, 4),
(2, 'Entrega Especial', 75.00, 1);

--  entrega

INSERT INTO Entrega (ID_Logística, ID_Pedido, Fecha_Entrega, Estado) VALUES
(1, 1, '2024-02-16', 'Entregado'),
(2, 2, '2024-02-17', 'En proceso'),
(3, 3, '2024-02-18', 'Pendiente'),
(4, 4, '2024-02-19', 'En tránsito'),
(5, 5, '2024-02-20', 'Programado');

-- evento

INSERT INTO Evento (Nombre, Descripción, Fecha_Inicio, Fecha_Fin, Lugar) VALUES 
('Festival de Flores', 'Evento anual con descuentos en flores y plantas', '2024-05-01', '2024-05-10', 'Centro de Convenciones'),
('Semana Floral', 'Semana de ofertas en arreglos florales', '2024-06-01', '2024-06-07', 'Sucursal Principal'),
('Promoción de Navidad', 'Descuento en todas las compras navideñas', '2024-12-01', '2024-12-25', 'Online y Tienda Física'),
('Exposición de Orquídeas', 'Exposición de orquídeas raras y exóticas', '2024-04-15', '2024-04-20', 'Jardín Botánico'),
('Taller de Arreglo Floral', 'Taller práctico de arreglos florales para principiantes', '2024-07-10', '2024-07-10', 'Sucursal Norte');

-- inventario:

INSERT INTO Inventario (ID_Producto, Stock_Anterior, Stock_Actual, Fecha) VALUES 
(1, 100, 98, '2024-02-15'),
(2, 50, 47, '2024-02-16'),
(3, 25, 22, '2024-02-17'),
(4, 75, 73, '2024-02-18'),
(5, 60, 59, '2024-02-19');

-- productos_temporales

INSERT INTO Productos_Temporales (Nombre, Descripcion, Precio, Cantidad, Tipo, Estacion) VALUES
('Rosa Roja', 'Rosa de color rojo intenso, ideal para expresar amor y pasión.', 15.50, 100, 'Flor', 'Primavera'),
('Orquídea Blanca', 'Orquídea elegante y delicada, perfecta para ocasiones especiales.', 45.00, 50, 'Orquídea', 'Verano'),
('Bouquet Primaveral', 'Arreglo floral con flores variadas típicas de la temporada primaveral.', 75.00, 25, 'Arreglo', 'Primavera'),
('Cactus Decorativo', 'Cactus pequeño para interiores, fácil de cuidar, ideal para decoración minimalista.', 20.00, 75, 'Planta', 'Invierno'),
('Girasol', 'Girasol de tallo alto, brillante y lleno de energía, ideal para alegrar cualquier espacio.', 12.00, 60, 'Flor', 'Verano');

-- Reportes financieros

INSERT INTO Reporte_Financiero (Fecha, Ingresos, Gastos, Beneficio) VALUES 
('2024-12-01', 2000.00, 800.00, 1200.00),
('2024-12-02', 2500.00, 1000.00, 1500.00),
('2024-12-03', 1800.00, 900.00, 900.00),
('2024-12-04', 2200.00, 1100.00, 1100.00),
('2024-12-05', 2300.00, 950.00, 1350.00);

-- Descuento

INSERT INTO Descuento (Descripción, Monto, Fecha_Inicio, Fecha_Fin) VALUES 
('Descuento de temporada', 20.00, '2024-11-01', '2024-11-30'),
('Descuento por compra mayor a 100$', 10.00, '2024-12-01', '2024-12-31'),
('Descuento en productos seleccionados', 5.00, '2024-02-01', '2024-02-28'),
('Descuento por fidelidad de cliente', 15.00, '2024-01-01', '2024-01-31'),
('Descuento navideño', 30.00, '2024-12-01', '2024-12-24');

-- Registro de eventos o actividades

INSERT INTO Registro_Generico (Tipo_Registro, Descripcion, Fecha, Usuario_Registro, Estado) VALUES
('Evento', 'Evento de lanzamiento de nuevos productos para la temporada de primavera.', '2024-12-01', 'Administrador', 'Activo'),
('Actividad', 'Reunión mensual del equipo de ventas para evaluar el rendimiento de la tienda.', '2024-12-05', 'Empleado', 'Concluido'),
('Noticia', 'Se ha recibido una nueva entrega de flores de la empresa proveedora Vivero Natural.', '2024-12-06', 'Empleado', 'Activo'),
('Evento', 'Campaña de Navidad con promociones especiales de arreglos florales.', '2024-12-10', 'Administrador', 'Activo'),
('Actividad', 'Taller de formación sobre cuidado y mantenimiento de plantas para el personal.', '2024-12-12', 'Empleado', 'Programado');


