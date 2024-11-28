use floristeria;


-- vistas de producto con stock critico


SELECT 
    ID_Producto,
    Nombre,
    Tipo,
    Stock,
    Precio,
    CASE 
        WHEN Stock <= 20 THEN 'Crítico'
        WHEN Stock BETWEEN 21 AND 50 THEN 'Bajo'
        ELSE 'Normal'
    END AS Estado_Stock,
    ROUND((Stock / (SELECT AVG(Stock) FROM Producto)) * 100, 2) AS Porcentaje_Promedio_Stock
FROM Producto
WHERE Stock <= 50
ORDER BY Stock ASC;


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
ORDER BY Ingresos_Generados DESC;
