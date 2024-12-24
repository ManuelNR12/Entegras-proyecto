use floristeria;

-- actualizar stock

DELIMITER $$

CREATE PROCEDURE ActualizarStockProducto(IN p_ID_Producto INT, IN p_CantidadVendida INT)
BEGIN
   
    UPDATE Producto
    SET Stock = Stock - p_CantidadVendida
    WHERE ID_Producto = p_ID_Producto;
END $$

DELIMITER ;



-- ingreso por producto

use floristeria;

DELIMITER $$

CREATE PROCEDURE ObtenerIngresosPorProducto(IN p_FechaInicio DATE, IN p_FechaFin DATE)
BEGIN
    
    SELECT 
        pr.Nombre AS Producto, 
        SUM(dp.Cantidad * dp.Precio_Unitario) AS Ingresos_Totales
    FROM Detalle_Pedido dp
    JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
    JOIN Pedido p ON dp.ID_Pedido = p.ID_Pedido
    WHERE p.Fecha BETWEEN p_FechaInicio AND p_FechaFin
    GROUP BY pr.ID_Producto
    ORDER BY Ingresos_Totales DESC;
END $$

DELIMITER ;


-- muestra la fecha de productos por orden de fecha
use floristeria;

DELIMITER $$

CREATE PROCEDURE ObtenerOrdenVentasPorRangoFechas(IN p_FechaInicio DATE, IN p_FechaFin DATE)
BEGIN
    
    SELECT 
        p.Fecha AS Fecha_Venta,
        pr.Nombre AS Producto,
        dp.Cantidad AS Cantidad_Vendida,
        dp.Precio_Unitario AS Precio_Unitario,
        (dp.Cantidad * dp.Precio_Unitario) AS Total_Venta
    FROM Detalle_Pedido dp
    JOIN Producto pr ON dp.ID_Producto = pr.ID_Producto
    JOIN Pedido p ON dp.ID_Pedido = p.ID_Pedido
    WHERE p.Fecha BETWEEN p_FechaInicio AND p_FechaFin
    ORDER BY p.Fecha ASC;
END $$

DELIMITER ;

