use floristeria;


-- vistas de producto con stock critico


CREATE VIEW Vista_Stock_Productos AS
SELECT 
    p.ID_Producto,
    p.Nombre,
    p.Tipo,
    p.Stock,
    p.Precio,
    CASE 
        WHEN p.Stock <= 20 THEN 'Crítico'
        WHEN p.Stock BETWEEN 21 AND 50 THEN 'Bajo'
        ELSE 'Normal'
    END AS Estado_Stock,
    ROUND((p.Stock / avg_stock.promedio_stock) * 100, 2) AS Porcentaje_Promedio_Stock
FROM Producto p
JOIN (SELECT AVG(Stock) AS promedio_stock FROM Producto) avg_stock
WHERE p.Stock <= 50
ORDER BY p.Stock ASC;


-- vistas de ingresos mensuales 

CREATE VIEW VW_Ingresos_Mensuales AS
SELECT 
    DATE_FORMAT(Fecha, '%Y-%m') AS Mes,
    COUNT(ID_Pedido) AS Número_Pedidos,
    ROUND(SUM(Total), 2) AS Ingresos_Totales,
    ROUND(AVG(Total), 2) AS Valor_Promedio_Pedido,
    ROUND(MIN(Total), 2) AS Pedido_Minimo,
    ROUND(MAX(Total), 2) AS Pedido_Maximo
FROM Pedido
GROUP BY Mes
ORDER BY Mes;

-- vistas de ingresos por logistica

CREATE VIEW Vista_Ingresos_Por_Logistica AS
SELECT l.Método, SUM(p.Total) AS Ingresos_Generados
FROM Entrega e
JOIN Logística l ON e.ID_Logística = l.ID_Logística
JOIN Pedido p ON e.ID_Pedido = p.ID_Pedido
GROUP BY l.Método


-- vistas productos mas vendidos:

CREATE VIEW Vista_Productos_Mas_Vendidos AS
SELECT 
    p.ID_Producto,
    p.Nombre,
    p.Tipo,
    SUM(dp.Cantidad) AS Total_Vendido,
    ROUND(SUM(dp.Cantidad * dp.Precio_Unitario), 2) AS Ingresos_Generados
FROM Detalle_Pedido dp
JOIN Producto p ON dp.ID_Producto = p.ID_Producto
GROUP BY p.ID_Producto

-- vista pedido por cliente

CREATE VIEW Vista_Pedidos_Por_Cliente AS
SELECT 
    c.ID_Cliente,
    c.Nombre,
    COUNT(p.ID_Pedido) AS Número_Pedidos,
    ROUND(SUM(p.Total), 2) AS Total_Gastado
FROM Pedido p
JOIN Cliente c ON p.ID_Cliente = c.ID_Cliente
GROUP BY c.ID_Cliente
ORDER BY Total_Gastado DESC;

-- vista pedidos y compras por fecha

CREATE VIEW Vista_Pedidos_Y_Compras_Por_Fecha AS
SELECT 
    DATE_FORMAT(p.Fecha, '%Y-%m-%d') AS Fecha,
    COUNT(p.ID_Pedido) AS Número_Pedidos,
    ROUND(SUM(p.Total), 2) AS Ingresos_Pedidos,
    COUNT(c.ID_Compra) AS Número_Compras,
    ROUND(SUM(c.Total), 2) AS Ingresos_Compras
FROM Pedido p
LEFT JOIN Compra c ON DATE_FORMAT(p.Fecha, '%Y-%m-%d') = DATE_FORMAT(c.Fecha, '%Y-%m-%d')
GROUP BY Fecha
ORDER BY Fecha;





