-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: yiban
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add nav',7,'add_nav'),(20,'Can change nav',7,'change_nav'),(21,'Can delete nav',7,'delete_nav'),(22,'Can add wheel',8,'add_wheel'),(23,'Can change wheel',8,'change_wheel'),(24,'Can delete wheel',8,'delete_wheel'),(25,'Can add yiban product',9,'add_yibanproduct'),(26,'Can change yiban product',9,'change_yibanproduct'),(27,'Can delete yiban product',9,'delete_yibanproduct'),(28,'Can add yiban shop',10,'add_yibanshop'),(29,'Can change yiban shop',10,'change_yibanshop'),(30,'Can delete yiban shop',10,'delete_yibanshop'),(31,'Can add yiban sku',11,'add_yibansku'),(32,'Can change yiban sku',11,'change_yibansku'),(33,'Can delete yiban sku',11,'delete_yibansku'),(34,'Can add 买家用户',12,'add_yibanuser'),(35,'Can change 买家用户',12,'change_yibanuser'),(36,'Can delete 买家用户',12,'delete_yibanuser'),(37,'Can add yiban man product',13,'add_yibanmanproduct'),(38,'Can change yiban man product',13,'change_yibanmanproduct'),(39,'Can delete yiban man product',13,'delete_yibanmanproduct'),(40,'Can add yiban kidsren product',14,'add_yibankidsrenproduct'),(41,'Can change yiban kidsren product',14,'change_yibankidsrenproduct'),(42,'Can delete yiban kidsren product',14,'delete_yibankidsrenproduct'),(43,'Can add yiban kids product',14,'add_yibankidsproduct'),(44,'Can change yiban kids product',14,'change_yibankidsproduct'),(45,'Can delete yiban kids product',14,'delete_yibankidsproduct'),(46,'Can add yiban discount product',15,'add_yibandiscountproduct'),(47,'Can change yiban discount product',15,'change_yibandiscountproduct'),(48,'Can delete yiban discount product',15,'delete_yibandiscountproduct'),(49,'Can add yiban brand nav',16,'add_yibanbrandnav'),(50,'Can change yiban brand nav',16,'change_yibanbrandnav'),(51,'Can delete yiban brand nav',16,'delete_yibanbrandnav'),(52,'Can add order',17,'add_order'),(53,'Can change order',17,'change_order'),(54,'Can delete order',17,'delete_order'),(55,'Can add order detail',18,'add_orderdetail'),(56,'Can change order detail',18,'change_orderdetail'),(57,'Can delete order detail',18,'delete_orderdetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$kivvp5jrIV6h$Ym3DxHB8eLY78ZfOH7HrSCv5P/lG91k3cJya86rtw2Q=','2019-12-19 16:04:44.111711',1,'walker','','','',1,1,'2019-12-19 06:34:35.649509');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'home','nav'),(8,'home','wheel'),(16,'home','yibanbrandnav'),(15,'home','yibandiscountproduct'),(14,'home','yibankidsproduct'),(13,'home','yibanmanproduct'),(9,'home','yibanproduct'),(10,'home','yibanshop'),(11,'home','yibansku'),(17,'order','order'),(18,'order','orderdetail'),(6,'sessions','session'),(12,'user','yibanuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-19 03:43:47.095371'),(2,'auth','0001_initial','2019-12-19 03:43:47.325783'),(3,'admin','0001_initial','2019-12-19 03:43:47.392390'),(4,'admin','0002_logentry_remove_auto_add','2019-12-19 03:43:47.423355'),(5,'contenttypes','0002_remove_content_type_name','2019-12-19 03:43:47.481172'),(6,'auth','0002_alter_permission_name_max_length','2019-12-19 03:43:47.519974'),(7,'auth','0003_alter_user_email_max_length','2019-12-19 03:43:47.548071'),(8,'auth','0004_alter_user_username_opts','2019-12-19 03:43:47.568568'),(9,'auth','0005_alter_user_last_login_null','2019-12-19 03:43:47.609464'),(10,'auth','0006_require_contenttypes_0002','2019-12-19 03:43:47.612451'),(11,'auth','0007_alter_validators_add_error_messages','2019-12-19 03:43:47.624005'),(12,'auth','0008_alter_user_username_max_length','2019-12-19 03:43:47.715251'),(13,'home','0001_initial','2019-12-19 03:43:47.860566'),(14,'sessions','0001_initial','2019-12-19 03:43:47.882419'),(15,'user','0001_initial','2019-12-19 09:42:48.941921'),(16,'home','0002_yibanproduct_mainprice','2019-12-25 12:38:30.919096'),(17,'home','0003_auto_20191225_2043','2019-12-25 12:44:01.742214'),(18,'home','0004_auto_20191225_2047','2019-12-25 12:48:05.861796'),(19,'home','0005_auto_20191225_2056','2019-12-25 12:56:44.472603'),(20,'home','0006_auto_20191225_2117','2019-12-25 13:18:05.825258'),(21,'home','0007_auto_20191225_2344','2019-12-25 15:44:32.941664'),(22,'home','0008_yibankidsrenproduct','2019-12-25 16:34:02.365829'),(23,'home','0009_auto_20191226_0035','2019-12-25 16:35:07.771883'),(24,'home','0010_yibandiscountproduct','2019-12-25 17:28:41.942808'),(25,'home','0011_yibanbrandnav','2019-12-26 00:43:54.851789'),(26,'home','0012_auto_20191226_1740','2019-12-26 09:46:46.463040'),(27,'home','0013_auto_20191226_1756','2019-12-26 09:56:44.499126'),(28,'home','0014_auto_20191226_1907','2019-12-26 11:07:55.195896'),(29,'home','0015_auto_20191226_1920','2019-12-26 11:20:51.341160'),(30,'user','0002_yibanuser_address','2019-12-28 08:52:37.594505'),(31,'order','0001_initial','2019-12-28 10:46:15.209734'),(32,'order','0002_auto_20191228_1918','2019-12-28 11:18:46.674152'),(33,'order','0003_auto_20191228_1924','2019-12-28 11:24:18.616178'),(34,'order','0004_auto_20191228_2014','2019-12-28 12:14:57.678955');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9ams1hss8f9lu6vj4k6wgeqh0gahpqci','ZjYxMzBhMWY2MGNmZTIxMDk2MzA5ZjZhNjU3ODc0MDE3YjJmZDI2Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzU2OGQ3N2ZlN2FkZmM5MDg0N2JhZmQ3YWQ5MmM0ZTYyZTRiOTk3In0=','2020-01-02 06:35:01.268901');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_brand_nav`
--

DROP TABLE IF EXISTS `yiban_brand_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_brand_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_brand_nav`
--

LOCK TABLES `yiban_brand_nav` WRITE;
/*!40000 ALTER TABLE `yiban_brand_nav` DISABLE KEYS */;
INSERT INTO `yiban_brand_nav` VALUES (1,'/static/img/imgs/l_eal.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(2,'/static/img/imgs/l_llke.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(3,'/static/img/imgs/l_panmax.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(4,'/static/img/imgs/l_cs.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(5,'/static/img/imgs/l_md.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(6,'/static/img/imgs/l_stella.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(7,'/static/img/imgs/l_ol.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(8,'/static/img/imgs/l_mq.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(9,'/static/img/imgs/l_dzlsj.jpg',NULL,'2019-08-07 16:00:00.000000','/');
/*!40000 ALTER TABLE `yiban_brand_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_discount_product`
--

DROP TABLE IF EXISTS `yiban_discount_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_discount_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  `longname` varchar(60) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `mainprice` decimal(9,2) NOT NULL,
  `discountprice` decimal(9,2) NOT NULL,
  `discount` decimal(3,1) NOT NULL,
  `shopid_id` int(11) NOT NULL,
  `productimg` varchar(255) NOT NULL,
  `skudict` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yiban_discount_product_shopid_id_359e879c_fk_yiban_shop_id` (`shopid_id`),
  CONSTRAINT `yiban_discount_product_shopid_id_359e879c_fk_yiban_shop_id` FOREIGN KEY (`shopid_id`) REFERENCES `yiban_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_discount_product`
--

LOCK TABLES `yiban_discount_product` WRITE;
/*!40000 ALTER TABLE `yiban_discount_product` DISABLE KEYS */;
INSERT INTO `yiban_discount_product` VALUES (1,'/static/img/imgs/201606251751427984.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季韩版新款连衣裙','尚丝蔓',258.00,181.00,7.0,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(2,'/static/img/imgs/201606251754441282.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端','尚丝蔓',298.00,160.00,5.3,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(3,'/static/img/imgs/201606281405385445.jpg',NULL,'2019-08-07 16:00:00.000000','/','佳美诗 2016欧美夏季新款印花连衣裙 女士假两件长裙不规则裙爆款','尚丝蔓',390.00,195.00,5.0,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(4,'/static/img/imgs/201606281422478849.jpg',NULL,'2019-08-07 16:00:00.000000','/','佳美诗 2016夏季新款纯色钉珠女式衬衫欧美中袖翻领上衣开衫品牌女装','尚丝蔓',380.00,190.00,5.0,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(5,'/static/img/imgs/201606281656456293.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016夏季新款韩版时尚牛仔套装女显瘦背心上衣镶钻半身裙两件套','尚丝蔓',332.00,83.00,2.5,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(6,'/static/img/imgs/201607061357388108.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016夏季新款女装甜美小清新纯棉麻修身收腰短袖A字裙连衣裙','尚丝蔓',126.00,38.00,3.0,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(7,'/static/img/imgs/201607111002315056.jpg',NULL,'2019-08-07 16:00:00.000000','/','艾芮尔 2016新款韩版胖MM200斤大码女装夏 加肥加大露肩两件套套装','尚丝蔓',188.00,79.00,4.2,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(8,'/static/img/imgs/201607271454072825.jpg',NULL,'2019-08-07 16:00:00.000000','/','RANRAN冉冉2016夏季女装新款蕾丝长裙子大摆型拼接绸缎真丝连衣裙','尚丝蔓',760.00,179.00,2.3,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(58,'/static/img/imgs/201606251751427984.jpg','夏韩雪纺连衣裙','2019-09-08 00:00:00.000000','local','2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙','尚一曼',224.00,56.00,2.5,1,'/static/img/imgs/201606161639114423.jpg;/static/img/imgs/201606161639114805.jpg_390x390.jpg;/static/img/imgs/201606161639107494.jpg_390x390.jpg','{\"color\": [\"pink\"], \"size\": [\"L\", \"M\", \"S\"]}');
/*!40000 ALTER TABLE `yiban_discount_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_kids_product`
--

DROP TABLE IF EXISTS `yiban_kids_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_kids_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  `longname` varchar(60) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `mainprice` decimal(9,2) NOT NULL,
  `shopid_id` int(11) NOT NULL,
  `productimg` varchar(255) NOT NULL,
  `skudict` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yiban_kids_product_shopid_id_c62950dd_fk_yiban_shop_id` (`shopid_id`),
  CONSTRAINT `yiban_kids_product_shopid_id_c62950dd_fk_yiban_shop_id` FOREIGN KEY (`shopid_id`) REFERENCES `yiban_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_kids_product`
--

LOCK TABLES `yiban_kids_product` WRITE;
/*!40000 ALTER TABLE `yiban_kids_product` DISABLE KEYS */;
INSERT INTO `yiban_kids_product` VALUES (1,'/static/img/imgs/linke_14682007362310.jpg',NULL,'2019-08-07 16:00:00.000000','/','超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙','尚丝蔓',170.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(2,'/static/img/imgs/201607071144073964.jpg',NULL,'2019-08-07 16:00:00.000000','/','尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙','尚丝蔓',79.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(3,'/static/img/imgs/201607071147502316.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙','尚丝蔓',56.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(4,'/static/img/imgs/201607071150074658.jpg',NULL,'2019-08-07 16:00:00.000000','/','新款韩国夏季短袖白色淑女连衣裙','尚丝蔓',62.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(5,'/static/img/imgs/201607071340124768.jpg',NULL,'2019-08-07 16:00:00.000000','/','新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙','尚丝蔓',57.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(6,'/static/img/imgs/linke_14682010808967.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙','尚丝蔓',86.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(7,'/static/img/imgs/201607071342167389.jpg',NULL,'2019-08-07 16:00:00.000000','/','MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙','尚丝蔓',119.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(8,'/static/img/imgs/linke_14658102343416.jpg',NULL,'2019-08-07 16:00:00.000000','/','真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝','哥弟',229.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(9,'/static/img/imgs/201604281137225121.jpg',NULL,'2019-08-07 16:00:00.000000','/','哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙','哥弟',359.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(10,'/static/img/imgs/201607071134225305.jpg',NULL,'2019-08-07 16:00:00.000000','/','哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装','哥弟',358.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(11,'/static/img/imgs/201607071342167389.jpg',NULL,'2019-08-07 16:00:00.000000','/','Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙','哥弟',158.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(12,'/static/img/imgs/201607121522166102.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年连衣裙2016夏季新款妈妈装','哥弟',75.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(13,'/static/img/imgs/201607121546478177.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年妈妈装假两件 加肥加大码','哥弟',85.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(14,'/static/img/imgs/201607121548183741.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年女装夏季新款雪纺连衣裙','哥弟',85.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(15,'/static/img/imgs/linke_14658659125222.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩','ROOM0404',119.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(16,'/static/img/imgs/201604062009482292.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女','ROOM0404',118.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(17,'/static/img/imgs/201604271357074776.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季潮流新品女装连衣裙','ROOM0404',231.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(18,'/static/img/imgs/201604271439279778.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季韩版新款连衣裙','ROOM0404',181.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(19,'/static/img/imgs/201606011450012414.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙','ROOM0404',174.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(20,'/static/img/imgs/201606011525488359.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端','ROOM0404',160.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(21,'/static/img/imgs/201606271148571224.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 夏季2016竖条纹打底裙中长款韩版潮','ROOM0404',170.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(22,'/static/img/imgs/linke_14658673097849.jpg',NULL,'2019-08-07 16:00:00.000000','/','刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙','洛洛卡儿',119.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(23,'/static/img/imgs/201603030924526770.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙','洛洛卡儿',79.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(24,'/static/img/imgs/201603030928528794.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙','洛洛卡儿',114.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(25,'/static/img/imgs/201603030929099544.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙','洛洛卡儿',98.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(26,'/static/img/imgs/201604281135206503.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺','洛洛卡儿',78.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(27,'/static/img/imgs/201607121543475973.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫','洛洛卡儿',86.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(28,'/static/img/imgs/201607121548183741.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016春装时尚潮新款复古上衣','洛洛卡儿',140.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}');
/*!40000 ALTER TABLE `yiban_kids_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_man_product`
--

DROP TABLE IF EXISTS `yiban_man_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_man_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  `longname` varchar(60) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `mainprice` decimal(9,2) NOT NULL,
  `shopid_id` int(11) NOT NULL,
  `productimg` varchar(255) NOT NULL,
  `skudict` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yiban_man_product_shopid_id_a43ded4a_fk_yiban_shop_id` (`shopid_id`),
  CONSTRAINT `yiban_man_product_shopid_id_a43ded4a_fk_yiban_shop_id` FOREIGN KEY (`shopid_id`) REFERENCES `yiban_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_man_product`
--

LOCK TABLES `yiban_man_product` WRITE;
/*!40000 ALTER TABLE `yiban_man_product` DISABLE KEYS */;
INSERT INTO `yiban_man_product` VALUES (1,'/static/img/imgs/linke_14695018705525.jpg',NULL,'2019-08-07 16:00:00.000000','/','超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙','尚丝蔓',170.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(2,'/static/img/imgs/201607041448549057.jpg',NULL,'2019-08-07 16:00:00.000000','/','尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙','尚丝蔓',79.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(3,'/static/img/imgs/201607041454171754.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙','尚丝蔓',56.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(4,'/static/img/imgs/201607041553065513.jpg',NULL,'2019-08-07 16:00:00.000000','/','新款韩国夏季短袖白色淑女连衣裙','尚丝蔓',62.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(5,'/static/img/imgs/201607041610291958.jpg',NULL,'2019-08-07 16:00:00.000000','/','新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙','尚丝蔓',57.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(6,'/static/img/imgs/201607041618155728.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙','尚丝蔓',86.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(7,'/static/img/imgs/201607041627479978.jpg',NULL,'2019-08-07 16:00:00.000000','/','MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙','尚丝蔓',119.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(8,'/static/img/imgs/linke_14706258125239.jpg',NULL,'2019-08-07 16:00:00.000000','/','真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝','哥弟',229.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(9,'/static/img/imgs/201602260137028067.jpg',NULL,'2019-08-07 16:00:00.000000','/','哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙','哥弟',359.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(10,'/static/img/imgs/201603081354339001.jpg',NULL,'2019-08-07 16:00:00.000000','/','哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装','哥弟',358.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(11,'/static/img/imgs/201603232239264013.jpg',NULL,'2019-08-07 16:00:00.000000','/','Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙','哥弟',158.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(12,'/static/img/imgs/201603291959591645.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年连衣裙2016夏季新款妈妈装','哥弟',75.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(13,'/static/img/imgs/201607292150398516.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年妈妈装假两件 加肥加大码','哥弟',85.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(14,'/static/img/imgs/201607292155083011.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年女装夏季新款雪纺连衣裙','哥弟',85.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(15,'/static/img/imgs/linke_14658706757722.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩','ROOM0404',119.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(16,'/static/img/imgs/201605311415521305.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女','ROOM0404',118.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(17,'/static/img/imgs/201605311420532242.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季潮流新品女装连衣裙','ROOM0404',231.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(18,'/static/img/imgs/201606020954307160.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季韩版新款连衣裙','ROOM0404',181.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(19,'/static/img/imgs/201606020955437424.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙','ROOM0404',174.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(20,'/static/img/imgs/201606071100167732.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端','ROOM0404',160.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(21,'/static/img/imgs/201606211029566542.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 夏季2016竖条纹打底裙中长款韩版潮','ROOM0404',170.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(22,'/static/img/imgs/linke_14658723315531.jpg',NULL,'2019-08-07 16:00:00.000000','/','刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙','洛洛卡儿',119.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(23,'/static/img/imgs/201603111926478825.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙','洛洛卡儿',79.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(24,'/static/img/imgs/201603291032029443.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙','洛洛卡儿',114.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(25,'/static/img/imgs/201604261227363906.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙','洛洛卡儿',98.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(26,'/static/img/imgs/201606281641392093.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺','洛洛卡儿',78.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(27,'/static/img/imgs/201607181752319352.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫','洛洛卡儿',86.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(28,'/static/img/imgs/201607181924264851.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016春装时尚潮新款复古上衣','洛洛卡儿',140.00,1,'/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}');
/*!40000 ALTER TABLE `yiban_man_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_nav`
--

DROP TABLE IF EXISTS `yiban_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_nav`
--

LOCK TABLES `yiban_nav` WRITE;
/*!40000 ALTER TABLE `yiban_nav` DISABLE KEYS */;
INSERT INTO `yiban_nav` VALUES (1,'/static/img/imgs/linke_14647471632394.jpg','金币支付','2019-09-09 00:00:00.000000','/'),(2,'/static/img/imgs/linke_14659735277659.jpg','众夺宝','2019-08-08 00:00:00.000000','/');
/*!40000 ALTER TABLE `yiban_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_order`
--

DROP TABLE IF EXISTS `yiban_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `order_code` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL,
  `order_detail` varchar(1000) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `toaddress` varchar(100) NOT NULL,
  `tousername` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_order`
--

LOCK TABLES `yiban_order` WRITE;
/*!40000 ALTER TABLE `yiban_order` DISABLE KEYS */;
INSERT INTO `yiban_order` VALUES (1,3,'1577535303.991681',1,'{\"2016\\u590f\\u97e9\\u56fd\\u65b0\\u6b3e\\u5973\\u88c5\\u80cc\\u5fc3\\u957f\\u88d9\\u6c99\\u6ee9\\u88d9\\u6027\\u611f\\u9732\\u80cc\\u65e0\\u8896\\u5927\\u6446\\u96ea\\u7eba\\u8fde\\u8863\\u88d9{\\\"color\\\": \\\"pink\\\", \\\"size\\\": \\\"M\\\"}\": 3, \"2016\\u590f\\u97e9\\u56fd\\u65b0\\u6b3e\\u5973\\u88c5\\u80cc\\u5fc3\\u957f\\u88d9\\u6c99\\u6ee9\\u88d9\\u6027\\u611f\\u9732\\u80cc\\u65e0\\u8896\\u5927\\u6446\\u96ea\\u7eba\\u8fde\\u8863\\u88d9{\\\"color\\\": \\\"pink\\\", \\\"size\\\": \\\"S\\\"}\": 3, \"2016\\u590f\\u97e9\\u56fd\\u65b0\\u6b3e\\u5973\\u88c5\\u80cc\\u5fc3\\u957f\\u88d9\\u6c99\\u6ee9\\u88d9\\u6027\\u611f\\u9732\\u80cc\\u65e0\\u8896\\u5927\\u6446\\u96ea\\u7eba\\u8fde\\u8863\\u88d9{\\\"color\\\": \\\"pink\\\", \\\"size\\\": \\\"L\\\"}\": 2}','13316446149','广东深圳市后瑞地铁站西部硅谷','python');
/*!40000 ALTER TABLE `yiban_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_product`
--

DROP TABLE IF EXISTS `yiban_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  `longname` varchar(60) NOT NULL,
  `shopid_id` int(11) NOT NULL,
  `mainprice` decimal(9,2) NOT NULL,
  `brandname` varchar(255) NOT NULL,
  `productimg` varchar(255) NOT NULL,
  `skudict` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yiban_product_shopid_id_11b8eadc_fk_yiban_shop_id` (`shopid_id`),
  CONSTRAINT `yiban_product_shopid_id_11b8eadc_fk_yiban_shop_id` FOREIGN KEY (`shopid_id`) REFERENCES `yiban_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_product`
--

LOCK TABLES `yiban_product` WRITE;
/*!40000 ALTER TABLE `yiban_product` DISABLE KEYS */;
INSERT INTO `yiban_product` VALUES (30,'/static/img/imgs/linke_14675991774937.jpg',NULL,'2019-08-07 16:00:00.000000','/','超仙长裙开叉立体绣花白色蕾丝网纱中袖连衣裙',1,170.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(31,'/static/img/imgs/linke_14675985285998.jpg',NULL,'2019-08-07 16:00:00.000000','/','尚丝蔓2016夏装新款韩版修身印花无袖两件套连衣裙 显瘦露脐半身套装裙',1,79.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(32,'/static/img/imgs/201606161639114423.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016夏韩国新款女装背心长裙沙滩裙性感露背无袖大摆雪纺连衣裙',1,56.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(33,'/static/img/imgs/201606211709019676.jpg',NULL,'2019-08-07 16:00:00.000000','/','新款韩国夏季短袖白色淑女连衣裙',1,62.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(34,'/static/img/imgs/201606211734183033.jpg',NULL,'2019-08-07 16:00:00.000000','/','新款名媛气质立体雏菊圆领短款无袖连衣裙背心裙',1,57.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(35,'/static/img/imgs/201606281622183043.jpg',NULL,'2019-08-07 16:00:00.000000','/','2016短袖修身单件女装通勤新款韩版夏季套头夏装气质淑女连衣裙',1,86.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(36,'/static/img/imgs/linke_14675984387574.jpg',NULL,'2019-08-07 16:00:00.000000','/','MOFFI 2016夏季潮流新品欧美风纯色荷叶边蛋糕裙女式雪纺连衣裙',1,119.00,'尚丝蔓','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(37,'/static/img/imgs/linke_14691795725688.jpg',NULL,'2019-08-07 16:00:00.000000','/','真丝连衣裙2016夏大码女装高档中年修身显瘦中长款淑女重磅桑蚕丝',1,229.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(38,'/static/img/imgs/201605311741133889.jpg',NULL,'2019-08-07 16:00:00.000000','/','哥弟 2016夏装正品哥弟新款时尚高贵气质妈妈装修身显瘦短袖连衣裙',1,359.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(39,'/static/img/imgs/201605311748327870.jpg',NULL,'2019-08-07 16:00:00.000000','/','哥弟 2016专柜女装正品哥弟短袖连衣裙大牌时尚修身显瘦中长款女装',1,358.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(40,'/static/img/imgs/201607221653034365.jpg',NULL,'2019-08-07 16:00:00.000000','/','Daiyisilin 2016夏季新款中老年时尚皱褶妈妈装特大加菲大码复古连衣裙',1,158.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(41,'/static/img/imgs/201608011141365882.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年连衣裙2016夏季新款妈妈装',1,75.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(42,'/static/img/imgs/201608011143335378.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年妈妈装假两件 加肥加大码',1,85.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(43,'/static/img/imgs/201608011143442924.jpg',NULL,'2019-08-07 16:00:00.000000','/','约诺帝 中老年女装夏季新款雪纺连衣裙',1,85.00,'哥弟','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(44,'/static/img/imgs/linke_14673519349499.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016高端女装系列韩版简单背带牛仔衫露肩一字肩',1,119.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(45,'/static/img/imgs/201606251736052162.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016吊带衫短款宽松无袖外穿衫荷叶边翠花性感露背上衣t恤女',1,118.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(46,'/static/img/imgs/201606251751202381.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季潮流新品女装连衣裙',1,231.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(47,'/static/img/imgs/201606251751427984.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季韩版新款连衣裙',1,181.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(48,'/static/img/imgs/201606251752051684.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏装欧版新款中长款系带连衣裙女裙',1,174.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(49,'/static/img/imgs/201606251754441282.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016夏季连衣裙仿真丝中长宽松大摆裙 高端',1,160.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(50,'/static/img/imgs/201606251755128723.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 夏季2016竖条纹打底裙中长款韩版潮',1,170.00,'ROOM0404','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(51,'/static/img/imgs/linke_14673635998747.jpg',NULL,'2019-08-07 16:00:00.000000','/','刊菲 2016复古风夏季新款优雅名媛旗袍裙修身蕾丝连衣裙',1,119.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(52,'/static/img/imgs/201606251600438107.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 夏装民族风波西米亚复古碎花拼接吊带裙长款连衣裙长裙',1,79.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(53,'/static/img/imgs/201606251623459194.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016夏装日系森女系复古圆领碎花中袖雪纺中长款连衣裙',1,114.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(54,'/static/img/imgs/201606251626292411.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016春装新款复古小碎花长袖灯芯绒印花拼接中长款连衣裙大码裙',1,98.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(55,'/static/img/imgs/201606251659137066.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2016夏装新款复古波西米亚浪漫飘逸文艺花朵森女碎花上衣系带雪纺',1,78.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(56,'/static/img/imgs/201606251700072744.jpg',NULL,'2019-08-07 16:00:00.000000','/','洛洛卡儿 2015秋装新款复古民族风田园森女系碎花中袖衬衣麻衣衬衫',1,86.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}'),(57,'/static/img/imgs/201606251730423978.jpg',NULL,'2019-08-07 16:00:00.000000','/','ROOM0404 2016春装时尚潮新款复古上衣',1,140.00,'洛洛卡儿','/','{\"color\":[\"red\",],\"size\":[\"L\",\"M\",\"S\"]}');
/*!40000 ALTER TABLE `yiban_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_shop`
--

DROP TABLE IF EXISTS `yiban_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_shop`
--

LOCK TABLES `yiban_shop` WRITE;
/*!40000 ALTER TABLE `yiban_shop` DISABLE KEYS */;
INSERT INTO `yiban_shop` VALUES (1,'yiban_ziyin');
/*!40000 ALTER TABLE `yiban_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_sku`
--

DROP TABLE IF EXISTS `yiban_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skuprops` varchar(255) NOT NULL,
  `primaryprice` decimal(9,2) NOT NULL,
  `discountprice` decimal(9,2) NOT NULL,
  `inventory` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yiban_sku_product_id_73ad7819_fk_yiban_discount_product_id` (`product_id`),
  CONSTRAINT `yiban_sku_product_id_73ad7819_fk_yiban_discount_product_id` FOREIGN KEY (`product_id`) REFERENCES `yiban_discount_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_sku`
