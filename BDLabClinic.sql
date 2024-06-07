-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bdlabclinic
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `clinica`
--

DROP TABLE IF EXISTS `clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinica` (
  `id_clinica` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id_clinica`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinica`
--

LOCK TABLES `clinica` WRITE;
/*!40000 ALTER TABLE `clinica` DISABLE KEYS */;
INSERT INTO `clinica` VALUES (1,'Clínica Dental Sonrisa','Calle Principal #123','555-1234','sonrisa@dental.com'),(2,'Centro Odontológico Familiar','Av. Central #456','555-5678','cof@dental.com'),(3,'Consultorio Dental Dr. Pérez','Calle A #789','555-9012','drperez@dental.com'),(4,'Dentalife','Av. B #321','555-6543','dentalife@dental.com'),(5,'Sonríe Siempre','Calle C #654','555-3210','sonriesiempre@dental.com');
/*!40000 ALTER TABLE `clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `id_usuario` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_empleado_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_empleado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Marvin Alexander ','Nuila',2,'maralex6_01@yahoo.com.mx','61060814');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_trabajo`
--

DROP TABLE IF EXISTS `orden_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_trabajo` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `descripcion_trabajo` varchar(255) DEFAULT NULL,
  `id_protesis` int NOT NULL,
  `fec_sol` date NOT NULL,
  `fec_entre` date NOT NULL,
  `estado` varchar(255) NOT NULL,
  `id_clinica` int NOT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `fk_orden_trabajo_protesis_idx` (`id_protesis`),
  KEY `fk_orden_trabajo_clinica_idx` (`id_clinica`),
  KEY `fk_orden_trabajo_empleado_idx` (`id_empleado`),
  CONSTRAINT `fk_orden_trabajo_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`),
  CONSTRAINT `fk_orden_trabajo_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `fk_orden_trabajo_protesis` FOREIGN KEY (`id_protesis`) REFERENCES `protesis` (`id_protesis`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_trabajo`
--

LOCK TABLES `orden_trabajo` WRITE;
/*!40000 ALTER TABLE `orden_trabajo` DISABLE KEYS */;
INSERT INTO `orden_trabajo` VALUES (1,'Corona de porcelana para molar superior derecho',1,'2024-05-20','2024-05-27','En proceso',1,1),(2,'Puente de 3 piezas para incisivos inferiores',2,'2024-05-21','2024-06-04','Completado',2,1);
/*!40000 ALTER TABLE `orden_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protesis`
--

DROP TABLE IF EXISTS `protesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protesis` (
  `id_protesis` int NOT NULL AUTO_INCREMENT,
  `nombre_protesis` varchar(255) NOT NULL,
  `garantia` int NOT NULL,
  `precio_protesis` int DEFAULT NULL,
  `id_tipo_protesis` int DEFAULT NULL,
  PRIMARY KEY (`id_protesis`),
  KEY `fk_protesis_tipo_protesis_idx` (`id_tipo_protesis`),
  CONSTRAINT `fk_protesis_tipo_protesis` FOREIGN KEY (`id_tipo_protesis`) REFERENCES `tipo_protesis` (`id_tipo_protesis`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protesis`
--

LOCK TABLES `protesis` WRITE;
/*!40000 ALTER TABLE `protesis` DISABLE KEYS */;
INSERT INTO `protesis` VALUES (1,'Corona de porcelana',6,150,1),(2,'Puente de 3 piezas',12,450,1),(3,'Incrustación de oro',24,200,1),(4,'Prótesis parcial acrílica',12,250,2),(5,'Prótesis completa',24,500,2),(6,'Aparato fijo metálico',12,300,3),(7,'Retenedor transparente',6,100,3),(8,'Carillas de porcelana',24,800,4),(9,'Blanqueamiento dental',12,150,4),(10,'Implante unitario',60,1200,5),(11,'Puente sobre 2 implantes',60,2400,5);
/*!40000 ALTER TABLE `protesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) NOT NULL,
  `descripcion_rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Administra el sistema del laboratorio clinico'),(2,'Vendedor','Encargado de ingresar las ordenes de trabajo'),(3,'Técnico de Laboratorio','Encargados de realizar los productos solicitados por el cliente');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_protesis`
--

DROP TABLE IF EXISTS `tipo_protesis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_protesis` (
  `id_tipo_protesis` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo_protesis` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_protesis`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_protesis`
--

LOCK TABLES `tipo_protesis` WRITE;
/*!40000 ALTER TABLE `tipo_protesis` DISABLE KEYS */;
INSERT INTO `tipo_protesis` VALUES (1,'Prótesis fija','Puentes, coronas, incrustaciones'),(2,'Prótesis removible','Prótesis parciales, prótesis completas'),(3,'Ortodoncia','Aparatos fijos, aparatos removibles'),(4,'Estética dental','Carillas, blanqueamiento'),(5,'Implantes dentales','Implantes unitarios, puentes sobre implantes');
/*!40000 ALTER TABLE `tipo_protesis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_rol_idx` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'admin123','Administrador'),(2,2,'12345','MNuila');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 21:02:14
