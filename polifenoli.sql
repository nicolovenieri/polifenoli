-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: polifenoli
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `user_id` int NOT NULL,
  `wine_id` int NOT NULL,
  `quantity` int NOT NULL,
  `deleted` varchar(1) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_user_user_id_fk` (`user_id`),
  KEY `cart_wine_wine_id_fk` (`wine_id`),
  CONSTRAINT `cart_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `cart_wine_wine_id_fk` FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9,1,1,0,'Y'),(10,1,1,0,'Y'),(11,1,2,0,'Y'),(12,1,3,0,'Y'),(13,1,1,0,'Y'),(14,1,3,0,'Y'),(15,1,1,0,'Y'),(16,2,1,0,'Y'),(17,2,3,0,'Y'),(18,2,2,0,'Y'),(19,2,2,0,'Y'),(20,2,1,0,'Y'),(21,2,1,0,'Y'),(22,2,1,0,'Y'),(23,2,1,0,'Y'),(24,2,3,0,'Y'),(25,2,4,0,'Y'),(26,2,2,0,'Y'),(27,2,3,0,'Y'),(28,2,4,0,'Y'),(29,2,6,0,'Y'),(30,2,2,0,'Y'),(31,2,1,0,'Y'),(32,2,5,0,'Y'),(33,2,3,0,'Y'),(34,2,4,0,'Y'),(35,2,5,0,'Y'),(36,2,2,0,'Y'),(37,2,3,0,'Y'),(38,2,4,0,'Y'),(39,1,1,0,'Y'),(40,1,1,0,'Y'),(41,1,2,0,'Y'),(42,1,2,0,'Y'),(43,1,4,0,'Y'),(44,1,2,0,'Y'),(45,1,3,0,'Y'),(46,1,1,0,'Y'),(47,1,4,0,'Y'),(48,1,3,0,'Y'),(49,1,12,0,'Y'),(50,1,4,0,'Y'),(51,1,4,0,'Y'),(52,1,4,0,'Y'),(53,1,2,0,'Y'),(54,1,12,0,'Y'),(55,1,14,0,'Y'),(56,1,1,0,'Y'),(57,1,1,0,'Y'),(58,1,15,0,'Y'),(59,1,2,0,'Y'),(60,1,1,0,'Y'),(61,1,3,0,'Y');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `counterId` varchar(20) NOT NULL,
  `counterValue` int NOT NULL,
  PRIMARY KEY (`counterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES ('cart_id',61),('coupon_id',3),('order_id',48),('preference_id',4),('showcase_id',3),('user_id',8),('wine_id',25),('wishlist_id',5);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `coupon_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `discount` int NOT NULL,
  `exp_date` date NOT NULL,
  `deleted` varchar(1) NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'ROBERTO',5,'2020-07-10','N'),(2,'SUMMER',23,'2021-08-12','N'),(3,'clelia',99,'2020-07-26','N');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `wine_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_user_id_fk` (`user_id`),
  KEY `order_wine_wine_id_fk` (`wine_id`),
  CONSTRAINT `order_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_wine_wine_id_fk` FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,1,'maispedito','2020-07-07 08:16:53','N',0.00),(2,2,1,1,'Processamento ordine','2020-07-10 13:32:29','N',0.00),(3,2,3,2,'Processamento ordine','2020-07-10 13:32:29','N',0.00),(4,2,1,1,'Processamento ordine','2020-07-10 15:43:13','N',0.00),(5,2,3,2,'Processamento ordine','2020-07-10 15:43:13','N',0.00),(6,2,1,1,'Processamento ordine','2020-07-11 10:19:43','N',0.00),(7,2,3,2,'Processamento ordine','2020-07-11 10:19:43','N',0.00),(8,2,1,4,'Processamento ordine','2020-07-11 10:29:42','N',0.00),(9,2,3,2,'Processamento ordine','2020-07-11 10:29:42','N',0.00),(10,2,1,4,'Processamento ordine','2020-07-11 10:30:34','N',0.00),(11,2,3,2,'Processamento ordine','2020-07-11 10:30:34','N',0.00),(12,2,1,4,'Processamento ordine','2020-07-12 11:12:59','N',11.00),(13,2,1,1,'Processamento ordine','2020-07-12 11:13:47','N',34.00),(14,2,3,1,'Processamento ordine','2020-07-12 11:13:47','N',34.00),(15,2,4,1,'Processamento ordine','2020-07-12 11:13:47','N',34.00),(16,2,3,1,'Processamento ordine','2020-07-12 16:44:40','N',10.00),(17,2,6,3,'Processamento ordine','2020-07-12 16:44:40','N',10.00),(18,2,2,1,'Processamento ordine','2020-07-12 16:48:08','N',25.00),(19,2,1,1,'Processamento ordine','2020-07-12 17:46:21','N',10.97),(20,2,5,1,'Ordine consegnato','2020-07-12 17:48:26','N',27.93),(21,2,3,1,'Ordine consegnato','2020-07-12 17:48:26','N',27.93),(22,2,4,1,'Processamento ordine','2020-07-13 09:15:55','N',32.92),(23,2,5,3,'Processamento ordine','2020-07-13 09:15:55','N',32.92),(24,1,1,3,'Processamento ordine','2020-07-13 13:20:41','N',10.97),(25,1,1,2,'Processamento ordine','2020-07-15 15:51:14','N',35.91),(26,1,2,2,'Processamento ordine','2020-07-15 15:51:14','N',35.91),(27,2,2,3,'Ordine spedito','2020-07-17 09:50:27','N',102.90),(28,2,3,1,'Ordine spedito','2020-07-17 09:50:27','N',102.90),(29,2,4,1,'Ordine spedito','2020-07-17 09:50:27','N',102.90),(30,1,2,2,'Processamento ordine','2020-07-19 10:52:16','N',96.60),(31,1,4,3,'Processamento ordine','2020-07-19 10:52:16','N',96.60),(32,1,2,1,'Processamento ordine','2020-07-19 10:58:43','N',35.70),(33,1,3,1,'Processamento ordine','2020-07-19 10:58:43','N',35.70),(34,1,1,1,'Processamento ordine','2020-07-19 15:36:33','N',11.55),(35,1,4,1,'Processamento ordine','2020-07-19 15:37:20','N',14.70),(36,1,3,1,'Processamento ordine','2020-07-19 15:37:37','N',9.45),(37,1,12,1,'Processamento ordine','2020-07-19 15:46:43','N',14.18),(38,1,4,3,'Processamento ordine','2020-07-19 15:55:10','N',44.10),(39,1,4,1,'Ordine consegnato','2020-07-19 15:59:33','N',14.70),(40,1,4,3,'Processamento ordine','2020-07-19 16:55:10','N',44.10),(41,1,2,2,'Processamento ordine','2020-07-20 12:53:56','N',66.22),(42,1,12,1,'Processamento ordine','2020-07-20 12:53:56','N',66.22),(43,1,14,1,'Processamento ordine','2020-07-20 12:53:56','N',66.22),(44,1,1,1,'Processamento ordine','2020-07-20 12:53:56','N',66.22),(45,1,1,32,'Ordine consegnato','2020-07-20 12:55:12','N',351.12),(46,1,15,5,'Ordine consegnato','2020-07-22 12:12:44','N',0.86),(47,1,2,1,'Ordine consegnato','2020-07-22 12:12:44','N',0.86),(48,1,3,1,'Ordine consegnato','2020-07-22 12:12:44','N',0.86);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preference` (
  `preference_id` int NOT NULL,
  `user_id` int NOT NULL,
  `category` varchar(32) NOT NULL,
  `times` int NOT NULL,
  `deleted` varchar(1) NOT NULL,
  PRIMARY KEY (`preference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (2,1,'Spumante',6,'N'),(3,1,'Bianco',8,'N'),(4,1,'Rosso',11,'N');
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showcase`
--

DROP TABLE IF EXISTS `showcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showcase` (
  `showcase_id` int NOT NULL,
  `wine_id` int DEFAULT NULL,
  `deleted` varchar(1) NOT NULL,
  PRIMARY KEY (`showcase_id`),
  UNIQUE KEY `showcase_wine_id_uindex` (`wine_id`),
  CONSTRAINT `showcase__wine_wine_id_fk` FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showcase`