--

LOCK TABLES `yiban_sku` WRITE;
/*!40000 ALTER TABLE `yiban_sku` DISABLE KEYS */;
INSERT INTO `yiban_sku` VALUES (1,'{\"color\": \"pink\", \"size\": \"L\"}',224.00,56.00,99,8,58),(2,'{\"color\": \"pink\", \"size\": \"M\"}',234.00,65.00,99,8,58),(3,'{\"color\": \"pink\", \"size\": \"S\"}',214.00,52.00,99,8,58);
/*!40000 ALTER TABLE `yiban_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_user`
--

DROP TABLE IF EXISTS `yiban_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_user`
--

LOCK TABLES `yiban_user` WRITE;
/*!40000 ALTER TABLE `yiban_user` DISABLE KEYS */;
INSERT INTO `yiban_user` VALUES (1,'walker','pbkdf2_sha256$36000$QFfaDe6JId9c$KwB3ZP4buufTQZBdOE8SoFHkiMIlflbrALIDE8R1juM=','13316446149','','',0,'广东深圳市后瑞地铁站西部硅谷'),(2,'wwwwwwwang','pbkdf2_sha256$36000$SnSFGZ0Xvp96$iQk4TrpGi5uhyceWPe9jp2FXXxeVPuZ7GBdYJPiUu6k=','13316446149','','',0,'广东深圳市后瑞地铁站西部硅谷'),(3,'python','pbkdf2_sha256$36000$T9fosATQcOU8$3SHJ87eIupyABaFVh1Kcc9u+mSFzVMtkOI8d27NvnFM=','13316446149','','',0,'广东深圳市后瑞地铁站西部硅谷');
/*!40000 ALTER TABLE `yiban_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yiban_wheel`
--

DROP TABLE IF EXISTS `yiban_wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yiban_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yiban_wheel`
--

LOCK TABLES `yiban_wheel` WRITE;
/*!40000 ALTER TABLE `yiban_wheel` DISABLE KEYS */;
INSERT INTO `yiban_wheel` VALUES (1,'/static/img/imgs/eal.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(2,'/static/img/imgs/llke.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(3,'/static/img/imgs/panmax.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(4,'/static/img/imgs/cs.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(5,'/static/img/imgs/md.jpg',NULL,'2019-08-07 16:00:00.000000','/'),(6,'/static/img/imgs/stella.jpg',NULL,'2019-08-07 16:00:00.000000','/');
/*!40000 ALTER TABLE `yiban_wheel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-28 20:53:26
