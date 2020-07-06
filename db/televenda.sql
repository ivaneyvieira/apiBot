-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bi
-- ------------------------------------------------------
-- Server version	5.6.47

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `televenda`
--

DROP TABLE IF EXISTS `televenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `televenda` (
  `lista` int(11) NOT NULL,
  `grupo` varchar(60) NOT NULL,
  `numero` int(11) NOT NULL,
  `vendedor` varchar(50) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `ultimoAcesso` datetime DEFAULT NULL,
  KEY `lista` (`lista`,`ultimoAcesso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `televenda`
--

LOCK TABLES `televenda` WRITE;
/*!40000 ALTER TABLE `televenda` DISABLE KEYS */;
INSERT INTO `televenda` VALUES (1,'Telefonia & Informática',1,'Carlos Eduardo','(86) 98164-4335','2020-07-06 17:09:08'),(1,'Telefonia & Informática',2,'Aldir','(86) 98858-0426','2020-07-06 17:07:29'),(1,'Telefonia & Informática',3,'Iris','(86) 98858-0006','2020-07-06 17:07:02'),(1,'Telefonia & Informática',4,'Auricélia','(86) 98858-0009','2020-07-06 17:00:08'),(1,'Telefonia & Informática',5,'Francisco Wellington','(86) 98858-0476','2020-07-06 17:08:11'),(2,'Eletrodomésticos & Eletroportáteis ',6,'Adriana ','(86) 98858-0382','2020-06-28 23:55:10'),(2,'Eletrodomésticos & Eletroportáteis ',7,'Wallas','(86) 98876-2485','2020-06-28 23:55:09'),(2,'Eletrodomésticos & Eletroportáteis ',8,'Antônio Marcos','(86) 98195-3413','2020-06-28 23:55:12'),(2,'Eletrodomésticos & Eletroportáteis ',9,'Iracema','(86) 98113-4235','2020-06-28 23:55:11'),(3,'Móveis (Colchões em geral, Estofados)',10,'Jerônimo','(86) 98170-5065','2020-06-29 01:30:34'),(3,'Móveis (Colchões em geral, Estofados)',11,'Vinícius','(86) 98858-0001','2020-06-29 01:30:33'),(3,'Móveis (Colchões em geral, Estofados)',12,'Maria Cláudia','(86) 98138-8667','2020-06-29 01:30:33'),(4,'Cama, Mesa e banho & Utilidades',13,'Tatiana','(86) 98113-1381','2020-06-28 00:00:00'),(4,'Cama, Mesa e banho & Utilidades',14,'Antônia','(86) 98884-5437','2020-06-28 00:00:00'),(5,'Calçados & Acessórios',15,'Tatiana','(86) 98113-1381','2020-06-28 00:00:00'),(5,'Calçados & Acessórios',16,'Antônia','(86) 98884-5437','2020-06-28 00:00:00'),(6,'Brinquedos & Artigos de bebê',17,'Marcos Renann','(86) 98858-3390','2020-06-28 00:00:00'),(6,'Brinquedos & Artigos de bebê',18,'Iara','(86) 98143-7202','2020-06-28 00:00:00');
/*!40000 ALTER TABLE `televenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-06 14:15:36
