USE floristeria;

-- tabla Cliente

INSERT INTO  Cliente (Nombre, Teléfono, Correo) VALUES
('María González', '555-1234', 'maria.gonzalez@email.com'),
('Carlos Rodríguez', '555-5678', 'carlos.rodriguez@email.com'),
('Ana Martínez', '555-9012', 'ana.martinez@email.com'),
('Luis Fernández', '555-3456', 'luis.fernandez@email.com'),
('Sofía López', '555-7890', 'sofia.lopez@email.com');

-- tabla proveedor

INSERT INTO Proveedor (Nombre, Teléfono, Correo) VALUES
('Flores del Jardín S.A.', '555-2345', 'contacto@floresdeljadin.com'),
('Vivero Natural', '555-6789', 'ventas@viveronatural.com');

-- tabla Producto
INSERT INTO Producto (Nombre, Descripción, Precio, Stock, Tipo) VALUES
('Rosa Roja', 'Rosa de color rojo intenso', 15.50, 100, 'Flor'),
('Orquídea Blanca', 'Orquídea elegante y delicada', 45.00, 50, 'Orquídea'),
('Bouquet Primaveral', 'Arreglo floral con flores variadas', 75.00, 25, 'Arreglo'),
('Cactus Decorativo', 'Cactus pequeño para interiores', 20.00, 75, 'Planta'),
('Girasol', 'Girasol de tallo alto', 12.00, 60, 'Flor');

-- tabla Pedido
INSERT INTO Pedido (Fecha, Total, ID_Cliente) VALUES
('2024-02-15', 90.50, 1),
('2024-02-16', 150.00, 2),
('2024-02-17', 225.00, 3),
('2024-02-18', 60.00, 4),
('2024-02-19', 180.50, 5);

--  tabla Compra
INSERT INTO Compra (Fecha, Total, ID_Proveedor) VALUES
('2024-02-10', 500.00, 1),
('2024-02-11', 750.00, 2),
('2024-02-12', 600.50, 2),
('2024-02-13', 450.00, 1),
('2024-02-14', 550.75, 1);

--  tabla Detalle_Pedido
INSERT INTO Detalle_Pedido (ID_Pedido, ID_Producto, Cantidad, Precio_Unitario) VALUES
(1, 1, 2, 15.50),
(1, 3, 1, 75.00),
(2, 2, 3, 45.00),
(3, 4, 2, 20.00),
(4, 5, 5, 12.00);

-- tabla Detalle_Compra
INSERT INTO Detalle_Compra (ID_Compra, ID_Producto, Cantidad, Precio_Unitario) VALUES
(1, 1, 50, 10.00),
(2, 2, 25, 30.00),
(3, 3, 10, 60.00),
(4, 4, 40, 15.00),
(5, 5, 60, 9.00);

-- Tabla logistica interna
INSERT INTO Logística (ID_Proveedor, Método, Costo, Tiempo_Estimado) VALUES
(1, 'Entrega Local', 10.00, 1),
(1, 'Entrega Metropolitana', 20.00, 2),
(1, 'Entrega Regional', 35.00, 3),
(2, 'Entrega Nacional', 50.00, 4),
(2, 'Entrega Especial', 75.00, 1);

-- Tabla entrega

INSERT INTO Entrega (ID_Logística, ID_Pedido, Fecha_Entrega, Estado) VALUES
(1, 1, '2024-02-16', 'Entregado'),
(2, 2, '2024-02-17', 'En proceso'),
(3, 3, '2024-02-18', 'Pendiente'),
(4, 4, '2024-02-19', 'En tránsito'),
(5, 5, '2024-02-20', 'Programado');
