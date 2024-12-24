DROP DATABASE IF EXISTS floristeria;
CREATE DATABASE floristeria;
USE floristeria;

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Teléfono VARCHAR(15),
    Correo VARCHAR(100)
);


CREATE TABLE Proveedor (
    ID_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Teléfono VARCHAR(15),
    Correo VARCHAR(100)
);


CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Tipo VARCHAR(50)
);


CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Compra (
    ID_Compra INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);


CREATE TABLE Detalle_Pedido (
    ID_Detalle INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

CREATE TABLE Detalle_Compra (
    ID_Detalle_Compra INT PRIMARY KEY AUTO_INCREMENT,
    ID_Compra INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Compra) REFERENCES Compra(ID_Compra),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

CREATE TABLE Logística (
    ID_Logística INT PRIMARY KEY AUTO_INCREMENT,
    ID_Proveedor INT,
    Método VARCHAR(100),
    Costo DECIMAL(10, 2),
    Tiempo_Estimado INT, -- en días
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);


CREATE TABLE Entrega (
    ID_Entrega INT PRIMARY KEY AUTO_INCREMENT,
    ID_Logística INT,
    ID_Pedido INT,
    Fecha_Entrega DATE,
    Estado VARCHAR(50),
    FOREIGN KEY (ID_Logística) REFERENCES Logística(ID_Logística),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Evento (
    ID_Evento INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripción TEXT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Lugar VARCHAR(100)
);

CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY AUTO_INCREMENT,
    ID_Producto INT,
    Stock_Anterior INT NOT NULL,
    Stock_Actual INT NOT NULL,
    Fecha DATE,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);


CREATE TABLE Descuento (
    ID_Descuento INT PRIMARY KEY AUTO_INCREMENT,
    Descripción TEXT,
    Monto DECIMAL(10, 2),
    Fecha_Inicio DATE,
    Fecha_Fin DATE
);

CREATE TABLE Reporte_Financiero (
    ID_Reporte INT PRIMARY KEY AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Ingresos DECIMAL(10, 2) NOT NULL,
    Gastos DECIMAL(10, 2) NOT NULL,
    Beneficio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Productos_Temporales (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,  -- Nombre del producto (flor, planta o arreglo)
    Descripcion TEXT,  -- Descripción detallada del producto
    Precio DECIMAL(10, 2) NOT NULL,  -- Precio del producto
    Cantidad INT NOT NULL,  -- Cantidad disponible en inventario
    Tipo VARCHAR(50),  -- Tipo de producto (flor, planta, arreglo)
    Estacion ENUM('Primavera', 'Verano', 'Otoño', 'Invierno') NOT NULL  -- Estación en la que está disponible el producto
);

CREATE TABLE Transacción (
    ID_Transacción INT PRIMARY KEY AUTO_INCREMENT,
    ID_Venta INT,
    Monto DECIMAL(10, 2) NOT NULL,
    Fecha DATE NOT NULL,
    Tipo_Pago VARCHAR(50),  -- O usar ENUM si hay valores fijos
    Estado VARCHAR(50),  -- O usar ENUM si hay valores fijos
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta)
);

CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY AUTO_INCREMENT,
    Fecha_Venta DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL
);
    
    