--

LOCK TABLES `showcase` WRITE;
/*!40000 ALTER TABLE `showcase` DISABLE KEYS */;
INSERT INTO `showcase` VALUES (1,1,'N'),(2,2,'N'),(3,4,'N');
/*!40000 ALTER TABLE `showcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `cap` int DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `civic` varchar(10) DEFAULT NULL,
  `card_n` varchar(16) DEFAULT NULL COMMENT 'bigint per contenere le cifre della carta\n',
  `cvc` int DEFAULT NULL,
  `exp_date` varchar(5) DEFAULT NULL,
  `admin` varchar(1) NOT NULL,
  `deleted` varchar(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ff','ff','fogli.federico.98@gmail.com','Federico','Fogli','3491110049','Ferrara',44122,'Via Bentivoglio 229','12','1234123412341234',345,'12/22','N','N'),(2,'francescop','francescop','fra.pall8o@gmail.com','Francesco','Pallotta','3312818993','Ferrara',44124,'Via Riccardo Nielsen 13/A','','',0,'','Y','N'),(3,'root','root',NULL,'root','user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','N'),(7,'a','a',NULL,'a','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N','Y'),(8,'aa','aa',NULL,'aa','aa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','Y');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine`
--

DROP TABLE IF EXISTS `wine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wine` (
  `wine_id` int NOT NULL,
  `name` varchar(96) DEFAULT NULL,
  `product_image` varchar(256) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `denominazione` varchar(30) DEFAULT NULL,
  `annata` varchar(10) DEFAULT NULL,
  `avalaibility` int DEFAULT NULL,
  `vitigni` varchar(50) DEFAULT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `format` varchar(30) DEFAULT NULL,
  `alcool` int DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`wine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabella contenente i prodotti presenti nel catalogo del sito.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine`
--

LOCK TABLES `wine` WRITE;
/*!40000 ALTER TABLE `wine` DISABLE KEYS */;
INSERT INTO `wine` VALUES (1,'Sicilia Grillo DOC','https://images.unsplash.com/photo-1474722883778-792e7990302f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80',11.00,'Sicilia DOC','2019',731,'grillo','8','0.75',13,'Bianco','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.Nam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Pellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(2,'Champagne Brut Rosé - Bernard Remy','https://images.unsplash.com/photo-1585553616435-2dc0a54e271d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',25.00,'Champagne AOC','2018',17,'pinot noir','8','0.75',12,'Spumante','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(3,'Terre Siciliane Catarratto Lucido IGT 2018 - Corte','https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',9.00,'Terre Siciliane IGT','2019/2022',18,'catarratto lucido 100%','12.5','0.75',12,'Bianco','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(4,'Friuli Colli Orientali Sauvignon DOC 2018 - Dri Ro','https://images.unsplash.com/photo-1544804066-ff04a3f1ab8b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',14.00,'Friuli Colli Orient','2018',5,'sauvignon 100%','8/10','0.75',12,'Rosso','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(5,'Trento DOC Max Blanc de Blancs - Ferrari','https://images.unsplash.com/photo-1561461056-77634126673a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q',19.00,'Trento DOC','NV',43,'chardonnay 100%','6/8','075',12,'caca','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(6,'1','https://images.unsplash.com/photo-1553361371-9b22f78e8b1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',1.00,'1','1',1,'1','1','1',1,'1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','Y'),(10,'jkh','jlhg',49645.00,'kjh;f','9023847',983274,'239874','239847','3298',23987,'239874','239874','Y'),(11,'Alto Adige Gewarztraminer DOC ','https://images.unsplash.com/photo-1507434965515-61970f2bd7c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',13.90,'Alto Adige DOC','2019',213,'gewarztraminer 100%','','10/12',13,'Bianco','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(12,'Franciacorta Brut DOCG - Fratelli Berlucchi','https://images.unsplash.com/photo-1587920710219-f6f9804dc10d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',13.50,'Franciacorta DOCG','2017',54,'chardonnay, pinot bianco','8/10 ÃÂ°C','0.75l',12,'Spumante','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(13,'Irpinia Rosato DOC ','https://images.unsplash.com/photo-1554230561-31bdc707b537?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',8.90,'Irpinia Rosato DOC','2019',78,'aglianico 100%','10/12','0.75',12,'Altro','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.\r\n\r\nNam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nPellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(14,'Prosecco Frizzante DOC - Bosco Levada','https://images.unsplash.com/photo-1553653760-7e5d1fde3cd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80',7.40,'Prosecco DOC','NV',122,'glera 100%','6/8','0.75',11,'Spumante','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius cursus bibendum. Phasellus non feugiat quam. Duis nec risus eu nisi ultricies vehicula in a purus. Suspendisse porta urna dictum consequat viverra. Donec nec purus lacinia, mollis turpis a, pellentesque erat. Nulla dolor urna, dignissim id nisl consequat, gravida ultricies mi. Morbi nisi lorem, ultrices quis orci id, volutpat aliquet dolor. Integer scelerisque lectus non tellus sollicitudin, eu aliquam sapien dignissim. Fusce sit amet mauris consequat, rutrum diam vel, tempus quam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque aliquam ante id ultrices consectetur. Duis aliquam rutrum tempor. Aliquam pharetra libero nec lacus dignissim, vel dignissim massa pharetra. Proin gravida tortor id leo laoreet, sit amet vehicula justo hendrerit.  Nam dictum malesuada erat non tincidunt. Nullam a convallis leo, vel ultricies ligula. Nulla sollicitudin tempor eros, ac luctus ligula efficitur eu. Etiam pharetra tristique hendrerit. Fusce tempor iaculis lectus, vitae semper ante. Fusce justo mi, varius sit amet bibendum nec, efficitur in eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.  Pellentesque convallis massa in lorem maximus, dictum facilisis massa lacinia. Nullam at mauris ac enim porta aliquet vitae sit amet orci. Suspendisse.','N'),(15,'Salento Susumaniello IGT Serre 2018 - Due Palme','https://images.unsplash.com/photo-1560148218-1a83060f7b32?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80',9.50,'Salento IGT','2018',0,'susumaniello','16/18','0.75',13,'Rosso','NOTE DI DEGUSTAZIONE Rosso rubino, profondo e intenso. Al naso esprime sentori di frutti rossi anche in confettura e in chiusura di grafite. Al palato ÃÂ¨ deciso, in splendido equilibrio tra frutta matura e soliditÃÂ  minerale. Di ottima persistenza.  ABBINAMENTI A tutto pasto, si esalta con formaggi di media stagionatura come il tipico caciocavallo.  CANTINA Nata nel 1989 a Cellino San Marco, in provincia di Brindisi, la cantina Due Palme si ÃÂ¨ velocemente affermata come una delle piÃÂ¹ interessanti realtÃÂ  cooperative non solo della Puglia ma di tutta... vai alla scheda della cantina  SALENTO SUSUMANIELLO IGT Ã¢ÂÂSERREÃ¢ÂÂ 2018 - DUE PALME: PERCHÃÂ CI PIACE Una delle sperimentazioni piÃÂ¹ interessanti portate avanti da Due Palme ha a che fare con il susumaniello, tradizionale varietÃÂ  pugliese che grazie al lavoro del team di Angelo Maci oggi vive una seconda giovinezza. Vitigno di probabili origini dalmate, deve il nome alla caratteristica di essere particolarmente produttivo in etÃÂ  giovanile, tanto da Ã¢ÂÂcaricarsi come un asinoÃ¢ÂÂ, da cui lÃ¢ÂÂappellativo. Vinificato in acciaio e lasciato maturare in barrique per circa 6 mesi, nel bicchiere si rivela con un piacevole profilo fruttato, dinamico e vitale. Una vera e propria sorpresa.','N'),(16,'Cotes du Rhone Rouge Villages Visan ','https://images.unsplash.com/photo-1490344948579-6632f4807a6a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',1.00,'Cotes du Rhone AOC','2019',122,'grenache, syrah, cinsault, carignan','14','0.75',13,'Rosso','NOTE DI DEGUSTAZIONE Il vino si presenta limpido e di un bel color rosso porpora, vivace e fitto. Al naso si esprime principalmente su note di frutta matura, ciliegie, marasche, prugne, non manca di essere arricchito da sentori speziati. Al palato ÃÂ¨ intenso ed equilibrato, il tannino ÃÂ¨ sodo ma la morbidezza lo arrotonda.  ABBINAMENTI ÃÂ perfetto con primi conditi con sughi di carne, o con formaggi saporiti.  CANTINA Domaine la Florane ha una storia particolare che unisce tre generazioni di vigneron e due terroir, mantenendo una filosofia condivisa che sta alla base di un\'unica identitÃÂ . Il proprietario-enologo... vai alla scheda della cantina  CÃÂTES DU RHÃÂNE ROUGE VILLAGES VISAN ','N'),(24,'Falanghina del Sannio DOC \"Serrocielo\" 2019 - Feud','https://images.unsplash.com/photo-1575136087248-7f2ea5f2fe36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80',12000.00,'adfwsagafgad dfv','2009',5,'1','1','1',1,'1','1','N');
/*!40000 ALTER TABLE `wine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL,
  `user_id` int NOT NULL,
  `wine_id` int NOT NULL,
  `deleted` varchar(1) NOT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `wishlist_user_user_id_fk` (`user_id`),
  KEY `wishlist_wine_wine_id_fk` (`wine_id`),
  CONSTRAINT `wishlist_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `wishlist_wine_wine_id_fk` FOREIGN KEY (`wine_id`) REFERENCES `wine` (`wine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,2,4,'N'),(2,1,1,'Y'),(3,2,1,'N'),(4,1,3,'Y'),(5,1,1,'N');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 14:37:46
