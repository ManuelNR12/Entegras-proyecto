-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: floristeria
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'María González','555-1234','maria.gonzalez@email.com'),(2,'Carlos Rodríguez','555-5678','carlos.rodriguez@email.com'),(3,'Ana Martínez','555-9012','ana.martinez@email.com'),(4,'Luis Fernández','555-3456','luis.fernandez@email.com'),(5,'Sofía López','555-7890','sofia.lopez@email.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `ID_Compra` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  PRIMARY KEY (`ID_Compra`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2024-02-10',500.00,1),(2,'2024-02-11',750.00,2),(3,'2024-02-12',600.50,2),(4,'2024-02-13',450.00,1),(5,'2024-02-14',550.75,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `ID_Descuento` int NOT NULL AUTO_INCREMENT,
  `Descripción` text,
  `Monto` decimal(10,2) DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  PRIMARY KEY (`ID_Descuento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
INSERT INTO `descuento` VALUES (1,'Descuento de temporada',20.00,'2024-11-01','2024-11-30'),(2,'Descuento por compra mayor a 100$',10.00,'2024-12-01','2024-12-31'),(3,'Descuento en productos seleccionados',5.00,'2024-02-01','2024-02-28'),(4,'Descuento por fidelidad de cliente',15.00,'2024-01-01','2024-01-31'),(5,'Descuento navideño',30.00,'2024-12-01','2024-12-24'),(6,'Descuento de temporada',20.00,'2024-11-01','2024-11-30'),(7,'Descuento por compra mayor a 100$',10.00,'2024-12-01','2024-12-31'),(8,'Descuento en productos seleccionados',5.00,'2024-02-01','2024-02-28'),(9,'Descuento por fidelidad de cliente',15.00,'2024-01-01','2024-01-31'),(10,'Descuento navideño',30.00,'2024-12-01','2024-12-24');
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `ID_Detalle_Compra` int NOT NULL AUTO_INCREMENT,
  `ID_Compra` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Detalle_Compra`),
  KEY `ID_Compra` (`ID_Compra`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`ID_Compra`) REFERENCES `compra` (`ID_Compra`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,1,50,10.00),(2,2,2,25,30.00),(3,3,3,10,60.00),(4,4,4,40,15.00),(5,5,5,60,9.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `ID_Detalle` int NOT NULL AUTO_INCREMENT,
  `ID_Pedido` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Detalle`),
  KEY `ID_Pedido` (`ID_Pedido`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,2,15.50),(2,1,3,1,75.00),(3,2,2,3,45.00),(4,3,4,2,20.00),(5,4,5,5,12.00);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_total_pedido` AFTER UPDATE ON `detalle_pedido` FOR EACH ROW BEGIN
    UPDATE Pedido
    SET Total = (SELECT SUM(Cantidad * Precio_Unitario) FROM Detalle_Pedido WHERE ID_Pedido = NEW.ID_Pedido)
    WHERE ID_Pedido = NEW.ID_Pedido;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `ID_Entrega` int NOT NULL AUTO_INCREMENT,
  `ID_Logística` int DEFAULT NULL,
  `ID_Pedido` int DEFAULT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Entrega`),
  KEY `ID_Logística` (`ID_Logística`),
  KEY `ID_Pedido` (`ID_Pedido`),
  CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`ID_Logística`) REFERENCES `logística` (`ID_Logística`),
  CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,1,1,'2024-02-16','Entregado'),(2,2,2,'2024-02-17','En proceso'),(3,3,3,'2024-02-18','Pendiente'),(4,4,4,'2024-02-19','En tránsito'),(5,5,5,'2024-02-20','Programado');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `registrar_cambio_estado_entrega` AFTER UPDATE ON `entrega` FOR EACH ROW BEGIN
    IF OLD.Estado != NEW.Estado THEN
        INSERT INTO Auditoria_Entrega (ID_Entrega, Estado_Anterior, Estado_Nuevo, Fecha_Cambio)
        VALUES (NEW.ID_Entrega, OLD.Estado, NEW.Estado, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `ID_Evento` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripción` text,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Lugar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Evento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Festival de Flores','Evento anual con descuentos en flores y plantas','2024-05-01','2024-05-10','Centro de Convenciones'),(2,'Semana Floral','Semana de ofertas en arreglos florales','2024-06-01','2024-06-07','Sucursal Principal'),(3,'Promoción de Navidad','Descuento en todas las compras navideñas','2024-12-01','2024-12-25','Online y Tienda Física'),(4,'Exposición de Orquídeas','Exposición de orquídeas raras y exóticas','2024-04-15','2024-04-20','Jardín Botánico'),(5,'Taller de Arreglo Floral','Taller práctico de arreglos florales para principiantes','2024-07-10','2024-07-10','Sucursal Norte');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `ID_Inventario` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` int DEFAULT NULL,
  `Stock_Anterior` int NOT NULL,
  `Stock_Actual` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`ID_Inventario`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,100,98,'2024-02-15'),(2,2,50,47,'2024-02-16'),(3,3,25,22,'2024-02-17'),(4,4,75,73,'2024-02-18'),(5,5,60,59,'2024-02-19');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logística`
--

DROP TABLE IF EXISTS `logística`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logística` (
  `ID_Logística` int NOT NULL AUTO_INCREMENT,
  `ID_Proveedor` int DEFAULT NULL,
  `Método` varchar(100) DEFAULT NULL,
  `Costo` decimal(10,2) DEFAULT NULL,
  `Tiempo_Estimado` int DEFAULT NULL,
  PRIMARY KEY (`ID_Logística`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `logística_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logística`
--

LOCK TABLES `logística` WRITE;
/*!40000 ALTER TABLE `logística` DISABLE KEYS */;
INSERT INTO `logística` VALUES (1,1,'Entrega Local',10.00,1),(2,1,'Entrega Metropolitana',20.00,2),(3,1,'Entrega Regional',35.00,3),(4,2,'Entrega Nacional',50.00,4),(5,2,'Entrega Especial',75.00,1);
/*!40000 ALTER TABLE `logística` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `ID_Pedido` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `ID_Cliente` int DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2024-02-15',90.50,1),(2,'2024-02-16',150.00,2),(3,'2024-02-17',225.00,3),(4,'2024-02-18',60.00,4),(5,'2024-02-19',180.50,5);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripción` text,
  `Precio` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Rosa Roja','Rosa de color rojo intenso',15.50,100,'Flor'),(2,'Orquídea Blanca','Orquídea elegante y delicada',45.00,50,'Orquídea'),(3,'Bouquet Primaveral','Arreglo floral con flores variadas',75.00,25,'Arreglo'),(4,'Cactus Decorativo','Cactus pequeño para interiores',20.00,75,'Planta'),(5,'Girasol','Girasol de tallo alto',12.00,60,'Flor');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_precio_producto` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN
    IF NEW.Precio <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio del producto debe ser mayor a cero';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `alerta_stock_critico` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
    IF NEW.Stock < 10 THEN
        INSERT INTO Inventario_Bajo (ID_Producto, Alerta)
        VALUES (NEW.ID_Producto, 'Alerta: El stock del producto es crítico.');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos_temporales`
--

DROP TABLE IF EXISTS `productos_temporales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_temporales` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` int NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Estacion` enum('Primavera','Verano','Otoño','Invierno') NOT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_temporales`
--

LOCK TABLES `productos_temporales` WRITE;
/*!40000 ALTER TABLE `productos_temporales` DISABLE KEYS */;
INSERT INTO `productos_temporales` VALUES (1,'Rosa Roja','Rosa de color rojo intenso, ideal para expresar amor y pasión.',15.50,100,'Flor','Primavera'),(2,'Orquídea Blanca','Orquídea elegante y delicada, perfecta para ocasiones especiales.',45.00,50,'Orquídea','Verano'),(3,'Bouquet Primaveral','Arreglo floral con flores variadas típicas de la temporada primaveral.',75.00,25,'Arreglo','Primavera'),(4,'Cactus Decorativo','Cactus pequeño para interiores, fácil de cuidar, ideal para decoración minimalista.',20.00,75,'Planta','Invierno'),(5,'Girasol','Girasol de tallo alto, brillante y lleno de energía, ideal para alegrar cualquier espacio.',12.00,60,'Flor','Verano');
/*!40000 ALTER TABLE `productos_temporales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Flores del Jardín S.A.','555-2345','contacto@floresdeljadin.com'),(2,'Vivero Natural','555-6789','ventas@viveronatural.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_generico`
--

DROP TABLE IF EXISTS `registro_generico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_generico` (
  `ID_Registro` int NOT NULL AUTO_INCREMENT,
  `Tipo_Registro` varchar(100) DEFAULT NULL,
  `Descripcion` text,
  `Fecha` date NOT NULL,
  `Usuario_Registro` varchar(100) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Registro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_generico`
--

LOCK TABLES `registro_generico` WRITE;
/*!40000 ALTER TABLE `registro_generico` DISABLE KEYS */;
INSERT INTO `registro_generico` VALUES (1,'Evento','Evento de lanzamiento de nuevos productos para la temporada de primavera.','2024-12-01','Administrador','Activo'),(2,'Actividad','Reunión mensual del equipo de ventas para evaluar el rendimiento de la tienda.','2024-12-05','Empleado','Concluido'),(3,'Noticia','Se ha recibido una nueva entrega de flores de la empresa proveedora Vivero Natural.','2024-12-06','Empleado','Activo'),(4,'Evento','Campaña de Navidad con promociones especiales de arreglos florales.','2024-12-10','Administrador','Activo'),(5,'Actividad','Taller de formación sobre cuidado y mantenimiento de plantas para el personal.','2024-12-12','Empleado','Programado');
/*!40000 ALTER TABLE `registro_generico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte_financiero`
--

DROP TABLE IF EXISTS `reporte_financiero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte_financiero` (
  `ID_Reporte` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Ingresos` decimal(10,2) NOT NULL,
  `Gastos` decimal(10,2) NOT NULL,
  `Beneficio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte_financiero`
--

LOCK TABLES `reporte_financiero` WRITE;
/*!40000 ALTER TABLE `reporte_financiero` DISABLE KEYS */;
INSERT INTO `reporte_financiero` VALUES (1,'2024-12-01',2000.00,800.00,1200.00),(2,'2024-12-02',2500.00,1000.00,1500.00),(3,'2024-12-03',1800.00,900.00,900.00),(4,'2024-12-04',2200.00,1100.00,1100.00),(5,'2024-12-05',2300.00,950.00,1350.00);
/*!40000 ALTER TABLE `reporte_financiero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_ingresos_por_logistica`
--

DROP TABLE IF EXISTS `vista_ingresos_por_logistica`;
/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_logistica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ingresos_por_logistica` AS SELECT 
 1 AS `Método`,
 1 AS `Ingresos_Generados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_por_cliente`
--

DROP TABLE IF EXISTS `vista_pedidos_por_cliente`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_por_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_por_cliente` AS SELECT 
 1 AS `ID_Cliente`,
 1 AS `Nombre`,
 1 AS `Número_Pedidos`,
 1 AS `Total_Gastado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pedidos_y_compras_por_fecha`
--

DROP TABLE IF EXISTS `vista_pedidos_y_compras_por_fecha`;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_y_compras_por_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pedidos_y_compras_por_fecha` AS SELECT 
 1 AS `Fecha`,
 1 AS `Número_Pedidos`,
 1 AS `Ingresos_Pedidos`,
 1 AS `Número_Compras`,
 1 AS `Ingresos_Compras`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_mas_vendidos`
--

DROP TABLE IF EXISTS `vista_productos_mas_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_mas_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_mas_vendidos` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Nombre`,
 1 AS `Tipo`,
 1 AS `Total_Vendido`,
 1 AS `Ingresos_Generados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock_productos`
--

DROP TABLE IF EXISTS `vista_stock_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_stock_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock_productos` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Nombre`,
 1 AS `Tipo`,
 1 AS `Stock`,
 1 AS `Precio`,
 1 AS `Estado_Stock`,
 1 AS `Porcentaje_Promedio_Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ingresos_mensuales`
--

DROP TABLE IF EXISTS `vw_ingresos_mensuales`;
/*!50001 DROP VIEW IF EXISTS `vw_ingresos_mensuales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ingresos_mensuales` AS SELECT 
 1 AS `Mes`,
 1 AS `Número_Pedidos`,
 1 AS `Ingresos_Totales`,
 1 AS `Valor_Promedio_Pedido`,
 1 AS `Pedido_Minimo`,
 1 AS `Pedido_Maximo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'floristeria'
--

--
-- Dumping routines for database 'floristeria'
--
/*!50003 DROP FUNCTION IF EXISTS `GetEstadoStockProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetEstadoStockProducto`(p_ID_Producto INT) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE stock INT;
    DECLARE estado VARCHAR(20);
-- stock q hay
    SELECT Stock INTO stock
    FROM Producto
    WHERE ID_Producto = p_ID_Producto;

 -- estado del stock
    IF stock <= 20 THEN
        SET estado = 'Crítico';
    ELSEIF stock BETWEEN 21 AND 50 THEN
        SET estado = 'Bajo';
    ELSE
        SET estado = 'Normal';
    END IF;

    RETURN estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetIngresosCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetIngresosCliente`(p_ID_Cliente INT, p_FechaInicio DATE, p_FechaFin DATE) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE totalIngresos DECIMAL(10, 2);

    -- Calcular ingresos por rango
    SELECT ROUND(SUM(p.Total), 2) INTO totalIngresos
    FROM Pedido p
    WHERE p.ID_Cliente = p_ID_Cliente
      AND p.Fecha BETWEEN p_FechaInicio AND p_FechaFin;

    -- Si no hay ingresos o pedido devolver valor a 0
    IF totalIngresos IS NULL THEN
        SET totalIngresos = 0;
    END IF;

    RETURN totalIngresos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPromedioProductosPorPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPromedioProductosPorPedido`(p_FechaInicio DATE, p_FechaFin DATE) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE totalProductos INT;
    DECLARE totalPedidos INT;
    DECLARE promedio DECIMAL(10, 2);

    
    SELECT SUM(Cantidad) INTO totalProductos
    FROM Detalle_Pedido dp
    JOIN Pedido p ON dp.ID_Pedido = p.ID_Pedido
    WHERE p.Fecha BETWEEN p_FechaInicio AND p_FechaFin;

    -- calcula pedidos porfecha
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStockProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockProducto`(IN p_ID_Producto INT, IN p_CantidadVendida INT)
BEGIN
   
    UPDATE Producto
    SET Stock = Stock - p_CantidadVendida
    WHERE ID_Producto = p_ID_Producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerIngresosPorProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerIngresosPorProducto`(IN p_FechaInicio DATE, IN p_FechaFin DATE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerOrdenVentasPorRangoFechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerOrdenVentasPorRangoFechas`(IN p_FechaInicio DATE, IN p_FechaFin DATE)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_ingresos_por_logistica`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_logistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingresos_por_logistica` AS select `l`.`Método` AS `Método`,sum(`p`.`Total`) AS `Ingresos_Generados` from ((`entrega` `e` join `logística` `l` on((`e`.`ID_Logística` = `l`.`ID_Logística`))) join `pedido` `p` on((`e`.`ID_Pedido` = `p`.`ID_Pedido`))) group by `l`.`Método` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_por_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_por_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_por_cliente` AS select `c`.`ID_Cliente` AS `ID_Cliente`,`c`.`Nombre` AS `Nombre`,count(`p`.`ID_Pedido`) AS `Número_Pedidos`,round(sum(`p`.`Total`),2) AS `Total_Gastado` from (`pedido` `p` join `cliente` `c` on((`p`.`ID_Cliente` = `c`.`ID_Cliente`))) group by `c`.`ID_Cliente` order by `Total_Gastado` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pedidos_y_compras_por_fecha`
--

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_y_compras_por_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pedidos_y_compras_por_fecha` AS select date_format(`p`.`Fecha`,'%Y-%m-%d') AS `Fecha`,count(`p`.`ID_Pedido`) AS `Número_Pedidos`,round(sum(`p`.`Total`),2) AS `Ingresos_Pedidos`,count(`c`.`ID_Compra`) AS `Número_Compras`,round(sum(`c`.`Total`),2) AS `Ingresos_Compras` from (`pedido` `p` left join `compra` `c` on((date_format(`p`.`Fecha`,'%Y-%m-%d') = date_format(`c`.`Fecha`,'%Y-%m-%d')))) group by `Fecha` order by `Fecha` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_mas_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_mas_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_mas_vendidos` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Nombre` AS `Nombre`,`p`.`Tipo` AS `Tipo`,sum(`dp`.`Cantidad`) AS `Total_Vendido`,round(sum((`dp`.`Cantidad` * `dp`.`Precio_Unitario`)),2) AS `Ingresos_Generados` from (`detalle_pedido` `dp` join `producto` `p` on((`dp`.`ID_Producto` = `p`.`ID_Producto`))) group by `p`.`ID_Producto` order by `Total_Vendido` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock_productos` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Nombre` AS `Nombre`,`p`.`Tipo` AS `Tipo`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio`,(case when (`p`.`Stock` <= 20) then 'Crítico' when (`p`.`Stock` between 21 and 50) then 'Bajo' else 'Normal' end) AS `Estado_Stock`,round(((`p`.`Stock` / `avg_stock`.`promedio_stock`) * 100),2) AS `Porcentaje_Promedio_Stock` from (`producto` `p` join (select avg(`producto`.`Stock`) AS `promedio_stock` from `producto`) `avg_stock`) where (`p`.`Stock` <= 50) order by `p`.`Stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ingresos_mensuales`
--

/*!50001 DROP VIEW IF EXISTS `vw_ingresos_mensuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ingresos_mensuales` AS select date_format(`pedido`.`Fecha`,'%Y-%m') AS `Mes`,count(`pedido`.`ID_Pedido`) AS `Número_Pedidos`,round(sum(`pedido`.`Total`),2) AS `Ingresos_Totales`,round(avg(`pedido`.`Total`),2) AS `Valor_Promedio_Pedido`,round(min(`pedido`.`Total`),2) AS `Pedido_Minimo`,round(max(`pedido`.`Total`),2) AS `Pedido_Maximo` from `pedido` group by `Mes` order by `Mes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
