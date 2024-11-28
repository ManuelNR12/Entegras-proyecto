use floristeria;

DELIMITER $$

CREATE FUNCTION GetEstadoStockProducto(p_ID_Producto INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE stock INT;
    DECLARE estado VARCHAR(20);

    -- Obtener el stock del producto
    SELECT Stock INTO stock
    FROM Producto
    WHERE ID_Producto = p_ID_Producto;

    -- Determinar el estado del stock
    IF stock <= 20 THEN
        SET estado = 'Crítico';
    ELSEIF stock BETWEEN 21 AND 50 THEN
        SET estado = 'Bajo';
    ELSE
        SET estado = 'Normal';
    END IF;

    RETURN estado;
END $$

DELIMITER ;

-- funcion 2


use floristeria;

DELIMITER $$

CREATE FUNCTION GetPromedioProductosPorPedido(p_FechaInicio DATE, p_FechaFin DATE)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalProductos INT;
    DECLARE totalPedidos INT;
    DECLARE promedio DECIMAL(10, 2);

    -- Calcular el total de productos vendidos en el rango de fechas
    SELECT SUM(Cantidad) INTO totalProductos
    FROM Detalle_Pedido dp
    JOIN Pedido p ON dp.ID_Pedido = p.ID_Pedido
    WHERE p.Fecha BETWEEN p_FechaInicio AND p_FechaFin;

    -- Calcular el total de pedidos en el rango de fechas
    SELECT COUNT(DISTINCT p.ID_Pedido) INTO totalPedidos
    FROM Pedido p
    WHERE p.Fecha BETWEEN p_FechaInicio AND p_FechaFin;

    -- Si no hay pedidos, devolver 0
    IF totalPedidos = 0 THEN
        SET promedio = 0;
    ELSE
        -- Calcular el promedio de productos por pedido
        SET promedio = ROUND(totalProductos / totalPedidos, 2);
    END IF;

    RETURN promedio;
END $$

DELIMITER ;


--- funcion 3

use floristeria;

DELIMITER $$

CREATE FUNCTION GetIngresosCliente(p_ID_Cliente INT, p_FechaInicio DATE, p_FechaFin DATE)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalIngresos DECIMAL(10, 2);

    -- Calcular los ingresos totales del cliente dentro del rango de fechas
    SELECT ROUND(SUM(p.Total), 2) INTO totalIngresos
    FROM Pedido p
    WHERE p.ID_Cliente = p_ID_Cliente
      AND p.Fecha BETWEEN p_FechaInicio AND p_FechaFin;

    -- Si no hay ingresos (por ejemplo, si no hay pedidos), devolver 0
    IF totalIngresos IS NULL THEN
        SET totalIngresos = 0;
    END IF;

    RETURN totalIngresos;
END $$

DELIMITER ;
