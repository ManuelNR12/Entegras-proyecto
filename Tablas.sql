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



-- Tabla de Hechos (Ventas_Mensuales)
CREATE TABLE Ventas_Mensuales (
    ID_Venta_Mensual INT PRIMARY KEY AUTO_INCREMENT,
    Año INT NOT NULL,
    Mes INT NOT NULL,
    ID_Producto INT,
    Cantidad_Vendida INT NOT NULL,
    Ingresos_Totales DECIMAL(12, 2) NOT NULL,
    Costo_Total DECIMAL(12, 2) NOT NULL,
    Margen_Beneficio DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);



-- Tablas Transaccionales
CREATE TABLE Devoluciones (
    ID_Devolucion INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT,
    ID_Producto INT,
    Fecha_Devolucion DATE NOT NULL,
    Cantidad INT NOT NULL,
    Motivo TEXT,
    Estado VARCHAR(50),
    Monto_Reembolso DECIMAL(10, 2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);



CREATE TABLE Pagos (
    ID_Pago INT PRIMARY KEY AUTO_INCREMENT,
    ID_Pedido INT,
    Fecha_Pago DATE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    Metodo_Pago VARCHAR(50),
    Estado VARCHAR(50),
    Referencia VARCHAR(100),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);



-- Tablas Complementarias
CREATE TABLE Categoria_Producto (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);


    
CREATE TABLE Producto_Categoria (
    ID_Producto INT,
    ID_Categoria INT,
    PRIMARY KEY (ID_Producto, ID_Categoria),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria_Producto(ID_Categoria)
);


CREATE TABLE Historial_Precios (
    ID_Historial INT PRIMARY KEY AUTO_INCREMENT,
    ID_Producto INT,
    Precio_Anterior DECIMAL(10, 2) NOT NULL,
    Precio_Nuevo DECIMAL(10, 2) NOT NULL,
    Fecha_Cambio DATE NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);





