use floristeria;

DELIMITER $$

CREATE TRIGGER actualizar_total_pedido AFTER UPDATE ON Detalle_Pedido
FOR EACH ROW
BEGIN
    UPDATE Pedido
    SET Total = (SELECT SUM(Cantidad * Precio_Unitario) FROM Detalle_Pedido WHERE ID_Pedido = NEW.ID_Pedido)
    WHERE ID_Pedido = NEW.ID_Pedido;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER registrar_cambio_estado_entrega AFTER UPDATE ON Entrega
FOR EACH ROW
BEGIN
    IF OLD.Estado != NEW.Estado THEN
        INSERT INTO Auditoria_Entrega (ID_Entrega, Estado_Anterior, Estado_Nuevo, Fecha_Cambio)
        VALUES (NEW.ID_Entrega, OLD.Estado, NEW.Estado, NOW());
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER alerta_stock_critico AFTER UPDATE ON Producto
FOR EACH ROW
BEGIN
    IF NEW.Stock < 10 THEN
        INSERT INTO Inventario_Bajo (ID_Producto, Alerta)
        VALUES (NEW.ID_Producto, 'Alerta: El stock del producto es crítico.');
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER validar_precio_producto BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF NEW.Precio <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del producto debe ser mayor a cero';
    END IF;
END $$

DELIMITER ;
