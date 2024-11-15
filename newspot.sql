-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: freescout
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int unsigned DEFAULT NULL,
  `causer_type` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,'users','login',NULL,NULL,1,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 08:08:35','2024-10-28 08:08:35'),(2,'users','login',NULL,NULL,1,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 09:02:53','2024-10-28 09:02:53'),(3,'users','login',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 09:07:31','2024-10-28 09:07:31'),(4,'users','logout',NULL,NULL,1,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 09:08:00','2024-10-28 09:08:00'),(5,'users','login_failed',NULL,NULL,NULL,NULL,'{\"ip\":\"136.244.85.19\",\"email\":\"viki@voipe.co.il\"}','2024-10-28 09:08:04','2024-10-28 09:08:04'),(6,'users','login',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 09:08:09','2024-10-28 09:08:09'),(7,'users','logout',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 09:09:20','2024-10-28 09:09:20'),(8,'users','login',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 09:09:30','2024-10-28 09:09:30'),(9,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"45.87.155.81\"}','2024-10-28 12:03:33','2024-10-28 12:03:33'),(10,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-28 12:07:57','2024-10-28 12:07:57'),(11,'users','logout',NULL,NULL,4,'App\\User','{\"ip\":\"83.234.227.33\"}','2024-10-28 22:24:28','2024-10-28 22:24:28'),(12,'users','login',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-29 08:03:15','2024-10-29 08:03:15'),(13,'whatsapp_errors','[WhatsApp Webhook - 1msg.io] (ai tests) Could not import your own message sent as a response to a customer. Could not find the user with the following phone number: . Make sure to set this phone number to one of the users in FreeScout. Webhook data: {\"messages\":[{\"id\":\"wamid.HBgMOTcyNTAyNzYwMjA2FQIAERgSNDJCRTVGRDI0QjJENEE4NTM5AA==\",\"body\":\"test2\",\"self\":1,\"type\":\"chat\",\"chatId\":\"972502760206@c.us\",\"fromMe\":true,\"caption\":null,\"chatName\":\"972502760206\",\"isForwarded\":false,\"quotedMsgId\":null,\"time\":\"1730189119\"}],\"instanceId\":\"FRO892609167\"}',NULL,NULL,NULL,NULL,'[]','2024-10-29 08:05:21','2024-10-29 08:05:21'),(14,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"178.156.136.173\"}','2024-10-29 10:00:03','2024-10-29 10:00:03'),(15,'users','logout',NULL,NULL,4,'App\\User','{\"ip\":\"178.156.136.173\"}','2024-10-29 10:03:23','2024-10-29 10:03:23'),(16,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"178.156.136.173\"}','2024-10-29 10:53:01','2024-10-29 10:53:01'),(17,'users','login',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-29 11:48:47','2024-10-29 11:48:47'),(18,'users','login_failed',NULL,NULL,NULL,NULL,'{\"ip\":\"136.244.85.19\",\"email\":\"viki@voipe.co.il\"}','2024-10-29 11:50:16','2024-10-29 11:50:16'),(19,'users','login_failed',NULL,NULL,NULL,NULL,'{\"ip\":\"136.244.85.19\",\"email\":\"viki@voipe.co.il\"}','2024-10-29 11:50:28','2024-10-29 11:50:28'),(20,'users','login',NULL,NULL,2,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-29 11:50:33','2024-10-29 11:50:33'),(21,'whatsapp_errors','[WhatsApp Webhook - 1msg.io] (ai tests) Could not import your own message sent as a response to a customer. Could not find the user with the following phone number: . Make sure to set this phone number to one of the users in FreeScout. Webhook data: {\"messages\":[{\"id\":\"wamid.HBgMOTcyNTAyNzYwMjA2FQIAERgSMjk3MUYzMTg4MzBDNzY1QjFEAA==\",\"body\":\"hi, how are you?\",\"self\":1,\"type\":\"chat\",\"chatId\":\"972502760206@c.us\",\"fromMe\":true,\"caption\":null,\"chatName\":\"972502760206\",\"isForwarded\":false,\"quotedMsgId\":null,\"time\":\"1730205646\"}],\"instanceId\":\"FRO892609167\"}',NULL,NULL,NULL,NULL,'[]','2024-10-29 12:40:48','2024-10-29 12:40:48'),(22,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"178.156.136.173\"}','2024-10-30 01:06:32','2024-10-30 01:06:32'),(23,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"83.234.227.34\"}','2024-10-30 02:12:39','2024-10-30 02:12:39'),(24,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"83.234.227.36\"}','2024-10-30 09:52:11','2024-10-30 09:52:11'),(25,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"83.234.227.38\"}','2024-10-30 11:34:51','2024-10-30 11:34:51'),(26,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-10-30 13:49:59','2024-10-30 13:49:59'),(27,'users','login',NULL,NULL,1,'App\\User','{\"ip\":\"84.229.86.136\"}','2024-11-02 11:56:28','2024-11-02 11:56:28'),(28,'users','login',NULL,NULL,1,'App\\User','{\"ip\":\"84.229.86.136\"}','2024-11-02 18:46:07','2024-11-02 18:46:07'),(29,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-11-02 18:46:46','2024-11-02 18:46:46'),(30,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-11-02 20:04:19','2024-11-02 20:04:19'),(31,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-11-02 23:16:23','2024-11-02 23:16:23'),(32,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-11-03 00:41:00','2024-11-03 00:41:00'),(33,'users','login',NULL,NULL,1,'App\\User','{\"ip\":\"84.229.86.136\"}','2024-11-03 06:40:16','2024-11-03 06:40:16'),(34,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"83.234.227.35\"}','2024-11-03 06:54:39','2024-11-03 06:54:39'),(35,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-11-03 07:18:22','2024-11-03 07:18:22'),(36,'users','login',NULL,NULL,1,'App\\User','{\"ip\":\"84.229.86.136\"}','2024-11-03 09:36:53','2024-11-03 09:36:53'),(37,'users','login',NULL,NULL,4,'App\\User','{\"ip\":\"136.244.85.19\"}','2024-11-03 12:33:25','2024-11-03 12:33:25');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `file_dir` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int unsigned NOT NULL,
  `size` int unsigned DEFAULT NULL,
  `embedded` tinyint(1) NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attachments_thread_id_embedded_index` (`thread_id`,`embedded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_statistics`
--

DROP TABLE IF EXISTS `billing_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_statistics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnt` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `billing_statistics_type_month_unique` (`type`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_statistics`
--

LOCK TABLES `billing_statistics` WRITE;
/*!40000 ALTER TABLE `billing_statistics` DISABLE KEYS */;
INSERT INTO `billing_statistics` VALUES (1,'sms_in','2024-10',62),(2,'sms_out','2024-10',1),(3,'sms_in','2024-09',0),(4,'sms_out','2024-09',0),(5,'whatsapp_in','2024-10',7),(6,'whatsapp_out','2024-10',4),(7,'whatsapp_marketing','2024-10',0),(8,'whatsapp_utility','2024-10',0),(9,'whatsapp_authentication','2024-10',0),(10,'whatsapp_in','2024-09',0),(11,'whatsapp_out','2024-09',0),(12,'whatsapp_marketing','2024-09',0),(13,'whatsapp_utility','2024-09',0),(14,'whatsapp_authentication','2024-09',0),(78,'count_workflows','2024-10',0),(92,'count_workflows','2024-11',0),(94,'whatsapp_in','2024-11',1);
/*!40000 ALTER TABLE `billing_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_items`
--

DROP TABLE IF EXISTS `checklist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `text` text COLLATE utf8mb4_unicode_ci,
  `linked_conversation_id` int unsigned NOT NULL,
  `linked_conversation_number` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checklist_items_conversation_id_index` (`conversation_id`),
  KEY `checklist_items_linked_conversation_id_index` (`linked_conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_items`
--

LOCK TABLES `checklist_items` WRITE;
/*!40000 ALTER TABLE `checklist_items` DISABLE KEYS */;
INSERT INTO `checklist_items` VALUES (1,13,3,'task for tomorrow',0,0);
/*!40000 ALTER TABLE `checklist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_custom_field`
--

DROP TABLE IF EXISTS `conversation_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_custom_field` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_custom_field_conversation_id_custom_field_id_unique` (`conversation_id`,`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_custom_field`
--

LOCK TABLES `conversation_custom_field` WRITE;
/*!40000 ALTER TABLE `conversation_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_folder`
--

DROP TABLE IF EXISTS `conversation_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_folder` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned NOT NULL,
  `conversation_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_folder_folder_id_conversation_id_unique` (`folder_id`,`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_folder`
--

LOCK TABLES `conversation_folder` WRITE;
/*!40000 ALTER TABLE `conversation_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_tag`
--

DROP TABLE IF EXISTS `conversation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_tag_conversation_id_tag_id_unique` (`conversation_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_tag`
--

LOCK TABLES `conversation_tag` WRITE;
/*!40000 ALTER TABLE `conversation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_workflow`
--

DROP TABLE IF EXISTS `conversation_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_workflow` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `workflow_id` int NOT NULL,
  `counter` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `conversation_workflow_conversation_id_workflow_id_unique` (`conversation_id`,`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_workflow`
--

LOCK TABLES `conversation_workflow` WRITE;
/*!40000 ALTER TABLE `conversation_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` int unsigned NOT NULL,
  `threads_count` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL,
  `folder_id` int unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `subject` varchar(998) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci,
  `bcc` text COLLATE utf8mb4_unicode_ci,
  `preview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  `has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `mailbox_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `created_by_user_id` int unsigned DEFAULT NULL,
  `created_by_customer_id` int unsigned DEFAULT NULL,
  `source_via` tinyint unsigned NOT NULL,
  `source_type` tinyint unsigned NOT NULL,
  `closed_by_user_id` int unsigned DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `user_updated_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NULL DEFAULT NULL,
  `last_reply_from` tinyint unsigned DEFAULT NULL,
  `read_by_user` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `channel` tinyint unsigned DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `snoozed_until` timestamp NULL DEFAULT NULL,
  `rpt_ready` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `conversations_folder_id_status_index` (`folder_id`,`status`),
  KEY `conversations_mailbox_id_customer_id_index` (`mailbox_id`,`customer_id`),
  KEY `conversations_user_id_mailbox_id_state_status_index` (`user_id`,`mailbox_id`,`state`,`status`),
  KEY `conversations_folder_id_state_index` (`folder_id`,`state`),
  KEY `conversations_snoozed_until_index` (`snoozed_until`),
  KEY `conversations_rpt_ready_index` (`rpt_ready`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,1,39,3,4,3,2,'בדיקה','',NULL,NULL,'בדיקה ויקי',0,0,1,NULL,1,NULL,1,1,2,2,'2024-10-28 10:52:21','2024-10-28 10:52:21','2024-10-28 10:52:07',1,0,'2024-10-28 10:52:05','2024-10-28 10:53:05',15,'{\"rpt\":{\"frt\":0,\"rst\":0,\"rnt\":16,\"rtr\":0,\"rfr\":false}}',NULL,1),(2,2,2,3,4,3,2,'?','',NULL,NULL,'בדיקה',0,0,1,NULL,2,NULL,2,1,2,2,'2024-10-28 10:52:21','2024-10-28 10:52:21','2024-10-28 10:52:06',1,0,'2024-10-28 10:52:05','2024-10-28 10:53:05',15,'{\"rpt\":{\"frt\":0,\"rst\":0,\"rnt\":16,\"rtr\":0,\"rfr\":false}}',NULL,1),(3,3,4,3,4,3,2,'היי, אפשר שתשלחו לי קישור לתוסף סרגל נציג?','',NULL,NULL,'דוואי',0,0,1,NULL,3,NULL,3,1,2,2,'2024-10-28 10:52:21','2024-10-28 10:52:21','2024-10-28 10:52:06',1,0,'2024-10-28 10:52:05','2024-10-28 10:53:05',15,'{\"rpt\":{\"frt\":0,\"rst\":0,\"rnt\":16,\"rtr\":0,\"rfr\":false}}',NULL,1),(4,4,1,3,4,3,2,'מה המתנה שלך לחיילי צה\\\'ל? ❤️1. מודה אני2. נר שבת3. תפילין4 קצת שבת','',NULL,NULL,'מה המתנה שלך לחיילי צה\\\'ל? ❤️1. מודה אני2. נר שבת3. תפילין4 קצת שבת',0,0,1,NULL,4,NULL,4,1,2,2,'2024-10-28 10:52:21','2024-10-28 10:52:21','2024-10-28 10:52:06',1,0,'2024-10-28 10:52:06','2024-10-28 10:53:05',15,NULL,NULL,1),(5,5,1,3,4,3,2,'http://voi.pe/4d7bf0','',NULL,NULL,'http://voi.pe/4d7bf0',0,0,1,NULL,5,NULL,5,1,2,2,'2024-10-28 10:52:21','2024-10-28 10:52:21','2024-10-28 10:52:06',1,0,'2024-10-28 10:52:06','2024-10-28 10:53:05',15,NULL,NULL,1),(6,6,2,3,4,3,2,'מה המתנה שלך לאלוקים?','',NULL,NULL,'מה המתנה שלך לאלוקים?',0,0,1,NULL,6,NULL,6,1,2,2,'2024-10-28 10:52:21','2024-10-28 10:52:21','2024-10-28 10:52:07',1,0,'2024-10-28 10:52:07','2024-10-28 10:53:05',15,'{\"rpt\":{\"frt\":0,\"rst\":0,\"rnt\":14,\"rtr\":0,\"rfr\":false}}',NULL,1),(7,7,2,3,3,2,2,'Hi test','',NULL,NULL,'TESTING',0,0,1,2,1,NULL,1,1,2,NULL,NULL,'2024-10-28 10:55:24','2024-10-28 10:55:24',2,0,'2024-10-28 10:53:05','2024-10-28 10:56:04',15,'{\"rpt\":{\"frt\":139,\"rst\":139,\"rnt\":0,\"rtr\":0,\"rfr\":false}}',NULL,1),(8,8,3,3,3,2,2,'/start','',NULL,NULL,'reply',0,0,1,2,7,NULL,7,1,2,NULL,NULL,'2024-10-28 11:52:10','2024-10-28 11:52:10',2,0,'2024-10-28 11:47:59','2024-10-28 11:53:04',11,'{\"rpt\":{\"frt\":251,\"rst\":246,\"rnt\":0,\"rtr\":0,\"rfr\":false}}',NULL,1),(11,11,3,3,4,3,2,'Test','',NULL,NULL,'Hi',0,0,1,2,1,NULL,1,1,2,2,'2024-10-29 12:37:21','2024-10-29 12:37:21','2024-10-29 12:36:39',1,0,'2024-10-29 08:04:41','2024-10-29 12:38:05',13,'{\"rpt\":{\"frt\":17,\"rst\":17,\"rnt\":16360,\"rtr\":1,\"rfr\":true}}',NULL,1),(12,12,1,3,4,3,2,'Hi','',NULL,NULL,'Hi',0,0,1,NULL,1,NULL,1,1,2,2,'2024-10-29 12:38:08','2024-10-29 12:38:08','2024-10-29 12:37:35',1,0,'2024-10-29 12:37:35','2024-10-29 12:39:05',13,NULL,NULL,1),(14,13,1,3,1,1,2,'Hi','',NULL,NULL,'Hi',0,0,1,NULL,1,NULL,1,1,2,NULL,NULL,NULL,'2024-10-30 07:29:07',1,0,'2024-10-30 07:29:07','2024-10-30 07:30:05',13,NULL,NULL,1),(15,14,3,3,3,2,2,'Hi','',NULL,NULL,'Hello',0,0,1,4,8,NULL,8,1,2,NULL,NULL,'2024-11-02 23:56:32','2024-11-02 23:56:32',2,0,'2024-10-30 10:26:47','2024-11-02 23:56:32',11,'{\"rpt\":{\"frt\":212,\"rst\":212,\"rnt\":0,\"rtr\":0,\"rfr\":false}}',NULL,0),(16,15,3,3,1,1,2,'Hi','',NULL,NULL,'שלום',0,0,1,NULL,10,NULL,10,1,2,NULL,NULL,NULL,'2024-11-03 06:41:46',1,0,'2024-10-30 14:17:30','2024-11-03 06:41:46',13,'{\"rpt\":{\"frt\":0,\"rst\":0,\"rnt\":0,\"rtr\":0,\"rfr\":false}}',NULL,0),(17,16,2,3,6,1,3,'good morning, mister','',NULL,NULL,'hello world',0,0,1,NULL,9,NULL,9,1,2,NULL,NULL,'2024-11-03 12:37:35','2024-11-03 08:45:43',1,0,'2024-11-03 08:45:43','2024-11-03 12:37:35',11,NULL,NULL,0),(18,17,3,3,6,1,3,'hello bot','',NULL,NULL,'this is secret',0,0,1,NULL,9,NULL,9,1,2,NULL,NULL,'2024-11-03 12:37:35','2024-11-03 08:48:46',1,0,'2024-11-03 08:46:49','2024-11-03 12:37:35',11,NULL,NULL,0),(19,18,19,3,3,2,2,'hello world','',NULL,NULL,'reply of c',0,0,1,4,9,NULL,9,1,2,NULL,NULL,'2024-11-03 13:35:01','2024-11-03 13:35:01',2,0,'2024-11-03 08:48:46','2024-11-03 13:35:01',11,NULL,NULL,0);
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_in_list` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `custom_fields_mailbox_id_sort_order_index` (`mailbox_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_signatures`
--

DROP TABLE IF EXISTS `custom_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_signatures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int unsigned NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_signatures_mailbox_id_index` (`mailbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_signatures`
--

LOCK TABLES `custom_signatures` WRITE;
/*!40000 ALTER TABLE `custom_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_channel`
--

DROP TABLE IF EXISTS `customer_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_channel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `channel` tinyint unsigned NOT NULL,
  `channel_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_channel_channel_channel_id_unique` (`channel`,`channel_id`),
  KEY `customer_channel_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_channel`
--

LOCK TABLES `customer_channel` WRITE;
/*!40000 ALTER TABLE `customer_channel` DISABLE KEYS */;
INSERT INTO `customer_channel` VALUES (1,1,15,'972502760206'),(2,2,15,'972536257047'),(3,3,15,'972507733687'),(4,4,15,'972539609568'),(5,5,15,'972536258000'),(6,6,15,'972533954190'),(7,7,11,'802338679'),(8,8,11,'7512091566'),(9,9,11,'8033965966'),(10,1,13,'972502760206'),(11,10,13,'972525457035');
/*!40000 ALTER TABLE `customer_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customer_field`
--

DROP TABLE IF EXISTS `customer_customer_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_customer_field` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `customer_field_id` int unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_customer_field_customer_id_customer_field_id_unique` (`customer_id`,`customer_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customer_field`
--

LOCK TABLES `customer_customer_field` WRITE;
/*!40000 ALTER TABLE `customer_customer_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customer_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_fields`
--

DROP TABLE IF EXISTS `customer_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  `customer_can_view` tinyint(1) NOT NULL DEFAULT '0',
  `customer_can_edit` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '1',
  `conv_list` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_fields_sort_order_index` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_fields`
--

LOCK TABLES `customer_fields` WRITE;
/*!40000 ALTER TABLE `customer_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo_type` tinyint unsigned DEFAULT NULL,
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phones` text COLLATE utf8mb4_unicode_ci,
  `websites` text COLLATE utf8mb4_unicode_ci,
  `social_profiles` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `channel` tinyint unsigned DEFAULT NULL,
  `channel_id` text COLLATE utf8mb4_unicode_ci,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `spam_status` text COLLATE utf8mb4_unicode_ci,
  `enriched` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_first_name(80)_last_name(80)_index` (`first_name`(80),`last_name`(80))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'972502760206',NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"972502760206\",\"type\":1,\"n\":\"972502760206\"}]',NULL,NULL,NULL,NULL,'','','','','2024-10-28 10:52:05','2024-10-30 07:29:07',15,'972502760206','{\"wlastdate\":1730273347.119075}',NULL,NULL),(2,'972536257047',NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"972536257047\",\"type\":1,\"n\":\"972536257047\"}]',NULL,NULL,NULL,NULL,'','','','','2024-10-28 10:52:05','2024-10-28 10:52:05',15,'972536257047',NULL,NULL,NULL),(3,'972507733687',NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"972507733687\",\"type\":1,\"n\":\"972507733687\"}]',NULL,NULL,NULL,NULL,'','','','','2024-10-28 10:52:05','2024-10-28 10:52:05',15,'972507733687',NULL,NULL,NULL),(4,'972539609568',NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"972539609568\",\"type\":1,\"n\":\"972539609568\"}]',NULL,NULL,NULL,NULL,'','','','','2024-10-28 10:52:06','2024-10-28 10:52:06',15,'972539609568',NULL,NULL,NULL),(5,'972536258000',NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"972536258000\",\"type\":1,\"n\":\"972536258000\"}]',NULL,NULL,NULL,NULL,'','','','','2024-10-28 10:52:06','2024-10-28 10:52:06',15,'972536258000',NULL,NULL,NULL),(6,'972533954190',NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"972533954190\",\"type\":1,\"n\":\"972533954190\"}]',NULL,NULL,NULL,NULL,'','','','','2024-10-28 10:52:07','2024-10-28 10:52:07',15,'972533954190',NULL,NULL,NULL),(7,'Viki','Nachum',NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-28 11:47:59','2024-10-28 11:47:59',11,'802338679',NULL,NULL,NULL),(8,'Elite',NULL,NULL,NULL,NULL,'e264c5dfd7417ac9305020d00d0d303d.jpg','[]',NULL,'[{\"value\":\"elitesoda\",\"type\":14}]',NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-28 12:00:15','2024-10-28 12:00:18',11,'7512091566',NULL,NULL,NULL),(9,'Miracle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"value\":\"Miracle0322\",\"type\":14}]',NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-28 12:08:24','2024-10-28 12:08:24',11,'8033965966',NULL,NULL,NULL),(10,'Nir Kugman','',NULL,NULL,NULL,NULL,'[{\"value\":\"972525457035\",\"type\":1,\"n\":\"972525457035\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-10-30 14:17:30','2024-11-03 06:41:46',13,'972525457035','{\"wlastdate\":1730616106.519439}',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `emails_email_unique` (`email`),
  KEY `emails_customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` tinyint unsigned NOT NULL,
  `total_count` int NOT NULL DEFAULT '0',
  `active_count` int NOT NULL DEFAULT '0',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `update_counters` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `folders_mailbox_id_user_id_type_index` (`mailbox_id`,`user_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` VALUES (1,1,NULL,1,2,2,NULL,1),(2,1,NULL,30,0,0,NULL,1),(3,1,NULL,40,4,1,NULL,1),(4,1,NULL,60,8,0,NULL,1),(5,1,NULL,80,0,0,NULL,1),(6,1,NULL,70,0,0,NULL,1),(7,1,1,20,0,0,NULL,1),(8,1,1,25,0,0,NULL,1),(9,1,2,20,3,0,NULL,1),(10,1,2,25,0,0,NULL,1),(11,1,4,20,2,1,NULL,1),(12,1,4,25,0,0,NULL,1);
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `user_id` int NOT NULL,
  `added_by_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `followers_conversation_id_user_id_unique` (`conversation_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jira_issue_conversation`
--

DROP TABLE IF EXISTS `jira_issue_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jira_issue_conversation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `jira_issue_id` int unsigned NOT NULL,
  `conversation_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jira_issue_conversation_jira_issue_id_conversation_id_unique` (`jira_issue_id`,`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jira_issue_conversation`
--

LOCK TABLES `jira_issue_conversation` WRITE;
/*!40000 ALTER TABLE `jira_issue_conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `jira_issue_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jira_issues`
--

DROP TABLE IF EXISTS `jira_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jira_issues` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int unsigned NOT NULL DEFAULT '0',
  `status` int unsigned NOT NULL DEFAULT '0',
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jira_issues_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jira_issues`
--

LOCK TABLES `jira_issues` WRITE;
/*!40000 ALTER TABLE `jira_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `jira_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kb_article_kb_category`
--

DROP TABLE IF EXISTS `kb_article_kb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kb_article_kb_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `kb_article_id` int NOT NULL,
  `kb_category_id` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kb_article_kb_category_kb_article_id_kb_category_id_unique` (`kb_article_id`,`kb_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kb_article_kb_category`
--

LOCK TABLES `kb_article_kb_category` WRITE;
/*!40000 ALTER TABLE `kb_article_kb_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `kb_article_kb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kb_articles`
--

DROP TABLE IF EXISTS `kb_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kb_articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '1',
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mailbox_id` int unsigned NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `kb_articles_mailbox_id_status_index` (`mailbox_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kb_articles`
--

LOCK TABLES `kb_articles` WRITE;
/*!40000 ALTER TABLE `kb_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `kb_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kb_categories`
--

DROP TABLE IF EXISTS `kb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kb_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kb_category_id` int DEFAULT NULL,
  `visibility` int unsigned NOT NULL DEFAULT '1',
  `expand` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '1',
  `articles_order` int NOT NULL DEFAULT '1',
  `mailbox_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kb_categories_mailbox_id_index` (`mailbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kb_categories`
--

LOCK TABLES `kb_categories` WRITE;
/*!40000 ALTER TABLE `kb_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `kb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kn_boards`
--

DROP TABLE IF EXISTS `kn_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kn_boards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox_id` int unsigned NOT NULL,
  `columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `swimlanes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kn_boards_created_by_user_id_mailbox_id_index` (`created_by_user_id`,`mailbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kn_boards`
--

LOCK TABLES `kn_boards` WRITE;
/*!40000 ALTER TABLE `kn_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `kn_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kn_cards`
--

DROP TABLE IF EXISTS `kn_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kn_cards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kn_board_id` int unsigned NOT NULL,
  `linked` tinyint(1) NOT NULL DEFAULT '0',
  `conversation_id` int unsigned NOT NULL,
  `kn_column_id` int unsigned NOT NULL,
  `kn_swimlane_id` int unsigned NOT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `kn_cards_kn_board_id_kn_column_id_sort_order_index` (`kn_board_id`,`kn_column_id`,`sort_order`),
  KEY `kn_cards_conversation_id_index` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kn_cards`
--

LOCK TABLES `kn_cards` WRITE;
/*!40000 ALTER TABLE `kn_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `kn_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_limits`
--

DROP TABLE IF EXISTS `license_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_limits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox` tinyint(1) DEFAULT NULL,
  `max_admin` tinyint(1) DEFAULT NULL,
  `max_user` tinyint unsigned DEFAULT NULL,
  `workflow` tinyint unsigned DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license_limits_inbox_index` (`mailbox`),
  KEY `license_limits_users_index` (`max_admin`),
  KEY `license_limits_max_user_index` (`max_user`),
  KEY `license_limits_workflow_index` (`workflow`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_limits`
--

LOCK TABLES `license_limits` WRITE;
/*!40000 ALTER TABLE `license_limits` DISABLE KEYS */;
INSERT INTO `license_limits` VALUES (1,NULL,3,NULL,NULL,'');
/*!40000 ALTER TABLE `license_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltm_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ltm_translations_hash_unique` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltm_translations`
--

LOCK TABLES `ltm_translations` WRITE;
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox_user`
--

DROP TABLE IF EXISTS `mailbox_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailbox_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `after_send` tinyint unsigned NOT NULL DEFAULT '2',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `mute` tinyint(1) NOT NULL DEFAULT '0',
  `access` text COLLATE utf8mb4_unicode_ci,
  `only_team` tinyint(1) NOT NULL DEFAULT '0',
  `only_unassigned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailbox_user_user_id_mailbox_id_unique` (`user_id`,`mailbox_id`),
  KEY `mailbox_user_mailbox_id_index` (`mailbox_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox_user`
--

LOCK TABLES `mailbox_user` WRITE;
/*!40000 ALTER TABLE `mailbox_user` DISABLE KEYS */;
INSERT INTO `mailbox_user` VALUES (1,1,1,2,0,0,NULL,0,0),(2,1,4,2,0,0,NULL,0,0);
/*!40000 ALTER TABLE `mailbox_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxes`
--

DROP TABLE IF EXISTS `mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailboxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aliases` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `from_name` tinyint unsigned NOT NULL DEFAULT '1',
  `from_name_custom` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_status` tinyint unsigned NOT NULL DEFAULT '2',
  `ticket_assignee` tinyint unsigned NOT NULL DEFAULT '2',
  `template` tinyint unsigned NOT NULL DEFAULT '1',
  `signature` text COLLATE utf8mb4_unicode_ci,
  `out_method` tinyint unsigned NOT NULL DEFAULT '1',
  `out_server` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `out_username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_password` text COLLATE utf8mb4_unicode_ci,
  `out_port` int unsigned DEFAULT NULL,
  `out_encryption` tinyint unsigned NOT NULL DEFAULT '1',
  `in_server` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `in_port` int unsigned NOT NULL DEFAULT '143',
  `in_username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_password` text COLLATE utf8mb4_unicode_ci,
  `in_protocol` tinyint unsigned NOT NULL DEFAULT '1',
  `in_encryption` tinyint unsigned NOT NULL DEFAULT '1',
  `auto_reply_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `auto_reply_subject` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_reply_message` text COLLATE utf8mb4_unicode_ci,
  `office_hours_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `ratings` tinyint(1) NOT NULL DEFAULT '0',
  `ratings_placement` tinyint unsigned NOT NULL DEFAULT '1',
  `ratings_text` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_validate_cert` tinyint(1) NOT NULL DEFAULT '1',
  `in_imap_folders` text COLLATE utf8mb4_unicode_ci,
  `auto_bcc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `before_reply` text COLLATE utf8mb4_unicode_ci,
  `imap_sent_folder` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `aliases_reply` tinyint(1) NOT NULL DEFAULT '0',
  `ratings_trans` text COLLATE utf8mb4_unicode_ci,
  `wc` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailboxes_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxes`
--

LOCK TABLES `mailboxes` WRITE;
/*!40000 ALTER TABLE `mailboxes` DISABLE KEYS */;
INSERT INTO `mailboxes` VALUES (1,'ai tests','aitest@smarticks.co',NULL,1,NULL,2,2,1,'<br><span style=\"color:#808080;\">--<br>\n{%mailbox.name%}</span>',1,NULL,NULL,NULL,NULL,1,NULL,143,NULL,NULL,1,1,0,NULL,NULL,0,0,1,NULL,'2024-10-28 09:03:58','2024-10-29 08:03:54',1,NULL,NULL,NULL,NULL,'{\"mi\":{\"icon\":\"98cff278.png\"},\"voipesmstickets\":{\"organisation\":\"test16\",\"token\":\"9d740e3374833617850fae2cd1910886\",\"sender\":\"0536257098\",\"last\":50573},\"telegram\":{\"enabled\":1,\"token\":\"7910203149:AAEbOmREZmW623KuqXhCUu93BGDUpiCbYho\",\"auto_reply\":null},\"whatsapp\":{\"enabled\":1,\"initiate_enabled\":1,\"system\":\"1\",\"instance\":\"FRO892609167\",\"token\":\"1GOwzq2qq80tcGlHfIgfFrZk7iIjYAOz\",\"twilio_sid\":null,\"twilio_token\":null,\"twilio_phone_number\":null}}',0,NULL,NULL);
/*!40000 ALTER TABLE `mailboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_04_02_193005_create_translations_table',1),(2,'2018_06_10_000000_create_users_table',1),(3,'2018_06_10_100000_create_password_resets_table',1),(4,'2018_06_25_065719_create_mailboxes_table',1),(5,'2018_06_29_041002_create_mailbox_user_table',1),(6,'2018_07_07_071443_create_activity_logs_table',1),(7,'2018_07_09_052314_create_emails_table',1),(8,'2018_07_09_053559_create_customers_table',1),(9,'2018_07_11_010333_create_conversations_table',1),(10,'2018_07_11_074558_create_folders_table',1),(11,'2018_07_11_081928_create_conversation_folder_table',1),(12,'2018_07_12_003318_create_threads_table',1),(13,'2018_07_30_153206_create_jobs_table',1),(14,'2018_07_30_165237_create_failed_jobs_table',1),(15,'2018_08_04_063414_create_attachments_table',1),(16,'2018_08_05_045458_create_options_table',1),(17,'2018_08_05_153518_create_subscriptions_table',1),(18,'2018_08_06_114901_create_send_logs_table',1),(19,'2018_09_05_024109_create_notifications_table',1),(20,'2018_09_05_033609_create_polycast_events_table',1),(21,'2018_11_04_113009_create_modules_table',1),(22,'2018_11_13_143000_encrypt_mailbox_password',1),(23,'2018_11_26_122617_add_locale_column_to_users_table',1),(24,'2018_12_11_130728_add_status_column_to_users_table',1),(25,'2018_12_15_151003_add_send_status_data_column_to_threads_table',1),(26,'2019_06_16_124000_add_in_validate_cert_column_to_mailboxes_table',1),(27,'2019_06_21_130200_add_meta_subtype_columns_to_threads_table',1),(28,'2019_06_25_105200_change_status_message_column_in_send_logs_table',1),(29,'2019_07_05_370100_add_in_imap_folders_column_to_mailboxes_table',1),(30,'2019_10_06_123000_add_auto_bcc_column_to_mailboxes_table',1),(31,'2019_12_10_0856000_add_before_reply_column_to_mailboxes_table',1),(32,'2019_12_19_183015_add_meta_column_to_folders_table',1),(33,'2019_12_22_111025_change_passwords_types_in_mailboxes_table',1),(34,'2019_12_24_155120_create_followers_table',1),(35,'2020_02_06_103815_add_hide_column_to_mailbox_user_table',1),(36,'2020_02_16_121001_add_mute_column_to_mailbox_user_table',1),(37,'2020_03_06_100100_add_public_column_to_attachments_table',1),(38,'2020_03_29_095201_update_in_imap_folders_in_mailboxes_table',1),(39,'2020_04_16_122803_add_imap_sent_folder_column_to_mailboxes_table',1),(40,'2020_05_28_095100_drop_slug_column_in_mailboxes_table',1),(41,'2020_06_26_080258_add_email_history_column_to_conversations_table',1),(42,'2020_09_18_123314_add_access_column_to_mailbox_user_table',1),(43,'2020_09_20_010000_drop_email_history_column_in_conversations_table',1),(44,'2020_11_04_140000_change_foreign_keys_types',1),(45,'2020_11_19_070000_update_customers_table',1),(46,'2020_12_22_070000_move_user_permissions_to_env',1),(47,'2020_12_22_080000_add_permissions_column_to_users_table',1),(48,'2020_12_30_010000_add_imported_column_to_threads_table',1),(49,'2021_02_06_010101_add_meta_column_to_mailboxes_table',1),(50,'2021_02_09_010101_add_hash_column_to_ltm_translations_table',1),(51,'2021_02_17_010101_change_string_columns_in_mailboxes_table',1),(52,'2021_03_01_010101_add_channel_column_to_conversations_table',1),(53,'2021_03_01_010101_add_channel_columns_to_customers_table',1),(54,'2021_04_15_010101_add_meta_column_to_customers_table',1),(55,'2021_05_21_090000_encrypt_mailbox_out_password',1),(56,'2021_05_21_105200_encrypt_mail_password',1),(57,'2021_09_21_010101_add_indexes_to_conversations_table',1),(58,'2021_11_30_010101_remove_unique_index_in_folders_table',1),(59,'2021_12_25_010101_change_emails_column_in_users_table',1),(60,'2022_12_17_010101_add_meta_column_to_conversations_table',1),(61,'2022_12_18_010101_set_user_type_field',1),(62,'2022_12_25_010101_set_numeric_phones_in_customers_table',1),(63,'2023_01_14_010101_change_deleted_folder_index',1),(64,'2023_05_09_010101_add_aliases_reply_column_to_mailboxes_table',1),(65,'2023_08_19_010101_create_customer_channel_table',1),(66,'2023_08_19_020202_populate_customer_channel_table',1),(67,'2023_08_29_010101_add_id_column_to_customer_channel_table',1),(68,'2023_09_05_010101_add_smtp_queue_id_column_to_send_logs_table',1),(69,'2023_11_14_010101_change_aliases_column_in_mailboxes_table',1),(70,'2024_06_18_010101_add_index_to_threads_table',1),(71,'2024_02_21_131705_add_open_on_this_page_to_users',2),(72,'2024_03_05_083330_create_license-limits_table',2),(73,'2024_03_06_060718_update_license_limits_table',2),(74,'2024_06_12_142000_update_mailbox_user_table',2),(75,'2024_06_26_124844_add_workflow_to_license_limits_table',2),(76,'2024_06_27_120500_billing_table',2),(77,'2024_06_27_123401_billing_statistics_sms',2),(78,'2024_07_01_131000_whatsapp_billing',2),(79,'2024_07_05_132900_whatsapp_templates',2),(80,'2024_08_05_140400_alter_limits',2),(81,'2024_09_04_160800_alter_folders',2),(82,'2018_10_26_090157_create_saved_relies_table',3),(83,'2018_11_01_113800_add_ratings_trans_column_to_mailboxes_table',3),(84,'2018_11_10_154000_add_rating_columns_to_threads_table',3),(85,'2018_11_13_174215_create_tags_table',3),(86,'2018_11_14_120425_create_conversation_tag_table',3),(87,'2019_05_02_153000_add_spam_status_column_to_customers_table',3),(88,'2019_07_06_155600_add_sort_order_column_to_saved_replies_table',3),(89,'2019_07_26_154300_add_translations_column_to_threads_table',3),(90,'2019_11_14_090100_create_timelogs_table',3),(91,'2019_11_30_083213_create_custom_fields_table',3),(92,'2019_12_02_083213_create_conversation_custom_field_table',3),(93,'2019_12_12_110003_create_workflows_table',3),(94,'2020_01_01_101530_create_conversation_workflow_table',3),(95,'2020_07_26_085200_change_color_column_in_tags_table',3),(96,'2020_08_10_000000_add_enriched_column_to_customers_table',3),(97,'2020_08_19_000000_create_two_factor_authentications_table',3),(98,'2020_09_12_150000_create_webhooks_table',3),(99,'2020_09_12_170000_create_webhook_logs_table',3),(100,'2020_11_25_010500_create_customer_fields_table',3),(101,'2020_11_25_020700_create_customer_customer_field_table',3),(102,'2021_02_02_010101_add_wc_column_to_mailboxes_table',3),(103,'2021_02_05_010101_create_kb_categories_table',3),(104,'2021_02_06_010101_create_kb_articles_table',3),(105,'2021_02_08_010101_create_kb_article_kb_category_table',3),(106,'2021_02_16_010101_add_mailbox_id_column_to_kb_categories_table',3),(107,'2021_02_16_020202_add_mailbox_id_column_to_kb_articles_table',3),(108,'2021_03_25_010101_add_parent_saved_reply_id_to_saved_replies_table',3),(109,'2021_07_11_010101_change_json_columns_in_two_factor_authentications_table',3),(110,'2021_10_11_010101_create_kn_boards_table',3),(111,'2021_10_11_020202_create_kn_cards_table',3),(112,'2021_10_14_010101_add_slug_column_to_kb_articles_table',3),(113,'2021_10_29_010101_change_string_columns_in_kb_articles_table',3),(114,'2021_10_31_010101_remove_name_index_in_kb_categories_table',3),(115,'2021_10_31_020202_change_string_columns_in_kb_categories_table',3),(116,'2022_01_09_010101_add_attachments_column_to_saved_replies_table',3),(117,'2022_04_06_000000_add_available_column_to_users_table',3),(118,'2022_05_12_000001_create_user_fields_table',3),(119,'2022_05_12_000002_create_user_user_field_table',3),(120,'2022_05_26_000001_create_jira_issues_table',3),(121,'2022_05_26_000002_create_jira_issue_conversation_table',3),(122,'2022_06_17_00000_add_snoozed_until_column_to_conversations_table',3),(123,'2022_07_02_000000_create_custom_signatures_table',3),(124,'2022_07_06_000000_create_checklist_items_table',3),(125,'2022_09_30_010101_change_options_column_in_custom_fields_table',3),(126,'2022_09_30_010101_change_options_column_in_customer_fields_table',3),(127,'2022_10_26_010101_add_show_in_list_column_to_custom_fields_table',3),(128,'2022_12_16_000000_add_conv_list_column_to_customer_fields_table',3),(129,'2022_12_17_010101_add_rpt_ready_to_conversations_table',3),(130,'2023_01_31_010101_set_teams_invite_state',3),(131,'2023_08_13_010101_add_mailboxes_column_to_webhooks_table',3),(132,'2023_08_29_010101_add_max_executions_column_to_workflows_table',3),(133,'2023_08_29_020202_add_counter_column_to_conversation_workflow_table',3),(134,'2023_10_28_010101_create_wallboards_table',3),(135,'2024_09_16_125100_custom_header',3),(136,'2024_01_06_000001_create_voipe_integration_calls_table',4),(137,'2024_01_08_125105_add_column_to_voipe_calls',4),(138,'2024_01_10_143404_create_table_voipe_integration_events_templates',4),(139,'2024_01_15_080058_add_column_event_to_voipe_calls',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `license` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_alias_unique` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'whatsapp',1,1,'95cf37b13b9ba1325d6ea5106588ac67'),(2,'inbox',1,1,'6a30d06f213b91a1592cce89b1ffee3e'),(3,'extendedattachments',1,1,'a0e9e6fe89dcba98b9138b241fa52619'),(4,'sentfolder',1,1,'343eb28ec6900043e4275cb99cab96b4'),(5,'mailboxicons',1,1,'cc0e9f85961d34a7fd0e597843b273cc'),(6,'smstickets',1,1,'2af63dba2eeb1030d1ba57a22be41f50'),(7,'tickettranslator',1,1,'4483404424901022d9aa2eeef540f76d'),(8,'customerdataenrichment',1,1,'a42f1cbcff5e1b6d9b8d74433b16680a'),(9,'wallboards',1,1,'56567cf59d36e1d54cdde9be60b00398'),(10,'edd',1,1,'632413ceb0fb8bb224be1144a30308b8'),(11,'woocommerce',1,1,'54c3cf04f67e95700048de37a1405b8b'),(12,'oauthlogin',1,1,'7d6e0f67659d8aadbb803b43d0bb83b7'),(13,'extendededitor',1,1,'a25b890805ea54b7406e51a6813ec9c7'),(14,'knowledgebase',1,1,'6f4bce2abf5102f9dc1dbf589c1dbd54'),(15,'crm',1,1,'5039be4742831048c0e541988137031a'),(16,'apiwebhooks',1,1,'71b0afd327f87c5d871f89dd8d19e84a'),(17,'reports',1,1,'afca67bf266aefd16df58b2f041ebe39'),(18,'customfolders',1,1,'7ce5a111492beb0d003c0eac60cb1370'),(19,'customfields',1,1,'bdb8987d90fabbcb421b081a5cf3b53a'),(20,'workflows',1,1,'beca917ae29718478673b5ee30e3a22a'),(21,'savedreplies',1,1,'6558a5e2cc171c9b93cac026e52b4f3b'),(22,'facebook',1,1,'630b245256ffc1ba5b167e8fd60f2f83'),(23,'telegramintegration',1,1,'c1346daf68fb10651b31efce089fadc3'),(24,'telegram',1,1,'a4a3ddd60965ec660aa870cc573546cb'),(25,'userfields',1,1,'d77e91144351fda04f44d0fe17392b42'),(26,'sendclose',1,1,'b15e1f3e3cb3131d5ba824f79e694546'),(27,'teams',1,1,'28169c34115b83cfb88225ee28ba8d9a'),(28,'whitelabel',1,1,'e61d0bb5b94697d9275acd1684867fd7'),(29,'satratings',1,1,'78f864bb36b96fc65c9105de88d6cc13'),(30,'officehours',1,1,'8ab1280fa071b6080254c42f8bd73759'),(31,'customhomepage',1,1,'3ffa4d5767a98078caa2d5ad59f0a323'),(32,'checklists',1,1,'c530abbacb9cb32b19a1ba8a175e6e66'),(33,'enduserportal',1,1,'7da3bf4a370f4ccf76318a8109bd4b01'),(34,'customization',1,1,'fec8ca7a9e9ab785ece9baff16e3d876'),(35,'ticketnumber',1,1,'56e0708e08c02ef8399d7f00b3bb6946'),(36,'embedimages',1,1,'ec662c33b8f8e1dad125259ceb5ae2e7'),(37,'chat',1,1,'fb118e783248d89fca5381923a14b796'),(38,'twofactorauth',1,1,'58bfe1a8c24d895640538873042aaa38'),(39,'timetracking',1,1,'ceceabd2be19d267d30de49631ecc67e'),(40,'spamfilter',1,1,'184a668afc4b35639b11d69f717965b7'),(41,'tags',1,1,'3380ea61fad67b45e5ea18c36ec7c115'),(42,'customsignatures',1,1,'269f12f75946f9381634caa7d4a18a45'),(43,'snooze',1,1,'db7836c2bd838d3758fd3434f92bc84d'),(44,'autologin',1,1,'a81388985037ee30633370ac17dcc4bd'),(45,'outofoffice',1,1,'f9557ae815add25f9ee5f708446e6635'),(46,'exportconversations',1,1,'3a1a7f269efff6e16b462496c0b23fd9'),(47,'saml',1,1,'ea202615f4320d11070ede17a114c0e0'),(48,'kanban',1,1,'fc9d3f43e1b82d018b0daf181ff77477'),(49,'globalmailbox',1,1,'4bbd55f5af7a2958af58e918bed7b81b'),(50,'emailcommands',1,1,'00626712e78141b94a71e9fc5cb97e2f'),(51,'extrasecurity',1,1,'94832e93a6b2c0b1a44bed72da5d6f78'),(52,'stickynotes',1,1,'819412107e01e2359ac8001a6d6cf776'),(53,'smsnotifications',1,1,'11d932488c74864fe82f6cb21aed114a'),(54,'darkmode',1,1,'f0d0b6399476d82d0adb70c1fc801809'),(55,'imapmove',1,1,'d0d652e8bf77eb0211a1d7cb48979496'),(56,'jira',1,1,'426f05fd941a63934270ba82b62e0e21'),(57,'mentions',1,1,'448f2e790a530c7dbdc95a2aa2dcb084'),(58,'noreply',1,1,'fb8829291876c36575d4a97a8a0bb286'),(59,'twitter',1,1,'6d96cc9278a3a4289d0fdf215c8af648'),(60,'mailsigning',1,1,'8fa943c2b5f7845e869bb0fc0574b661'),(61,'mobilenotifications',1,1,'3aa2d609121df1bb054765b9990ab3b2'),(64,'voipeintegration',1,0,NULL),(65,'voipesmstickets',1,0,NULL),(66,'whapi',1,0,NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_tmp`
--

DROP TABLE IF EXISTS `modules_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules_tmp` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `license` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_tmp`
--

LOCK TABLES `modules_tmp` WRITE;
/*!40000 ALTER TABLE `modules_tmp` DISABLE KEYS */;
INSERT INTO `modules_tmp` VALUES (1,'whatsapp',1,1,'95cf37b13b9ba1325d6ea5106588ac67'),(2,'inbox',1,1,'6a30d06f213b91a1592cce89b1ffee3e'),(3,'extendedattachments',1,1,'a0e9e6fe89dcba98b9138b241fa52619'),(4,'sentfolder',1,1,'343eb28ec6900043e4275cb99cab96b4'),(5,'mailboxicons',1,1,'cc0e9f85961d34a7fd0e597843b273cc'),(6,'smstickets',1,1,'2af63dba2eeb1030d1ba57a22be41f50'),(7,'tickettranslator',1,1,'4483404424901022d9aa2eeef540f76d'),(8,'customerdataenrichment',1,1,'a42f1cbcff5e1b6d9b8d74433b16680a'),(9,'wallboards',1,1,'56567cf59d36e1d54cdde9be60b00398'),(10,'edd',1,1,'632413ceb0fb8bb224be1144a30308b8'),(11,'woocommerce',1,1,'54c3cf04f67e95700048de37a1405b8b'),(12,'oauthlogin',1,1,'7d6e0f67659d8aadbb803b43d0bb83b7'),(13,'extendededitor',1,1,'a25b890805ea54b7406e51a6813ec9c7'),(14,'knowledgebase',1,1,'6f4bce2abf5102f9dc1dbf589c1dbd54'),(15,'crm',1,1,'5039be4742831048c0e541988137031a'),(16,'apiwebhooks',1,1,'71b0afd327f87c5d871f89dd8d19e84a'),(17,'reports',1,1,'afca67bf266aefd16df58b2f041ebe39'),(18,'customfolders',1,1,'7ce5a111492beb0d003c0eac60cb1370'),(19,'customfields',1,1,'bdb8987d90fabbcb421b081a5cf3b53a'),(20,'workflows',1,1,'beca917ae29718478673b5ee30e3a22a'),(21,'savedreplies',1,1,'6558a5e2cc171c9b93cac026e52b4f3b'),(22,'facebook',1,1,'630b245256ffc1ba5b167e8fd60f2f83'),(23,'telegramintegration',1,1,'c1346daf68fb10651b31efce089fadc3'),(24,'telegram',1,1,'a4a3ddd60965ec660aa870cc573546cb'),(25,'userfields',1,1,'d77e91144351fda04f44d0fe17392b42'),(26,'sendclose',1,1,'b15e1f3e3cb3131d5ba824f79e694546'),(27,'teams',1,1,'28169c34115b83cfb88225ee28ba8d9a'),(28,'whitelabel',1,1,'e61d0bb5b94697d9275acd1684867fd7'),(29,'satratings',1,1,'78f864bb36b96fc65c9105de88d6cc13'),(30,'officehours',1,1,'8ab1280fa071b6080254c42f8bd73759'),(31,'customhomepage',1,1,'3ffa4d5767a98078caa2d5ad59f0a323'),(32,'checklists',1,1,'c530abbacb9cb32b19a1ba8a175e6e66'),(33,'enduserportal',1,1,'7da3bf4a370f4ccf76318a8109bd4b01'),(34,'customization',1,1,'fec8ca7a9e9ab785ece9baff16e3d876'),(35,'ticketnumber',1,1,'56e0708e08c02ef8399d7f00b3bb6946'),(36,'embedimages',1,1,'ec662c33b8f8e1dad125259ceb5ae2e7'),(37,'chat',1,1,'fb118e783248d89fca5381923a14b796'),(38,'twofactorauth',1,1,'58bfe1a8c24d895640538873042aaa38'),(39,'timetracking',1,1,'ceceabd2be19d267d30de49631ecc67e'),(40,'spamfilter',1,1,'184a668afc4b35639b11d69f717965b7'),(41,'tags',1,1,'3380ea61fad67b45e5ea18c36ec7c115'),(42,'customsignatures',1,1,'269f12f75946f9381634caa7d4a18a45'),(43,'snooze',1,1,'db7836c2bd838d3758fd3434f92bc84d'),(44,'autologin',1,1,'a81388985037ee30633370ac17dcc4bd'),(45,'outofoffice',1,1,'f9557ae815add25f9ee5f708446e6635'),(46,'exportconversations',1,1,'3a1a7f269efff6e16b462496c0b23fd9'),(47,'saml',1,1,'ea202615f4320d11070ede17a114c0e0'),(48,'kanban',1,1,'fc9d3f43e1b82d018b0daf181ff77477'),(49,'globalmailbox',1,1,'4bbd55f5af7a2958af58e918bed7b81b'),(50,'emailcommands',1,1,'00626712e78141b94a71e9fc5cb97e2f'),(51,'extrasecurity',1,1,'94832e93a6b2c0b1a44bed72da5d6f78'),(52,'stickynotes',1,1,'819412107e01e2359ac8001a6d6cf776'),(53,'smsnotifications',1,1,'11d932488c74864fe82f6cb21aed114a'),(54,'darkmode',1,1,'f0d0b6399476d82d0adb70c1fc801809'),(55,'imapmove',1,1,'d0d652e8bf77eb0211a1d7cb48979496'),(56,'jira',1,1,'426f05fd941a63934270ba82b62e0e21'),(57,'mentions',1,1,'448f2e790a530c7dbdc95a2aa2dcb084'),(58,'noreply',1,1,'fb8829291876c36575d4a97a8a0bb286'),(59,'twitter',1,1,'6d96cc9278a3a4289d0fdf215c8af648'),(60,'mailsigning',1,1,'8fa943c2b5f7845e869bb0fc0574b661'),(61,'mobilenotifications',1,1,'3aa2d609121df1bb054765b9990ab3b2');
/*!40000 ALTER TABLE `modules_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('0313f207-87a9-4b0f-98c2-857e5aad4a3d','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":121,\"conversation_id\":10}','2024-10-30 10:24:55','2024-10-30 03:05:30','2024-10-30 10:24:55'),('05b0a062-3d18-44a4-b554-ff12febc9783','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":110,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('071d9575-dd89-4e49-9d07-e55668502f2f','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":112,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('09ae4693-1bc4-400d-95e2-3fbbdcbdbfad','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":148,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:44:49','2024-11-02 23:50:41'),('0aa2d375-ab70-4777-bc52-8b42b34b62fc','App\\Notifications\\WebsiteNotification',1,'App\\User','{\"thread_id\":83,\"conversation_id\":13}',NULL,'2024-10-29 12:41:16','2024-10-29 12:41:16'),('0fff4172-e7cb-4ce0-9f77-1ff1e7d7250e','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":126,\"conversation_id\":10}','2024-11-02 18:47:15','2024-10-30 10:26:33','2024-11-02 18:47:15'),('10308ebb-f3fd-4b8d-b5d8-079fa49aa7e9','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":74,\"conversation_id\":10}','2024-10-29 10:56:41','2024-10-29 10:56:40','2024-10-29 10:56:41'),('157a1d80-fed4-4ee1-a452-2e4a55964be1','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":127,\"conversation_id\":10}','2024-11-02 18:47:15','2024-10-30 10:26:33','2024-11-02 18:47:15'),('17ecf764-0235-4a04-bf58-8fdb17cd4566','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":154,\"conversation_id\":10}','2024-11-03 01:04:00','2024-11-03 00:46:17','2024-11-03 01:04:00'),('1eb3b381-7ad2-487c-860e-35186369d69e','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":142,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:28:32','2024-11-02 23:50:41'),('1f2521ee-9288-4ff5-af15-bd717c8d8e27','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":156,\"conversation_id\":10}','2024-11-03 01:12:01','2024-11-03 01:11:53','2024-11-03 01:12:01'),('243a5c90-2e05-4f27-bb32-2c848401745a','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":113,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('26fe1d4c-be0b-404b-8ec8-d5643a0c1cf9','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":173,\"conversation_id\":10}','2024-11-03 07:04:44','2024-11-03 07:04:43','2024-11-03 07:04:44'),('28d638b1-5d6b-46a4-97bd-ae6f6e0b47d7','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":125,\"conversation_id\":10}','2024-11-02 18:47:15','2024-10-30 10:26:33','2024-11-02 18:47:15'),('36a12f37-2591-46fc-ac5f-b9f0f43f8cbf','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":137,\"conversation_id\":10}','2024-11-02 23:22:06','2024-11-02 23:21:37','2024-11-02 23:22:06'),('3a6ae373-078b-4911-a131-1d73432903c6','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":138,\"conversation_id\":10}','2024-11-02 23:22:06','2024-11-02 23:21:37','2024-11-02 23:22:06'),('3db906bc-3c24-4d71-8b58-249edd621641','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":146,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:38:18','2024-11-02 23:50:41'),('564e90d1-3a27-4ac9-a2f3-371da690ff9a','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":115,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('5a3a1e43-5755-402c-ae5d-d36d2949d2c3','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":208,\"conversation_id\":19}','2024-11-03 13:22:44','2024-11-03 13:22:34','2024-11-03 13:22:44'),('5d436425-5a03-4a5c-8f32-bc1102af0681','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":169,\"conversation_id\":10}','2024-11-03 07:02:11','2024-11-03 06:59:58','2024-11-03 07:02:11'),('5e7ee1f9-3a81-49e7-9012-865bc9b4d6b4','App\\Notifications\\WebsiteNotification',1,'App\\User','{\"thread_id\":84,\"conversation_id\":13}',NULL,'2024-10-29 12:41:41','2024-10-29 12:41:41'),('5ed88b6c-5e61-4a70-8464-e6af4e0e8e41','App\\Notifications\\WebsiteNotification',2,'App\\User','{\"thread_id\":77,\"conversation_id\":11}','2024-10-29 12:37:15','2024-10-29 12:36:55','2024-10-29 12:37:15'),('5fff6588-001b-49f1-880f-6f397c03182a','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":159,\"conversation_id\":10}','2024-11-03 01:12:01','2024-11-03 01:11:53','2024-11-03 01:12:01'),('6163ac11-ae44-42be-baee-33cf0ac6a99f','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":92,\"conversation_id\":10}','2024-10-30 02:04:57','2024-10-30 01:30:43','2024-10-30 02:04:57'),('61fb1959-b7fe-4ef0-863f-e766222ae722','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":207,\"conversation_id\":19}','2024-11-03 13:21:21','2024-11-03 13:21:19','2024-11-03 13:21:21'),('69839a21-46d2-420d-88e7-cf75569abf38','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":140,\"conversation_id\":10}','2024-11-02 23:22:06','2024-11-02 23:21:57','2024-11-02 23:22:06'),('6c056d29-494b-4b4e-8de3-bb55107bd326','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":122,\"conversation_id\":10}','2024-10-30 10:24:55','2024-10-30 03:23:26','2024-10-30 10:24:55'),('6cfb92f0-e72b-4c4d-846b-9156b3744865','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":171,\"conversation_id\":10}','2024-11-03 07:02:22','2024-11-03 07:02:13','2024-11-03 07:02:22'),('6d284402-f46e-457a-b26a-9cf63e8e20e9','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":155,\"conversation_id\":10}','2024-11-03 01:04:00','2024-11-03 00:48:02','2024-11-03 01:04:00'),('70b060fd-2641-4b40-a0ac-00eb7d6ff430','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":157,\"conversation_id\":10}','2024-11-03 01:12:01','2024-11-03 01:11:53','2024-11-03 01:12:01'),('7246bd13-550f-43ad-a36c-3b3962cd80a1','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":134,\"conversation_id\":10}','2024-11-02 18:48:42','2024-11-02 18:48:00','2024-11-02 18:48:42'),('728fa2d3-fdfb-4505-be7c-68126187e6b7','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":172,\"conversation_id\":10}','2024-11-03 07:03:56','2024-11-03 07:03:28','2024-11-03 07:03:56'),('75962558-522a-4c06-9eff-2fb60c4ab503','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":120,\"conversation_id\":10}','2024-10-30 10:24:55','2024-10-30 03:03:35','2024-10-30 10:24:55'),('80164415-314e-4e33-bc4f-8bfac73dcfd6','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":76,\"conversation_id\":10}','2024-10-29 10:59:22','2024-10-29 10:57:40','2024-10-29 10:59:22'),('8a71a96d-0a01-4908-86c2-e867603d89ff','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":167,\"conversation_id\":10}','2024-11-03 06:56:15','2024-11-03 02:16:27','2024-11-03 06:56:15'),('8a73a23a-ae1f-4262-bc18-71b16a090afd','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":85,\"conversation_id\":10}','2024-10-30 01:30:35','2024-10-29 12:42:56','2024-10-30 01:30:35'),('8e6d359e-41b8-4e69-a424-b730689af8e7','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":145,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:38:18','2024-11-02 23:50:41'),('957be2f1-b7a3-4f2f-94e1-e00a06790cbb','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":180,\"conversation_id\":10}','2024-11-03 08:45:24','2024-11-03 08:43:08','2024-11-03 08:45:24'),('97475af3-0ff9-4d85-a01f-a025ffd31f00','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":163,\"conversation_id\":10}','2024-11-03 06:56:15','2024-11-03 02:15:01','2024-11-03 06:56:15'),('a7b46140-54c1-43ba-b001-22412424ba1b','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":206,\"conversation_id\":19}','2024-11-03 13:20:06','2024-11-03 13:12:49','2024-11-03 13:20:06'),('a85557dd-9c9e-4897-8855-2ae2d2721c89','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":136,\"conversation_id\":10}','2024-11-02 23:22:06','2024-11-02 19:15:25','2024-11-02 23:22:06'),('aa1d9830-8bcf-4b90-9eb0-ecb4791d5319','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":117,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('afecc7a2-2f6e-47b9-9365-424aa72fa343','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":166,\"conversation_id\":10}','2024-11-03 06:56:15','2024-11-03 02:16:22','2024-11-03 06:56:15'),('b67fa4dd-c5a8-439b-9398-2345153f92b7','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":114,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('bac76f42-99ff-4dcb-8325-3e0c8a60a12f','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":139,\"conversation_id\":10}','2024-11-02 23:22:06','2024-11-02 23:21:37','2024-11-02 23:22:06'),('bb1a07ad-c164-4d00-bb8e-e97cdeaa07f4','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":178,\"conversation_id\":10}','2024-11-03 08:40:46','2024-11-03 08:29:37','2024-11-03 08:40:46'),('bdcba42c-0f53-4bfe-8f74-26c092fbf730','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":91,\"conversation_id\":10}','2024-10-30 01:30:35','2024-10-30 01:07:57','2024-10-30 01:30:35'),('bfa08a43-4249-494c-ab3c-0e59a6c95a5e','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":151,\"conversation_id\":10}','2024-11-03 01:04:00','2024-11-03 00:40:31','2024-11-03 01:04:00'),('c31b62d7-e07b-4058-8071-c292c658c8d7','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":111,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('c74cd901-05a1-469f-911d-d8eabe9ff18f','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":152,\"conversation_id\":10}','2024-11-03 01:04:00','2024-11-03 00:43:21','2024-11-03 01:04:00'),('c79c20bd-2806-4876-92c8-8d65709d8cdb','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":141,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:24:57','2024-11-02 23:50:41'),('c85709a1-96f7-48b5-8b09-53e8508cef98','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":158,\"conversation_id\":10}','2024-11-03 01:12:01','2024-11-03 01:11:53','2024-11-03 01:12:01'),('ca3d45be-edc1-422d-8044-f9841f061a0e','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":160,\"conversation_id\":10}','2024-11-03 01:12:01','2024-11-03 01:11:53','2024-11-03 01:12:01'),('cc1939cc-13b0-482d-8f96-9966c6828c39','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":153,\"conversation_id\":10}','2024-11-03 01:04:00','2024-11-03 00:44:21','2024-11-03 01:04:00'),('ce4286d8-32cf-4e78-a39c-87c8961b8e78','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":119,\"conversation_id\":10}','2024-10-30 10:24:55','2024-10-30 03:02:30','2024-10-30 10:24:55'),('ce891e91-b304-452b-81d9-ddde157ed4ed','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":143,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:29:48','2024-11-02 23:50:41'),('d05da495-0229-4696-b4ff-cff9d33c98c4','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":116,\"conversation_id\":10}','2024-10-30 03:00:59','2024-10-30 02:59:36','2024-10-30 03:00:59'),('d085bec5-65c9-485e-b74b-f7c2ad4bfa8f','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":165,\"conversation_id\":10}','2024-11-03 06:56:15','2024-11-03 02:16:12','2024-11-03 06:56:15'),('d76d80fc-fb52-4a25-b7ad-00d26e281b45','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":118,\"conversation_id\":10}','2024-10-30 10:24:55','2024-10-30 03:02:10','2024-10-30 10:24:55'),('e2dfa7cd-a79a-4299-a14d-091183b3520a','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":164,\"conversation_id\":10}','2024-11-03 06:56:15','2024-11-03 02:16:01','2024-11-03 06:56:15'),('e3fea824-74be-40ed-b7c0-95256a6a96bc','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":162,\"conversation_id\":10}','2024-11-03 01:42:34','2024-11-03 01:22:39','2024-11-03 01:42:34'),('e65cb34e-00e2-48d1-8805-64aa232f8605','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":147,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:38:18','2024-11-02 23:50:41'),('ed1410af-e939-41a5-967f-d77b8baa84d6','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":123,\"conversation_id\":10}','2024-10-30 10:24:55','2024-10-30 03:24:31','2024-10-30 10:24:55'),('effc7813-eef5-4ee5-855f-a47c04e863fc','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":107,\"conversation_id\":10}','2024-10-30 02:24:02','2024-10-30 02:23:59','2024-10-30 02:24:02'),('f19eb7d7-1b48-4645-be74-d8c930e0b43b','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":97,\"conversation_id\":10}','2024-10-30 02:15:34','2024-10-30 02:15:23','2024-10-30 02:15:34'),('f1b9af64-c5e6-44d4-8c32-fd8325c349b3','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":144,\"conversation_id\":10}','2024-11-02 23:50:41','2024-11-02 23:38:18','2024-11-02 23:50:41'),('f8be40bf-4f72-4037-a5a5-5dec5c459fc1','App\\Notifications\\WebsiteNotification',4,'App\\User','{\"thread_id\":133,\"conversation_id\":10}','2024-11-02 18:47:15','2024-10-31 00:03:50','2024-11-02 18:47:15');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `options_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'fetch_emails_last_run','1730578743'),(2,'fetch_emails_last_successful_run','1730578743'),(3,'alert_fetch_sent','0'),(4,'mail_from','temp@smarticks.com'),(5,'mail_driver','smtp'),(6,'mail_host','send.smtp.com'),(7,'mail_port','465'),(8,'mail_username','support@voipe.co.il'),(9,'mail_password','eyJpdiI6IndRaXZXWDcrdlNja0xNRXhpVUNoeVE9PSIsInZhbHVlIjoiVDVGS0hYTlRrTGRTRFFUNmxoK0lGZzZ0a1M1XC9sN3JkSTRoTHJ0clwvZk9BPSIsIm1hYyI6IjJjNmZjM2FjZmVhYWVjYjJkNTA4M2IyODIyMWMzODE5ZmM0ZDFmZWYzZDMwMzE5N2Y4Y2RiYmZkOWEzYWZjNzIifQ=='),(10,'mail_encryption','ssl'),(11,'send_test_to','viki@voipe.co.il');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polycast_events`
--

DROP TABLE IF EXISTS `polycast_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polycast_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channels` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `polycast_events_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polycast_events`
--

LOCK TABLES `polycast_events` WRITE;
/*!40000 ALTER TABLE `polycast_events` DISABLE KEYS */;
INSERT INTO `polycast_events` VALUES (910,'[{\"name\":\"conv\"}]','App\\Events\\RealtimeConvView','{\"conversation_id\":19,\"user_id\":4,\"user_photo_url\":\"\",\"user_initials\":\"PB\",\"user_name\":\"petro bakumenko\",\"replying\":0,\"socket\":null}','2024-11-03 13:34:57'),(911,'[{\"name\":\"conv.19\"}]','App\\Events\\RealtimeConvNewThread','{\"thread_id\":209,\"conversation_id\":19,\"mailbox_id\":1,\"socket\":null}','2024-11-03 13:35:01'),(912,'[{\"name\":\"mailbox.1\"}]','App\\Events\\RealtimeMailboxNewThread','{\"mailbox_id\":1,\"socket\":null}','2024-11-03 13:35:01'),(913,'[{\"name\":\"chat.1\"}]','App\\Events\\RealtimeChat','{\"mailbox_id\":1,\"socket\":null}','2024-11-03 13:35:01'),(914,'[{\"name\":\"conv\"}]','App\\Events\\RealtimeConvView','{\"conversation_id\":19,\"user_id\":4,\"user_photo_url\":\"\",\"user_initials\":\"PB\",\"user_name\":\"petro bakumenko\",\"replying\":0,\"socket\":null}','2024-11-03 13:35:02');
/*!40000 ALTER TABLE `polycast_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_replies`
--

DROP TABLE IF EXISTS `saved_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved_replies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `parent_saved_reply_id` int unsigned DEFAULT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `saved_replies_mailbox_id_sort_order_index` (`mailbox_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_replies`
--

LOCK TABLES `saved_replies` WRITE;
/*!40000 ALTER TABLE `saved_replies` DISABLE KEYS */;
INSERT INTO `saved_replies` VALUES (1,1,'how can i help','<div>how can i help?<br></div>',2,'2024-10-29 12:42:21','2024-10-29 12:42:21',1,NULL,NULL),(2,1,'no response','<div>hi,</div><div>we didnt receive you response</div>',2,'2024-10-29 12:42:50','2024-10-29 12:42:50',2,NULL,NULL);
/*!40000 ALTER TABLE `saved_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_logs`
--

DROP TABLE IF EXISTS `send_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `send_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `message_id` varchar(998) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_type` tinyint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL,
  `status_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `smtp_queue_id` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `send_logs_message_id_index` (`message_id`(191)),
  KEY `send_logs_customer_id_mail_type_created_at_index` (`customer_id`,`mail_type`,`created_at`),
  KEY `send_logs_thread_id_index` (`thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_logs`
--

LOCK TABLES `send_logs` WRITE;
/*!40000 ALTER TABLE `send_logs` DISABLE KEYS */;
INSERT INTO `send_logs` VALUES (1,NULL,NULL,2,NULL,'viki@voipe.co.il',4,2,'','2024-10-28 09:03:28','2024-10-28 09:03:28',NULL),(2,NULL,NULL,NULL,NULL,'viki@voipe.co.il',7,1,'','2024-10-28 09:06:12','2024-10-28 09:06:12',NULL),(3,NULL,NULL,2,NULL,'viki@voipe.co.il',4,1,'','2024-10-28 09:06:54','2024-10-28 09:06:54',NULL),(4,NULL,NULL,4,NULL,'petrobakumenko22@gmail.com',4,1,'','2024-10-28 12:00:19','2024-10-28 12:00:19',NULL),(5,74,NULL,4,'notify-74-4-1730199400@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-29 10:56:40','2024-10-29 10:56:40',NULL),(6,76,NULL,4,'notify-76-4-1730199460@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-29 10:57:40','2024-10-29 10:57:40',NULL),(7,77,NULL,2,'notify-77-2-1730205415@smarticks.co','viki@voipe.co.il',2,2,'','2024-10-29 12:36:55','2024-10-29 12:36:55',NULL),(8,83,NULL,1,'notify-83-1-1730205676@smarticks.co','nir@voipe.co.il',2,2,'','2024-10-29 12:41:16','2024-10-29 12:41:16',NULL),(9,84,NULL,1,'notify-84-1-1730205701@smarticks.co','nir@voipe.co.il',2,2,'','2024-10-29 12:41:41','2024-10-29 12:41:41',NULL),(10,85,NULL,4,'notify-85-4-1730205776@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-29 12:42:56','2024-10-29 12:42:56',NULL),(11,91,NULL,4,'notify-91-4-1730250477@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 01:07:57','2024-10-30 01:07:57',NULL),(12,92,NULL,4,'notify-92-4-1730251843@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 01:30:43','2024-10-30 01:30:43',NULL),(13,97,NULL,4,'notify-97-4-1730254523@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:15:23','2024-10-30 02:15:23',NULL),(14,107,NULL,4,'notify-107-4-1730255039@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:23:59','2024-10-30 02:23:59',NULL),(15,110,NULL,4,'notify-110-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(16,111,NULL,4,'notify-111-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(17,112,NULL,4,'notify-112-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(18,113,NULL,4,'notify-113-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(19,114,NULL,4,'notify-114-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(20,115,NULL,4,'notify-115-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(21,116,NULL,4,'notify-116-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(22,117,NULL,4,'notify-117-4-1730257176@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 02:59:36','2024-10-30 02:59:36',NULL),(23,118,NULL,4,'notify-118-4-1730257330@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 03:02:10','2024-10-30 03:02:10',NULL),(24,119,NULL,4,'notify-119-4-1730257350@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 03:02:30','2024-10-30 03:02:30',NULL),(25,120,NULL,4,'notify-120-4-1730257415@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 03:03:35','2024-10-30 03:03:35',NULL),(26,121,NULL,4,'notify-121-4-1730257530@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 03:05:30','2024-10-30 03:05:30',NULL),(27,122,NULL,4,'notify-122-4-1730258606@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 03:23:26','2024-10-30 03:23:26',NULL),(28,123,NULL,4,'notify-123-4-1730258671@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 03:24:31','2024-10-30 03:24:31',NULL),(29,125,NULL,4,'notify-125-4-1730283993@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 10:26:33','2024-10-30 10:26:33',NULL),(30,126,NULL,4,'notify-126-4-1730283993@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 10:26:33','2024-10-30 10:26:33',NULL),(31,127,NULL,4,'notify-127-4-1730283993@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-30 10:26:33','2024-10-30 10:26:33',NULL),(32,133,NULL,4,'notify-133-4-1730333030@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-10-31 00:03:50','2024-10-31 00:03:50',NULL),(33,134,NULL,4,'notify-134-4-1730573280@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 18:48:00','2024-11-02 18:48:00',NULL),(34,136,NULL,4,'notify-136-4-1730574925@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 19:15:25','2024-11-02 19:15:25',NULL),(35,137,NULL,4,'notify-137-4-1730589696@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:21:36','2024-11-02 23:21:36',NULL),(36,138,NULL,4,'notify-138-4-1730589696@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:21:37','2024-11-02 23:21:37',NULL),(37,139,NULL,4,'notify-139-4-1730589697@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:21:37','2024-11-02 23:21:37',NULL),(38,140,NULL,4,'notify-140-4-1730589717@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:21:57','2024-11-02 23:21:57',NULL),(39,141,NULL,4,'notify-141-4-1730589897@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:24:57','2024-11-02 23:24:57',NULL),(40,142,NULL,4,'notify-142-4-1730590112@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:28:32','2024-11-02 23:28:32',NULL),(41,143,NULL,4,'notify-143-4-1730590187@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:29:48','2024-11-02 23:29:48',NULL),(42,144,NULL,4,'notify-144-4-1730590698@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:38:18','2024-11-02 23:38:18',NULL),(43,145,NULL,4,'notify-145-4-1730590698@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:38:18','2024-11-02 23:38:18',NULL),(44,146,NULL,4,'notify-146-4-1730590698@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:38:18','2024-11-02 23:38:18',NULL),(45,147,NULL,4,'notify-147-4-1730590698@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:38:18','2024-11-02 23:38:18',NULL),(46,148,NULL,4,'notify-148-4-1730591089@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-02 23:44:49','2024-11-02 23:44:49',NULL),(47,151,NULL,4,'notify-151-4-1730594431@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 00:40:31','2024-11-03 00:40:31',NULL),(48,152,NULL,4,'notify-152-4-1730594601@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 00:43:21','2024-11-03 00:43:21',NULL),(49,153,NULL,4,'notify-153-4-1730594661@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 00:44:21','2024-11-03 00:44:21',NULL),(50,154,NULL,4,'notify-154-4-1730594777@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 00:46:17','2024-11-03 00:46:17',NULL),(51,155,NULL,4,'notify-155-4-1730594882@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 00:48:02','2024-11-03 00:48:02',NULL),(52,156,NULL,4,'notify-156-4-1730596313@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 01:11:53','2024-11-03 01:11:53',NULL),(53,157,NULL,4,'notify-157-4-1730596313@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 01:11:53','2024-11-03 01:11:53',NULL),(54,158,NULL,4,'notify-158-4-1730596313@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 01:11:53','2024-11-03 01:11:53',NULL),(55,159,NULL,4,'notify-159-4-1730596313@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 01:11:53','2024-11-03 01:11:53',NULL),(56,160,NULL,4,'notify-160-4-1730596313@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 01:11:53','2024-11-03 01:11:53',NULL),(57,162,NULL,4,'notify-162-4-1730596959@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 01:22:39','2024-11-03 01:22:39',NULL),(58,163,NULL,4,'notify-163-4-1730600101@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 02:15:01','2024-11-03 02:15:01',NULL),(59,164,NULL,4,'notify-164-4-1730600161@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 02:16:01','2024-11-03 02:16:01',NULL),(60,165,NULL,4,'notify-165-4-1730600171@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 02:16:12','2024-11-03 02:16:12',NULL),(61,166,NULL,4,'notify-166-4-1730600182@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 02:16:22','2024-11-03 02:16:22',NULL),(62,167,NULL,4,'notify-167-4-1730600187@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 02:16:27','2024-11-03 02:16:27',NULL),(63,169,NULL,4,'notify-169-4-1730617197@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 06:59:58','2024-11-03 06:59:58',NULL),(64,171,NULL,4,'notify-171-4-1730617333@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 07:02:13','2024-11-03 07:02:13',NULL),(65,172,NULL,4,'notify-172-4-1730617408@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 07:03:28','2024-11-03 07:03:28',NULL),(66,173,NULL,4,'notify-173-4-1730617483@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 07:04:43','2024-11-03 07:04:43',NULL),(67,178,NULL,4,'notify-178-4-1730622577@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 08:29:37','2024-11-03 08:29:37',NULL),(68,180,NULL,4,'notify-180-4-1730623388@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 08:43:08','2024-11-03 08:43:08',NULL),(69,206,NULL,4,'notify-206-4-1730639569@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 13:12:49','2024-11-03 13:12:49',NULL),(70,207,NULL,4,'notify-207-4-1730640079@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 13:21:19','2024-11-03 13:21:19',NULL),(71,208,NULL,4,'notify-208-4-1730640154@smarticks.co','petrobakumenko22@gmail.com',2,2,'','2024-11-03 13:22:34','2024-11-03 13:22:34',NULL);
/*!40000 ALTER TABLE `send_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `medium` tinyint unsigned NOT NULL,
  `event` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_user_id_medium_event_unique` (`user_id`,`medium`,`event`),
  KEY `subscriptions_user_id_event_index` (`user_id`,`event`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,1,2),(3,1,1,3),(4,1,1,5),(2,1,1,13),(5,1,2,2),(7,1,2,3),(8,1,2,5),(6,1,2,13),(9,2,1,2),(11,2,1,3),(12,2,1,5),(10,2,1,13),(13,2,2,2),(15,2,2,3),(16,2,2,5),(14,2,2,13),(17,3,1,2),(19,3,1,3),(20,3,1,5),(18,3,1,13),(21,3,2,2),(23,3,2,3),(24,3,2,5),(22,3,2,13),(25,4,1,2),(27,4,1,3),(28,4,1,5),(26,4,1,13),(29,4,2,2),(31,4,2,3),(32,4,2,5),(30,4,2,13);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter` int NOT NULL DEFAULT '0',
  `color` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'new tag',0,0);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` tinyint unsigned NOT NULL,
  `subtype` tinyint unsigned DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `action_type` tinyint unsigned DEFAULT NULL,
  `action_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8mb4_unicode_ci,
  `cc` text COLLATE utf8mb4_unicode_ci,
  `bcc` text COLLATE utf8mb4_unicode_ci,
  `has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `message_id` varchar(998) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_via` tinyint unsigned NOT NULL,
  `source_type` tinyint unsigned NOT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `created_by_user_id` int unsigned DEFAULT NULL,
  `created_by_customer_id` int unsigned DEFAULT NULL,
  `edited_by_user_id` int DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT NULL,
  `body_original` longtext COLLATE utf8mb4_unicode_ci,
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `saved_reply_id` int DEFAULT NULL,
  `send_status` tinyint unsigned DEFAULT NULL,
  `send_status_data` text COLLATE utf8mb4_unicode_ci,
  `opened_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  `rating` tinyint unsigned DEFAULT NULL,
  `rating_comment` text COLLATE utf8mb4_unicode_ci,
  `translations` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `threads_message_id_index` (`message_id`(191)),
  KEY `threads_conversation_id_type_from_customer_id_index` (`conversation_id`,`type`,`from`,`customer_id`),
  KEY `threads_conversation_id_created_at_index` (`conversation_id`,`created_at`),
  KEY `threads_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
INSERT INTO `threads` VALUES (1,1,NULL,1,NULL,1,2,NULL,NULL,'בדיקה',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(2,1,NULL,1,NULL,1,2,NULL,NULL,'בדיקה',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(3,1,NULL,1,NULL,1,2,NULL,NULL,'חדש',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(4,1,NULL,1,NULL,1,2,NULL,NULL,'היי',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(5,2,NULL,1,NULL,1,2,NULL,NULL,'?',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,2,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(6,3,NULL,1,NULL,1,2,NULL,NULL,'היי, אפשר שתשלחו לי קישור לתוסף סרגל נציג?',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,3,NULL,3,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(7,1,NULL,1,NULL,1,2,NULL,NULL,'היי, אפשר שתשלחו לי קישור לתוסף סרגל נציג?',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(8,1,NULL,1,NULL,1,2,NULL,NULL,'מענה',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(9,3,NULL,1,NULL,1,2,NULL,NULL,'...',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,3,NULL,3,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(10,1,NULL,1,NULL,1,2,NULL,NULL,'77',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(11,1,NULL,1,NULL,1,2,NULL,NULL,'שלום',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(12,1,NULL,1,NULL,1,2,NULL,NULL,'שחום רווח ביי',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(13,1,NULL,1,NULL,1,2,NULL,NULL,'בדיקה סמס',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(14,3,NULL,1,NULL,1,2,NULL,NULL,'אא',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,3,NULL,3,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(15,1,NULL,1,NULL,1,2,NULL,NULL,'הככ',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(16,1,NULL,1,NULL,1,2,NULL,NULL,'מענה ויקי',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(17,4,NULL,1,NULL,1,2,NULL,NULL,'מה המתנה שלך לחיילי צה\\\'ל? ❤️<br />\n1. מודה אני<br />\n2. נר שבת<br />\n3. תפילין<br />\n4 קצת שבת',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,4,NULL,4,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(18,1,NULL,1,NULL,1,2,NULL,NULL,'שלום אשמח לחזרה של נציג',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(19,1,NULL,1,NULL,1,2,NULL,NULL,'777777',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(20,3,NULL,1,NULL,1,2,NULL,NULL,'דוואי',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,3,NULL,3,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(21,2,NULL,1,NULL,1,2,NULL,NULL,'בדיקה',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,2,NULL,2,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(22,1,NULL,1,NULL,1,2,NULL,NULL,'5858474736',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(23,1,NULL,1,NULL,1,2,NULL,NULL,'Testtestt',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(24,1,NULL,1,NULL,1,2,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(25,5,NULL,1,NULL,1,2,NULL,NULL,'http://voi.pe/4d7bf0',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,5,NULL,5,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(26,1,NULL,1,NULL,1,2,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(27,1,NULL,1,NULL,1,2,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(28,1,NULL,1,NULL,1,2,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(29,1,NULL,1,NULL,1,2,NULL,NULL,'44',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(30,1,NULL,1,NULL,1,2,NULL,NULL,'44',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:06','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(31,1,NULL,1,NULL,1,2,NULL,NULL,'מממ',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:06','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(32,1,NULL,1,NULL,1,2,NULL,NULL,'מממ',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(33,1,NULL,1,NULL,1,2,NULL,NULL,'ש',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(34,1,NULL,1,NULL,1,2,NULL,NULL,'ש',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(35,1,NULL,1,NULL,1,2,NULL,NULL,'פפפ',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(36,1,NULL,1,NULL,1,2,NULL,NULL,'פפפ',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(37,1,NULL,1,NULL,1,2,NULL,NULL,'135',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(38,1,NULL,1,NULL,1,2,NULL,NULL,'135',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(39,1,NULL,1,NULL,1,2,NULL,NULL,'09775',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(40,1,NULL,1,NULL,1,2,NULL,NULL,'09775',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(41,1,NULL,1,NULL,1,2,NULL,NULL,'Reply',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(42,1,NULL,1,NULL,1,2,NULL,NULL,'Reply',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(43,1,NULL,1,NULL,1,2,NULL,NULL,'שלללום',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(44,1,NULL,1,NULL,1,2,NULL,NULL,'שלום',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(45,1,NULL,1,NULL,1,2,NULL,NULL,'בדיקה',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(46,1,NULL,1,NULL,1,2,NULL,NULL,'היי',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(47,6,NULL,1,NULL,1,2,NULL,NULL,'מה המתנה שלך לאלוקים?',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,6,NULL,6,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(48,6,NULL,1,NULL,1,2,NULL,NULL,'מה המתנה שלך לאלוקים?',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,6,NULL,6,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(49,1,NULL,1,NULL,1,2,NULL,NULL,'בדיקה ויקי',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:07','2024-10-28 10:52:07','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(50,1,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,1,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:21','2024-10-28 10:52:21',NULL,0,NULL,NULL,NULL),(51,2,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,2,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:21','2024-10-28 10:52:21',NULL,0,NULL,NULL,NULL),(52,3,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,3,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:21','2024-10-28 10:52:21',NULL,0,NULL,NULL,NULL),(53,4,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,4,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:21','2024-10-28 10:52:21',NULL,0,NULL,NULL,NULL),(54,5,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,5,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:21','2024-10-28 10:52:21',NULL,0,NULL,NULL,NULL),(55,6,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,6,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:52:21','2024-10-28 10:52:21',NULL,0,NULL,NULL,NULL),(56,7,NULL,1,NULL,1,2,NULL,NULL,'Hi test',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 10:53:05','2024-10-28 10:53:05','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(57,7,2,2,NULL,2,2,NULL,NULL,'TESTING',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,1,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 10:55:24','2024-10-28 10:55:41','{\"channel\":\"voipesms\"}',0,NULL,NULL,NULL),(58,8,NULL,1,NULL,1,2,NULL,NULL,'/start',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,7,NULL,7,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-28 11:47:59','2024-10-28 11:47:59',NULL,0,NULL,NULL,NULL),(59,8,NULL,1,NULL,1,2,NULL,NULL,'test',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,7,NULL,7,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 11:48:04','2024-10-28 11:48:04',NULL,0,NULL,NULL,NULL),(60,8,2,2,NULL,2,2,NULL,NULL,'<div>reply</div>',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,7,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-28 11:52:10','2024-10-28 11:52:10',NULL,0,NULL,NULL,NULL),(66,11,NULL,1,NULL,1,2,NULL,NULL,'Test',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-29 08:04:41','2024-10-29 08:04:41','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(67,11,2,2,NULL,2,2,NULL,NULL,'<div>test2</div>',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,1,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-29 08:04:58','2024-10-29 08:07:29','{\"wid\":\"wamid.HBgMOTcyNTAyNzYwMjA2FQIAERgSNDJCRTVGRDI0QjJENEE4NTM5AA==\",\"channel\":\"whatsapp\",\"wstatus\":\"read\"}',0,NULL,NULL,NULL),(77,11,2,1,NULL,1,2,NULL,NULL,'Hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-29 12:36:39','2024-10-29 12:36:39','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(78,11,2,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,1,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-29 12:37:21','2024-10-29 12:37:21',NULL,0,NULL,NULL,NULL),(79,12,NULL,1,NULL,1,2,NULL,NULL,'Hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-29 12:37:35','2024-10-29 12:37:35','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(80,12,NULL,4,NULL,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,1,2,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-29 12:38:08','2024-10-29 12:38:08',NULL,0,NULL,NULL,NULL),(124,14,NULL,1,NULL,1,2,NULL,NULL,'Hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,1,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-30 07:29:07','2024-10-30 07:29:07','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(128,15,NULL,1,NULL,1,2,NULL,NULL,'Hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,8,NULL,8,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-30 10:26:47','2024-10-30 10:26:47',NULL,0,NULL,NULL,NULL),(129,15,4,4,NULL,6,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,8,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-30 10:30:02','2024-10-30 10:30:02',NULL,0,NULL,NULL,NULL),(130,15,4,2,NULL,2,2,NULL,NULL,'<div>Hi, How can I help you?</div>',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,8,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-30 10:30:19','2024-10-30 10:30:19',NULL,0,NULL,NULL,NULL),(131,16,NULL,1,NULL,1,2,NULL,NULL,'Hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,10,NULL,10,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-10-30 14:17:30','2024-10-30 14:17:30','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(132,16,NULL,1,NULL,1,2,NULL,NULL,'It&#039;s me... Nir',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,10,NULL,10,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-10-30 14:17:45','2024-10-30 14:17:45','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(150,15,4,2,NULL,2,2,NULL,NULL,'<div>Hello</div>',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,8,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-02 23:56:32','2024-11-02 23:56:32',NULL,0,NULL,NULL,NULL),(168,16,NULL,1,NULL,1,2,NULL,NULL,'שלום',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,10,NULL,10,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 06:41:46','2024-11-03 06:41:46','{\"channel\":\"whatsapp\"}',0,NULL,NULL,NULL),(181,17,NULL,1,NULL,1,2,NULL,NULL,'good morning, mister',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-11-03 08:45:43','2024-11-03 08:45:43',NULL,0,NULL,NULL,NULL),(182,17,NULL,1,NULL,1,2,NULL,NULL,'hello world',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 08:45:43','2024-11-03 08:45:43',NULL,0,NULL,NULL,NULL),(183,18,NULL,1,NULL,1,2,NULL,NULL,'hello bot',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-11-03 08:46:49','2024-11-03 08:46:49',NULL,0,NULL,NULL,NULL),(184,18,NULL,1,NULL,1,2,NULL,NULL,'hello world',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 08:46:49','2024-11-03 08:46:49',NULL,0,NULL,NULL,NULL),(185,18,NULL,1,NULL,1,2,NULL,NULL,'this is secret',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 08:48:46','2024-11-03 08:48:46',NULL,0,NULL,NULL,NULL),(186,19,NULL,1,NULL,1,2,NULL,NULL,'hello world',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2024-11-03 08:48:46','2024-11-03 08:48:46',NULL,0,NULL,NULL,NULL),(187,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:06:28','2024-11-03 09:06:28',NULL,0,NULL,NULL,NULL),(188,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:06:29','2024-11-03 09:06:29',NULL,0,NULL,NULL,NULL),(189,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:06:32','2024-11-03 09:06:32',NULL,0,NULL,NULL,NULL),(190,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:06:37','2024-11-03 09:06:37',NULL,0,NULL,NULL,NULL),(191,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:06:45','2024-11-03 09:06:45',NULL,0,NULL,NULL,NULL),(192,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:07:02','2024-11-03 09:07:02',NULL,0,NULL,NULL,NULL),(193,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:07:35','2024-11-03 09:07:35',NULL,0,NULL,NULL,NULL),(194,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:08:40','2024-11-03 09:08:40',NULL,0,NULL,NULL,NULL),(195,19,NULL,1,NULL,1,2,NULL,NULL,'hi',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 09:10:36','2024-11-03 09:10:36',NULL,0,NULL,NULL,NULL),(196,17,NULL,4,NULL,6,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:37:35','2024-11-03 12:37:35',NULL,0,NULL,NULL,NULL),(197,18,NULL,4,NULL,6,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:37:35','2024-11-03 12:37:35',NULL,0,NULL,NULL,NULL),(198,19,NULL,4,NULL,6,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:37:35','2024-11-03 12:37:35',NULL,0,NULL,NULL,NULL),(200,19,NULL,1,NULL,1,2,NULL,NULL,'/start',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:40:43','2024-11-03 12:40:43',NULL,0,NULL,NULL,NULL),(201,19,NULL,4,NULL,6,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:41:57','2024-11-03 12:41:57',NULL,0,NULL,NULL,NULL),(202,19,NULL,1,NULL,1,2,NULL,NULL,'hello',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:42:23','2024-11-03 12:42:23',NULL,0,NULL,NULL,NULL),(203,19,NULL,1,NULL,1,2,NULL,NULL,'/start',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:46:02','2024-11-03 12:46:02',NULL,0,NULL,NULL,NULL),(204,19,NULL,1,NULL,1,2,NULL,NULL,'I am petro',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:48:15','2024-11-03 12:48:15',NULL,0,NULL,NULL,NULL),(205,19,4,1,NULL,2,2,NULL,NULL,'<div>what are you doing?</div>',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 12:49:01','2024-11-03 12:49:01',NULL,0,NULL,NULL,NULL),(206,19,4,1,NULL,1,2,NULL,NULL,'a',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 13:12:30','2024-11-03 13:12:30',NULL,0,NULL,NULL,NULL),(207,19,4,1,NULL,1,2,NULL,NULL,'b',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 13:20:59','2024-11-03 13:20:59',NULL,0,NULL,NULL,NULL),(208,19,4,1,NULL,1,2,NULL,NULL,'c',NULL,NULL,NULL,NULL,NULL,0,NULL,1,3,9,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 13:22:15','2024-11-03 13:22:15',NULL,0,NULL,NULL,NULL),(209,19,4,2,NULL,2,2,NULL,NULL,'<div>reply of c</div>',NULL,NULL,NULL,NULL,NULL,0,NULL,2,2,9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2024-11-03 13:35:01','2024-11-03 13:35:01',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timelogs`
--

DROP TABLE IF EXISTS `timelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timelogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `user_id` int NOT NULL,
  `conversation_status` tinyint unsigned NOT NULL DEFAULT '1',
  `time_spent` int NOT NULL DEFAULT '0',
  `paused` tinyint(1) NOT NULL DEFAULT '0',
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timelogs_conversation_id_finished_user_id_index` (`conversation_id`,`finished`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timelogs`
--

LOCK TABLES `timelogs` WRITE;
/*!40000 ALTER TABLE `timelogs` DISABLE KEYS */;
INSERT INTO `timelogs` VALUES (1,7,2,2,0,0,0,'2024-10-28 10:55:24','2024-10-28 10:55:24'),(2,8,2,2,0,0,0,'2024-10-28 11:52:10','2024-10-28 11:52:10'),(3,11,2,2,16340,0,1,'2024-10-29 08:04:58','2024-10-29 12:37:20'),(4,10,4,2,54823,0,1,'2024-10-29 10:57:04','2024-10-30 02:10:47'),(5,13,2,2,26,0,1,'2024-10-29 12:40:30','2024-10-29 12:40:59'),(6,10,4,2,0,0,0,'2024-10-30 02:16:25','2024-10-30 02:16:25'),(7,15,4,2,0,0,0,'2024-10-30 10:30:19','2024-10-30 10:30:19'),(8,19,4,2,0,0,0,'2024-11-03 12:49:01','2024-11-03 12:49:01');
/*!40000 ALTER TABLE `timelogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor_authentications`
--

DROP TABLE IF EXISTS `two_factor_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `two_factor_authentications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `shared_secret` blob NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `two_factor_authentications_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor_authentications`
--

LOCK TABLES `two_factor_authentications` WRITE;
/*!40000 ALTER TABLE `two_factor_authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_fields`
--

DROP TABLE IF EXISTS `user_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `options` text COLLATE utf8mb4_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_fields_sort_order_index` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_fields`
--

LOCK TABLES `user_fields` WRITE;
/*!40000 ALTER TABLE `user_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_field`
--

DROP TABLE IF EXISTS `user_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_field` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `user_field_id` int unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_field_user_id_user_field_id_unique` (`user_id`,`user_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_field`
--

LOCK TABLES `user_user_field` WRITE;
/*!40000 ALTER TABLE `user_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `invite_state` tinyint unsigned NOT NULL DEFAULT '3',
  `invite_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emails` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` tinyint unsigned NOT NULL DEFAULT '2',
  `enable_kb_shortcuts` tinyint(1) NOT NULL DEFAULT '1',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `open_on_this_page` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_index` (`role`),
  KEY `users_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nir','Kugman','nir@voipe.co.il','$2y$10$YLxNVz8k5yVnng8Bi7KneuPPngfMCCLrxQGj8YW.WaLINnMqKsrza',2,'UTC',NULL,1,1,1,'',NULL,NULL,NULL,2,1,0,'E4W68xk53xXkYT8qDx5JUYQWHwoei4cltHHX6hyzW2jhL08kekuZkDseqknu',NULL,'2024-10-28 08:08:28','2024-10-28 08:08:35',NULL,0,1),(2,'viki','.','viki@voipe.co.il','$2y$10$EJumxXvMB8hRc1qRmDG6c.Z/ZDHI3J68Dy9ryYW1ld/8Kqfg8wpiu',2,'UTC',NULL,1,1,1,'',NULL,'',NULL,2,1,0,'dsQP9N0u2foNIi91mJ4UEWY4uqj2AovzoVvWQGtiHl8BlOCHyqiE936rui87','en','2024-10-28 09:03:28','2024-10-29 11:48:54',NULL,1,1),(3,'Workflow','','fsworkflow@example.org','$2y$10$Uh6aGmSdc7RG/gFOzaS.0O1P7PaK4zGUDNQLlNTWB0h2Qf0EmyJuC',1,'UTC',NULL,2,3,3,NULL,NULL,NULL,NULL,2,1,0,NULL,NULL,'2024-10-28 10:52:05','2024-10-28 10:52:05',NULL,0,1),(4,'petro','bakumenko','petrobakumenko22@gmail.com','$2y$10$8PiL520dgpREgl71EzJcROWeftPAahnI1G1t/Zh53KK3/1NyrKu8a',2,'Europe/Berlin',NULL,1,1,1,'',NULL,'',NULL,2,1,0,'qKoAPSTYfqxU9MInLxNrqhiAvgapPT6wC1KE74Ej1o6VkCoWPVYh4Gh8XHaX',NULL,'2024-10-28 12:00:18','2024-10-28 12:03:33',NULL,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voipe_calls`
--

DROP TABLE IF EXISTS `voipe_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voipe_calls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `callerid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` int DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voipe_calls`
--

LOCK TABLES `voipe_calls` WRITE;
/*!40000 ALTER TABLE `voipe_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `voipe_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallboards`
--

DROP TABLE IF EXISTS `wallboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widgets` text COLLATE utf8mb4_unicode_ci,
  `visibility` int NOT NULL,
  `created_by_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallboards`
--

LOCK TABLES `wallboards` WRITE;
/*!40000 ALTER TABLE `wallboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_logs`
--

DROP TABLE IF EXISTS `webhook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int NOT NULL,
  `status_code` int NOT NULL,
  `error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `attempts` tinyint unsigned NOT NULL DEFAULT '1',
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhook_logs_webhook_id_index` (`webhook_id`),
  KEY `webhook_logs_finished_index` (`finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_logs`
--

LOCK TABLES `webhook_logs` WRITE;
/*!40000 ALTER TABLE `webhook_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events` text COLLATE utf8mb4_unicode_ci,
  `last_run_time` timestamp NULL DEFAULT NULL,
  `last_run_error` text COLLATE utf8mb4_unicode_ci,
  `mailboxes` text COLLATE utf8mb4_unicode_ci,
  `headers` tinyint(1) NOT NULL DEFAULT '0',
  `headers_text` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whatsapp_templates`
--

DROP TABLE IF EXISTS `whatsapp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whatsapp_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `wid` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `components` varchar(6000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `whatsapp_templates_wid_index` (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatsapp_templates`
--

LOCK TABLES `whatsapp_templates` WRITE;
/*!40000 ALTER TABLE `whatsapp_templates` DISABLE KEYS */;
INSERT INTO `whatsapp_templates` VALUES (1,'0AZZJxNAkhMVQgU2ytShWT','start_template_2_1q3icq3ll','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"example\":{\"body_text\":[[\"\\u05e7\\u05e8\\u05d9\\u05d0\\u05d4 \\u05d6\\u05d0\\u05ea \\u05e0\\u05e1\\u05d2\\u05e8\\u05ea\\u00a0\",\"\\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 \\u05d1\\u05db\\u05dc \\u05e2\\u05ea, \\u05d5\\u05e7\\u05e8\\u05d9\\u05d0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05ea\\u05d9\\u05e4\\u05ea\\u05d7.\"]]},\"text\":\"\\u25ab {{1}}\\n{{2}} \\u2039 \\u2039\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"\\u05e7\\u05e8\\u05d9\\u05d0\\u05d4 \\u05d6\\u05d0\\u05ea \\u05e0\\u05e1\\u05d2\\u05e8\\u05ea\\u00a0\",\"\\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 \\u05d1\\u05db\\u05dc \\u05e2\\u05ea, \\u05d5\\u05e7\\u05e8\\u05d9\\u05d0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05ea\\u05d9\\u05e4\\u05ea\\u05d7.\"]]},\"text\":\"\\u25ab {{1}}\\n{{2}} \\u2039 \\u2039\",\"type\":\"BODY\"}],\"created_at\":\"2024-10-30T12:32:51Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"2303412740051233\",\"id\":\"0AZZJxNAkhMVQgU2ytShWT\",\"language\":\"en_US\",\"modified_at\":\"2024-10-30T12:33:08Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"start_template_2_1q3icq3ll\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":null,\"rejected_reason\":\"INVALID_FORMAT\",\"status\":\"rejected\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(2,'1EQwJTQjSqkpJbj0CGOmWT','sample_happy_hour_announcement','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','id','[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"Jam diskon telah tiba! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nBergembiralah dan nikmati hari Anda. \\ud83c\\udf89\\nTempat: {{1}}\\nWaktu: {{2}}\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"Jam diskon telah tiba! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nBergembiralah dan nikmati hari Anda. \\ud83c\\udf89\\nTempat: {{1}}\\nWaktu: {{2}}\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:22Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"1890687014413474\",\"id\":\"1EQwJTQjSqkpJbj0CGOmWT\",\"language\":\"id\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_happy_hour_announcement\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(3,'1hjgb0sCuY2AVS8nKwRKWT','details_part3','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4  \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4  \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:17:44Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"7949485438431283\",\"id\":\"1hjgb0sCuY2AVS8nKwRKWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"details_part3\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(4,'2N3fXRVEWP63Z2fWZnHhWT','terrific_welcome_2','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05dc\\u05e4\\u05e0\\u05d9 \\u05e9\\u05e0\\u05ea\\u05d0\\u05dd \\u05e9\\u05d9\\u05d7\\u05d4, \\u05d0\\u05e9\\u05de\\u05d7 \\u05dc\\u05d5\\u05d5\\u05d3\\u05d0 \\u05e7\\u05d5\\u05d3\\u05dd \\u05de\\u05e1\\u05e4\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd:\\n\\u05d4\\u05d0\\u05dd \\u05de\\u05d3\\u05d5\\u05d1\\u05e8 \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9, \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3 \\u05d0\\u05d5 \\u05d4\\u05e2\\u05dc\\u05d0\\u05ea \\u05de\\u05d9\\u05e0\\u05d5\\u05df \\u05e9\\u05dc \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05e7\\u05d9\\u05d9\\u05dd?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05dc\\u05e4\\u05e0\\u05d9 \\u05e9\\u05e0\\u05ea\\u05d0\\u05dd \\u05e9\\u05d9\\u05d7\\u05d4, \\u05d0\\u05e9\\u05de\\u05d7 \\u05dc\\u05d5\\u05d5\\u05d3\\u05d0 \\u05e7\\u05d5\\u05d3\\u05dd \\u05de\\u05e1\\u05e4\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd:\\n\\u05d4\\u05d0\\u05dd \\u05de\\u05d3\\u05d5\\u05d1\\u05e8 \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9, \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3 \\u05d0\\u05d5 \\u05d4\\u05e2\\u05dc\\u05d0\\u05ea \\u05de\\u05d9\\u05e0\\u05d5\\u05df \\u05e9\\u05dc \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05e7\\u05d9\\u05d9\\u05dd?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:28:23Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"368171132987857\",\"id\":\"2N3fXRVEWP63Z2fWZnHhWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"terrific_welcome_2\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(5,'32HRRwLuSRbrGVBwuxwLWT','sample_shipping_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','es','[{\"text\":\"\\u00f3 tu paquete. La entrega se realizar\\u00e1 en {{1}} d\\u00ed.\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"text\":\"\\u00f3 tu paquete. La entrega se realizar\\u00e1 en {{1}} d\\u00ed.\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:25Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"299702608545341\",\"id\":\"32HRRwLuSRbrGVBwuxwLWT\",\"language\":\"es\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_shipping_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(6,'3Epq44FtEeNkmseUJNRtWT','new_template9','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/414476199_1622659638556766_6182630435453252556_n.pdf?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=g0hiMZvX0q4Q7kNvgF7faXE&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIObFeg3AqwpHgvbFYNrEqM0tHBDn7U-mR5L-a60wR7OJ&oe=670B8E09\"]},\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/414476199_1622659638556766_6182630435453252556_n.pdf?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=g0hiMZvX0q4Q7kNvgF7faXE&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIObFeg3AqwpHgvbFYNrEqM0tHBDn7U-mR5L-a60wR7OJ&oe=670B8E09\"]},\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-05-15T21:36:43Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1622659631890100\",\"id\":\"3Epq44FtEeNkmseUJNRtWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_template9\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(7,'3jK0FvkqI0HxnwiL28fvWT','dosage_message2','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e2\\u05dc \\u05de\\u05e0\\u05ea \\u05e9\\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05ea\\u05ea \\u05dc\\u05da \\u05e2\\u05dc\\u05d5\\u05d9\\u05d5\\u05ea \\u05de\\u05d3\\u05d5\\u05d9\\u05e7\\u05d5\\u05ea \\u05dc\\u05de\\u05e7\\u05e8\\u05d4 \\u05e9\\u05dc\\u05da \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05e9\\u05dc\\u05d5\\u05d7 \\u05dc\\u05d9 \\u05e6\\u05d9\\u05dc\\u05d5\\u05dd \\u05e9\\u05dc \\u05d4\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d5\\u05ea.\\u05d6 \\u05d0\\u05d5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05e2\\u05dc \\u05d4\\u05e9\\u05d0\\u05dc\\u05d5\\u05ea \\u05d4\\u05d1\\u05d0\\u05d5\\u05ea:\\n*1.* \\u05de\\u05d4 \\u05d4\\u05d0\\u05d1\\u05d7\\u05e0\\u05d4 \\u05d4\\u05e8\\u05e4\\u05d5\\u05d0\\u05d9\\u05ea? \\u05db\\u05d0\\u05d1\\u05d9\\u05dd \\u05d0\\u05d5 \\u05e8\\u05e7\\u05e2 \\u05e4\\u05e1\\u05d9\\u05db\\u05d9\\u05d0\\u05d8\\u05e8\\u05d9?\\n*2.* \\u05de\\u05d9 \\u05d4\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e9\\u05d7\\u05ea\\u05d5\\u05dd \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\\n*3.* \\u05de\\u05d4 \\u05d4\\u05db\\u05de\\u05d5\\u05ea \\u05e9\\u05d9\\u05e9 \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e2\\u05dc \\u05de\\u05e0\\u05ea \\u05e9\\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05ea\\u05ea \\u05dc\\u05da \\u05e2\\u05dc\\u05d5\\u05d9\\u05d5\\u05ea \\u05de\\u05d3\\u05d5\\u05d9\\u05e7\\u05d5\\u05ea \\u05dc\\u05de\\u05e7\\u05e8\\u05d4 \\u05e9\\u05dc\\u05da \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05e9\\u05dc\\u05d5\\u05d7 \\u05dc\\u05d9 \\u05e6\\u05d9\\u05dc\\u05d5\\u05dd \\u05e9\\u05dc \\u05d4\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d5\\u05ea.\\u05d6 \\u05d0\\u05d5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05e2\\u05dc \\u05d4\\u05e9\\u05d0\\u05dc\\u05d5\\u05ea \\u05d4\\u05d1\\u05d0\\u05d5\\u05ea:\\n*1.* \\u05de\\u05d4 \\u05d4\\u05d0\\u05d1\\u05d7\\u05e0\\u05d4 \\u05d4\\u05e8\\u05e4\\u05d5\\u05d0\\u05d9\\u05ea? \\u05db\\u05d0\\u05d1\\u05d9\\u05dd \\u05d0\\u05d5 \\u05e8\\u05e7\\u05e2 \\u05e4\\u05e1\\u05d9\\u05db\\u05d9\\u05d0\\u05d8\\u05e8\\u05d9?\\n*2.* \\u05de\\u05d9 \\u05d4\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e9\\u05d7\\u05ea\\u05d5\\u05dd \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\\n*3.* \\u05de\\u05d4 \\u05d4\\u05db\\u05de\\u05d5\\u05ea \\u05e9\\u05d9\\u05e9 \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:43:31Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1312985896724520\",\"id\":\"3jK0FvkqI0HxnwiL28fvWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"dosage_message2\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(8,'4O6G8LfAg8yVWlwmbACTWT','no_answer','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d4\\u05d9\\u05d9 \\u05d6\\u05d0\\u05ea \\u05e2\\u05d3\\u05d9 \\u05de\\u05d4 \\u05e7\\u05d5\\u05e8\\u05d4? \\ud83c\\udf38\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d4\\u05d9\\u05d9 \\u05d6\\u05d0\\u05ea \\u05e2\\u05d3\\u05d9 \\u05de\\u05d4 \\u05e7\\u05d5\\u05e8\\u05d4? \\ud83c\\udf38\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T12:48:09Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"7855908231166263\",\"id\":\"4O6G8LfAg8yVWlwmbACTWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"no_answer\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(9,'5ewsUsweEiUnrB9NnRpdWT','talk_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d0\\u05dc\\u05d5 \\u05d4\\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d1\\u05d2\\u05d3\\u05d5\\u05dc, \\u05e9\\u05e0\\u05ea\\u05d0\\u05dd \\u05e9\\u05d9\\u05d7\\u05d4?\\n\\u05d1\\u05de\\u05d4\\u05dc\\u05da \\u05d4\\u05e9\\u05d9\\u05d7\\u05d4 \\u05d0\\u05e6\\u05d8\\u05e8\\u05da \\u05dc\\u05d4\\u05d9\\u05db\\u05e0\\u05e1 \\u05dc\\u05d7\\u05e9\\u05d1\\u05d5\\u05df \\u05e9\\u05dc\\u05db\\u05dd \\u05d1\\u05d0\\u05ea\\u05e8 \\u05e7\\u05d5\\u05e4\\u05ea \\u05d4\\u05d7\\u05d5\\u05dc\\u05d9\\u05dd \\u05db\\u05d3\\u05d9 \\u05dc\\u05d4\\u05d5\\u05e6\\u05d9\\u05d0 \\u05d0\\u05ea \\u05db\\u05dc \\u05d4\\u05de\\u05e1\\u05de\\u05db\\u05d9\\u05dd \\u05d4\\u05e0\\u05d3\\u05e8\\u05e9\\u05d9\\u05dd. \\n\\u05dc\\u05d0\\u05d7\\u05e8 \\u05e9\\u05d0\\u05e1\\u05d3\\u05e8 \\u05d0\\u05ea \\u05d4\\u05ea\\u05d9\\u05e7, \\u05d0\\u05e9\\u05dc\\u05d7 \\u05d0\\u05d5\\u05ea\\u05d5 \\u05dc\\u05de\\u05e8\\u05e4\\u05d0\\u05d4 \\u05dc\\u05e7\\u05d1\\u05dc\\u05ea \\u05ea\\u05e9\\u05d5\\u05d1\\u05d4 \\u05e1\\u05d5\\u05e4\\u05d9\\u05ea, \\u05db\\u05d5\\u05dc\\u05dc \\u05d4\\u05de\\u05d7\\u05d9\\u05e8.\\n\\u05d1\\u05de\\u05d9\\u05d3\\u05d4 \\u05d5\\u05d6\\u05d4 \\u05e0\\u05e9\\u05de\\u05e2 \\u05de\\u05ea\\u05d0\\u05d9\\u05dd, \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05e9\\u05dc\\u05d5\\u05d7 \\u05dc\\u05d9 \\u05db\\u05d0\\u05df \\u05de\\u05ea\\u05d9 \\u05e0\\u05d5\\u05d7 \\u05dc\\u05db\\u05dd \\u05dc\\u05e9\\u05d5\\u05d7\\u05d7, \\u05d5\\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05ea\\u05e7\\u05e9\\u05e8 \\u05d1\\u05de\\u05d5\\u05e2\\u05d3 \\u05e9\\u05e6\\u05d9\\u05d9\\u05e0\\u05ea.\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d0\\u05dc\\u05d5 \\u05d4\\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d1\\u05d2\\u05d3\\u05d5\\u05dc, \\u05e9\\u05e0\\u05ea\\u05d0\\u05dd \\u05e9\\u05d9\\u05d7\\u05d4?\\n\\u05d1\\u05de\\u05d4\\u05dc\\u05da \\u05d4\\u05e9\\u05d9\\u05d7\\u05d4 \\u05d0\\u05e6\\u05d8\\u05e8\\u05da \\u05dc\\u05d4\\u05d9\\u05db\\u05e0\\u05e1 \\u05dc\\u05d7\\u05e9\\u05d1\\u05d5\\u05df \\u05e9\\u05dc\\u05db\\u05dd \\u05d1\\u05d0\\u05ea\\u05e8 \\u05e7\\u05d5\\u05e4\\u05ea \\u05d4\\u05d7\\u05d5\\u05dc\\u05d9\\u05dd \\u05db\\u05d3\\u05d9 \\u05dc\\u05d4\\u05d5\\u05e6\\u05d9\\u05d0 \\u05d0\\u05ea \\u05db\\u05dc \\u05d4\\u05de\\u05e1\\u05de\\u05db\\u05d9\\u05dd \\u05d4\\u05e0\\u05d3\\u05e8\\u05e9\\u05d9\\u05dd. \\n\\u05dc\\u05d0\\u05d7\\u05e8 \\u05e9\\u05d0\\u05e1\\u05d3\\u05e8 \\u05d0\\u05ea \\u05d4\\u05ea\\u05d9\\u05e7, \\u05d0\\u05e9\\u05dc\\u05d7 \\u05d0\\u05d5\\u05ea\\u05d5 \\u05dc\\u05de\\u05e8\\u05e4\\u05d0\\u05d4 \\u05dc\\u05e7\\u05d1\\u05dc\\u05ea \\u05ea\\u05e9\\u05d5\\u05d1\\u05d4 \\u05e1\\u05d5\\u05e4\\u05d9\\u05ea, \\u05db\\u05d5\\u05dc\\u05dc \\u05d4\\u05de\\u05d7\\u05d9\\u05e8.\\n\\u05d1\\u05de\\u05d9\\u05d3\\u05d4 \\u05d5\\u05d6\\u05d4 \\u05e0\\u05e9\\u05de\\u05e2 \\u05de\\u05ea\\u05d0\\u05d9\\u05dd, \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05e9\\u05dc\\u05d5\\u05d7 \\u05dc\\u05d9 \\u05db\\u05d0\\u05df \\u05de\\u05ea\\u05d9 \\u05e0\\u05d5\\u05d7 \\u05dc\\u05db\\u05dd \\u05dc\\u05e9\\u05d5\\u05d7\\u05d7, \\u05d5\\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05ea\\u05e7\\u05e9\\u05e8 \\u05d1\\u05de\\u05d5\\u05e2\\u05d3 \\u05e9\\u05e6\\u05d9\\u05d9\\u05e0\\u05ea.\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:56:51Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"988159436437495\",\"id\":\"5ewsUsweEiUnrB9NnRpdWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"talk_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(10,'67uEt77wimNujTj6fUNaWT','welcome_yavne0','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T06:30:15Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1134204604323865\",\"id\":\"67uEt77wimNujTj6fUNaWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_yavne0\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(11,'7RfVTDuy61A7ATP4n44zWT','sample_flight_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','id','[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"Ini merupakan konfirmasi penerbangan Anda untuk {{1}}-{{2}} di {{3}}.\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"Ini merupakan konfirmasi penerbangan Anda untuk {{1}}-{{2}} di {{3}}.\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:30Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"1412472425787341\",\"id\":\"7RfVTDuy61A7ATP4n44zWT\",\"language\":\"id\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_flight_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(12,'9swlh8nCiqmvIR4EthgtWT','license_prices_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n\\u05d9\\u05e9\\u05e0\\u05dd \\u05de\\u05d2\\u05d5\\u05d5\\u05df \\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d5\\u05ea \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05db\\u05d5\\u05dc\\u05d5\\u05ea \\u05dc\\u05d4\\u05e6\\u05d3\\u05d9\\u05e7 \\u05e9\\u05d9\\u05de\\u05d5\\u05e9 \\u05d1\\u05e7\\u05e0\\u05d0\\u05d1\\u05d9\\u05e1 \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9, \\u05d5\\u05dc\\u05db\\u05df \\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05dc\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9 \\u05de\\u05e9\\u05ea\\u05e0\\u05d9\\u05dd \\u05d1\\u05d4\\u05ea\\u05d0\\u05dd \\u05dc\\u05d4\\u05e8\\u05db\\u05d1 \\u05d4\\u05ea\\u05d9\\u05e7 \\u05d5\\u05d4\\u05e8\\u05d5\\u05e4\\u05d0 \\u05d4\\u05de\\u05d8\\u05e4\\u05dc:\\n\\n*\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9:* \\u05d4\\u05d7\\u05dc \\u05de-1900 \\u05e9\\\"\\u05d7.\\n*\\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05d5\\u05de\\u05d7\\u05d4 (\\u05d1\\u05de\\u05d9\\u05d3\\u05ea \\u05d4\\u05e6\\u05d5\\u05e8\\u05da):* \\u05ea\\u05d5\\u05e1\\u05e4\\u05ea \\u05e9\\u05dc 400-800 \\u05e9\\\"\\u05d7, \\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05de\\u05dc\\u05e6\\u05d4.\\n*\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d5\\u05ea \\u05e0\\u05d2\\u05d3 \\u05dc\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc (\\u05db\\u05d2\\u05d5\\u05df \\u05d4\\u05e4\\u05e8\\u05e2\\u05d5\\u05ea \\u05e4\\u05e1\\u05d9\\u05db\\u05d9\\u05d0\\u05d8\\u05e8\\u05d9\\u05d5\\u05ea):* \\u05ea\\u05d5\\u05e1\\u05e4\\u05ea \\u05e9\\u05dc 200-400 \\u05e9\\\"\\u05d7 \\u05dc\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4.\\n\\n\\ud83d\\udc9a \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9 \\u05db\\u05d5\\u05dc\\u05dc 6 \\u05de\\u05e8\\u05e9\\u05de\\u05d9\\u05dd \\u05e9\\u05dc 20 \\u05d2\\u05e8\\u05dd T10\\/C10. \\u05dc\\u05d0\\u05d7\\u05e8 3 \\u05d7\\u05d5\\u05d3\\u05e9\\u05d9\\u05dd \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05d1\\u05e7\\u05e9 \\u05dc\\u05d4\\u05d2\\u05d3\\u05d9\\u05dc \\u05d0\\u05ea \\u05d4\\u05de\\u05d9\\u05e0\\u05d5\\u05df.\\n\\n\\u23ea \\u05de\\u05e8\\u05d2\\u05e2 \\u05e9\\u05dc\\u05d9\\u05d7\\u05ea \\u05d4\\u05ea\\u05d9\\u05e7, \\u05d4\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05e6\\u05e4\\u05d5\\u05d9 \\u05dc\\u05d4\\u05d2\\u05d9\\u05e2 \\u05ea\\u05d5\\u05da 2-3 \\u05d9\\u05de\\u05d9\\u05dd, \\u05d5\\u05d1\\u05de\\u05e7\\u05e1\\u05d9\\u05de\\u05d5\\u05dd 10 \\u05d9\\u05de\\u05d9 \\u05e2\\u05e1\\u05e7\\u05d9\\u05dd.\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n\\u05d9\\u05e9\\u05e0\\u05dd \\u05de\\u05d2\\u05d5\\u05d5\\u05df \\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d5\\u05ea \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05db\\u05d5\\u05dc\\u05d5\\u05ea \\u05dc\\u05d4\\u05e6\\u05d3\\u05d9\\u05e7 \\u05e9\\u05d9\\u05de\\u05d5\\u05e9 \\u05d1\\u05e7\\u05e0\\u05d0\\u05d1\\u05d9\\u05e1 \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9, \\u05d5\\u05dc\\u05db\\u05df \\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05dc\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9 \\u05de\\u05e9\\u05ea\\u05e0\\u05d9\\u05dd \\u05d1\\u05d4\\u05ea\\u05d0\\u05dd \\u05dc\\u05d4\\u05e8\\u05db\\u05d1 \\u05d4\\u05ea\\u05d9\\u05e7 \\u05d5\\u05d4\\u05e8\\u05d5\\u05e4\\u05d0 \\u05d4\\u05de\\u05d8\\u05e4\\u05dc:\\n\\n*\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9:* \\u05d4\\u05d7\\u05dc \\u05de-1900 \\u05e9\\\"\\u05d7.\\n*\\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05d5\\u05de\\u05d7\\u05d4 (\\u05d1\\u05de\\u05d9\\u05d3\\u05ea \\u05d4\\u05e6\\u05d5\\u05e8\\u05da):* \\u05ea\\u05d5\\u05e1\\u05e4\\u05ea \\u05e9\\u05dc 400-800 \\u05e9\\\"\\u05d7, \\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05de\\u05dc\\u05e6\\u05d4.\\n*\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d5\\u05ea \\u05e0\\u05d2\\u05d3 \\u05dc\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc (\\u05db\\u05d2\\u05d5\\u05df \\u05d4\\u05e4\\u05e8\\u05e2\\u05d5\\u05ea \\u05e4\\u05e1\\u05d9\\u05db\\u05d9\\u05d0\\u05d8\\u05e8\\u05d9\\u05d5\\u05ea):* \\u05ea\\u05d5\\u05e1\\u05e4\\u05ea \\u05e9\\u05dc 200-400 \\u05e9\\\"\\u05d7 \\u05dc\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4.\\n\\n\\ud83d\\udc9a \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d7\\u05d3\\u05e9 \\u05db\\u05d5\\u05dc\\u05dc 6 \\u05de\\u05e8\\u05e9\\u05de\\u05d9\\u05dd \\u05e9\\u05dc 20 \\u05d2\\u05e8\\u05dd T10\\/C10. \\u05dc\\u05d0\\u05d7\\u05e8 3 \\u05d7\\u05d5\\u05d3\\u05e9\\u05d9\\u05dd \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05d1\\u05e7\\u05e9 \\u05dc\\u05d4\\u05d2\\u05d3\\u05d9\\u05dc \\u05d0\\u05ea \\u05d4\\u05de\\u05d9\\u05e0\\u05d5\\u05df.\\n\\n\\u23ea \\u05de\\u05e8\\u05d2\\u05e2 \\u05e9\\u05dc\\u05d9\\u05d7\\u05ea \\u05d4\\u05ea\\u05d9\\u05e7, \\u05d4\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05e6\\u05e4\\u05d5\\u05d9 \\u05dc\\u05d4\\u05d2\\u05d9\\u05e2 \\u05ea\\u05d5\\u05da 2-3 \\u05d9\\u05de\\u05d9\\u05dd, \\u05d5\\u05d1\\u05de\\u05e7\\u05e1\\u05d9\\u05de\\u05d5\\u05dd 10 \\u05d9\\u05de\\u05d9 \\u05e2\\u05e1\\u05e7\\u05d9\\u05dd.\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:35:00Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1152032689353909\",\"id\":\"9swlh8nCiqmvIR4EthgtWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"license_prices_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(13,'ADyvOThhqHR0ZoyeSxpFWT','welcome_mivne','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05de\\u05e2\\u05e8\\u05db\\u05d5\\u05ea \\u05de\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05de\\u05e2\\u05e8\\u05db\\u05d5\\u05ea \\u05de\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:31:57Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"792061109770100\",\"id\":\"ADyvOThhqHR0ZoyeSxpFWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_mivne\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(14,'aT2QUuQjH8LeauK5oP26WT','sample_flight_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','es','[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"Confirmamos tu vuelo a {{1}}-{{2}} para el {{3}}.\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"Confirmamos tu vuelo a {{1}}-{{2}} para el {{3}}.\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:27Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"324754792609185\",\"id\":\"aT2QUuQjH8LeauK5oP26WT\",\"language\":\"es\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_flight_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(15,'BcDHuKdxprSkHKxnKQPJWT','welcome_yavne9','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: 1\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: 2\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: 3\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: 4\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 9\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: 1\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: 2\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: 3\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: 4\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 9\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T07:51:14Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"865915985596106\",\"id\":\"BcDHuKdxprSkHKxnKQPJWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_yavne9\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(16,'bHXsWDjgwJSIL7Offq7oWT','sample_movie_ticket_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Your ticket for *{{1}}*\\n*Time* - {{2}}\\n*Venue* - {{3}}\\n*Seats* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Your ticket for *{{1}}*\\n*Time* - {{2}}\\n*Venue* - {{3}}\\n*Seats* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:31Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"2936424599934579\",\"id\":\"bHXsWDjgwJSIL7Offq7oWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_movie_ticket_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(17,'cfxEMCnO2ivvc9XVft4fWT','template_444','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/421900102_387292374303606_359886707363157301_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=TZ7uMSUeh-QQ7kNvgFJ2he4&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIPY-cUO9K8o_lNRL8TmImH_4sjNrYJji4Qz_nmftOz4X&oe=670BB58A\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"text body\",\"type\":\"BODY\"},{\"text\":\"text footer\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/421900102_387292374303606_359886707363157301_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=TZ7uMSUeh-QQ7kNvgFJ2he4&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIPY-cUO9K8o_lNRL8TmImH_4sjNrYJji4Qz_nmftOz4X&oe=670BB58A\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"text body\",\"type\":\"BODY\"},{\"text\":\"text footer\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-05-14T10:07:46Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"387292370970273\",\"id\":\"cfxEMCnO2ivvc9XVft4fWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"template_444\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(18,'cgcTuVOzTJR8xdw9FK6iWT','sample_flight_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','pt_BR','[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"Esta \\u00e9 a sua confirma\\u00e7\\u00e3o de voo para {{1}}-{{2}} em {{3}}.\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"Esta \\u00e9 a sua confirma\\u00e7\\u00e3o de voo para {{1}}-{{2}} em {{3}}.\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:28Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"2632313897077136\",\"id\":\"cgcTuVOzTJR8xdw9FK6iWT\",\"language\":\"pt_BR\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_flight_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(19,'cgLdqpVES9yQ42Fet6arWT','036411111','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05de\\u05d9\\u05db\\u05d4 \\u05d1036411111\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05de\\u05d9\\u05db\\u05d4 \\u05d1036411111\",\"type\":\"BODY\"}],\"created_at\":\"2023-12-13T06:44:21Z\",\"created_by\":{\"user_id\":\"BihzsUU\",\"user_name\":\"VOIPE\"},\"external_id\":\"329702843255829\",\"id\":\"cgLdqpVES9yQ42Fet6arWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"036411111\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(20,'CvoD5ZfMOQmjXRCX804iWT','new_order','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05dc\\u05d1\\u05d9\\u05e6\\u05d5\\u05e2 \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05dc\\u05d7\\u05e5 \\u05db\\u05d0\\u05df: https:\\/\\/t.ly\\/wa-0P\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05dc\\u05d1\\u05d9\\u05e6\\u05d5\\u05e2 \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05dc\\u05d7\\u05e5 \\u05db\\u05d0\\u05df: https:\\/\\/t.ly\\/wa-0P\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:14:28Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"829969285464033\",\"id\":\"CvoD5ZfMOQmjXRCX804iWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_order\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(21,'cyYLucNaeGyPiyLZlAssWT','terrific_welcome_1','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d4\\u05d9\\u05d9 \\u05d6\\u05d0\\u05ea \\u05e2\\u05d3\\u05d9 \\u05de\\u05d3\\u05e8\\u05da \\u05d4\\u05d8\\u05d1\\u05e2, \\u05ea\\u05d5\\u05d3\\u05d4 \\u05e9\\u05e4\\u05e0\\u05d9\\u05ea \\u05d0\\u05dc\\u05d9\\u05e0\\u05d5! \\ud83d\\ude0a\\ud83d\\udc9a\\n\\u05d1\\u05d7\\u05de\\u05e9 \\u05d4\\u05e9\\u05e0\\u05d9\\u05dd \\u05d4\\u05d0\\u05d7\\u05e8\\u05d5\\u05e0\\u05d5\\u05ea \\u05e2\\u05d6\\u05e8\\u05ea\\u05d9 \\u05dc\\u05de\\u05d0\\u05d5\\u05ea \\u05de\\u05d8\\u05d5\\u05e4\\u05dc\\u05d9\\u05dd \\u05d1\\u05d4\\u05d5\\u05e6\\u05d0\\u05ea \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9 \\u05d7\\u05d3\\u05e9, \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d0\\u05d5 \\u05d4\\u05d2\\u05d3\\u05dc\\u05ea \\u05de\\u05d9\\u05e0\\u05d5\\u05df. \\n\\u05dc\\u05d0\\u05d7\\u05e8\\u05d5\\u05e0\\u05d4 \\u05d9\\u05e6\\u05d0\\u05ea\\u05d9 \\u05dc\\u05d3\\u05e8\\u05da \\u05e2\\u05e6\\u05de\\u05d0\\u05d9\\u05ea \\u05d1\\u05de\\u05d8\\u05e8\\u05d4 \\u05dc\\u05e4\\u05e9\\u05d8 \\u05d5\\u05dc\\u05d4\\u05e0\\u05d2\\u05d9\\u05e9 \\u05d0\\u05ea \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d4\\u05d1\\u05d9\\u05e8\\u05d5\\u05e7\\u05e8\\u05d8\\u05d9 \\u05d1\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d8\\u05d5\\u05d1\\u05d9\\u05dd \\u05db\\u05db\\u05dc \\u05d4\\u05e0\\u05d9\\u05ea\\u05df.\\n\\u05db\\u05d3\\u05d9 \\u05dc\\u05e2\\u05de\\u05d5\\u05d3 \\u05d1\\u05d4\\u05d1\\u05d8\\u05d7\\u05d4 \\u05e9\\u05dc\\u05d9, \\u05d0\\u05e0\\u05d9 \\u05e2\\u05d5\\u05d1\\u05d3\\u05ea \\u05e2\\u05dd \\u05e8\\u05d5\\u05e4\\u05d0\\u05d9\\u05dd \\u05de\\u05d5\\u05de\\u05d7\\u05d9\\u05dd \\u05d1\\u05ea\\u05d7\\u05d5\\u05de\\u05d9\\u05dd \\u05e9\\u05d5\\u05e0\\u05d9\\u05dd, \\u05e9\\u05d7\\u05d5\\u05dc\\u05e7\\u05d9\\u05dd  \\u05d0\\u05d9\\u05ea\\u05d9 \\u05d0\\u05ea \\u05d4\\u05d7\\u05d6\\u05d5\\u05df \\u05dc\\u05d4\\u05e2\\u05e0\\u05d9\\u05e7 \\u05e4\\u05ea\\u05e8\\u05d5\\u05df \\u05d8\\u05d1\\u05e2\\u05d9 \\u05d5\\u05d7\\u05d5\\u05e7\\u05d9. \\u05d0\\u05e0\\u05d9 \\u05e4\\u05d5\\u05e2\\u05dc\\u05ea \\u05d0\\u05da \\u05d5\\u05e8\\u05e7 \\u05e2\\u05dd \\u05e8\\u05d5\\u05e4\\u05d0\\u05d9\\u05dd \\u05e9\\u05d4\\u05d5\\u05e1\\u05de\\u05db\\u05d5 \\u05e2\\u05dc \\u05d9\\u05d3\\u05d9 \\u05d4\\u05d9\\u05e7\\u05f4\\u05e8 \\u05d5\\u05dc\\u05e4\\u05d9 \\u05e0\\u05d4\\u05dc\\u05d9 \\u05de\\u05e9\\u05e8\\u05d3 \\u05d4\\u05d1\\u05e8\\u05d9\\u05d0\\u05d5\\u05ea.\\n\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05dc\\u05d4\\u05e9\\u05d9\\u05d2 \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05ea\\u05d5\\u05da \\u05d9\\u05de\\u05d9\\u05dd \\u05e1\\u05e4\\u05d5\\u05e8\\u05d9\\u05dd \\u05dc\\u05de\\u05d8\\u05d5\\u05e4\\u05dc\\u05d9\\u05dd \\u05e9\\u05e2\\u05d5\\u05e0\\u05d9\\u05dd \\u05e2\\u05dc \\u05d4\\u05e7\\u05e8\\u05d9\\u05d8\\u05e8\\u05d9\\u05d5\\u05e0\\u05d9\\u05dd.\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d4\\u05d9\\u05d9 \\u05d6\\u05d0\\u05ea \\u05e2\\u05d3\\u05d9 \\u05de\\u05d3\\u05e8\\u05da \\u05d4\\u05d8\\u05d1\\u05e2, \\u05ea\\u05d5\\u05d3\\u05d4 \\u05e9\\u05e4\\u05e0\\u05d9\\u05ea \\u05d0\\u05dc\\u05d9\\u05e0\\u05d5! \\ud83d\\ude0a\\ud83d\\udc9a\\n\\u05d1\\u05d7\\u05de\\u05e9 \\u05d4\\u05e9\\u05e0\\u05d9\\u05dd \\u05d4\\u05d0\\u05d7\\u05e8\\u05d5\\u05e0\\u05d5\\u05ea \\u05e2\\u05d6\\u05e8\\u05ea\\u05d9 \\u05dc\\u05de\\u05d0\\u05d5\\u05ea \\u05de\\u05d8\\u05d5\\u05e4\\u05dc\\u05d9\\u05dd \\u05d1\\u05d4\\u05d5\\u05e6\\u05d0\\u05ea \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9 \\u05d7\\u05d3\\u05e9, \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d0\\u05d5 \\u05d4\\u05d2\\u05d3\\u05dc\\u05ea \\u05de\\u05d9\\u05e0\\u05d5\\u05df. \\n\\u05dc\\u05d0\\u05d7\\u05e8\\u05d5\\u05e0\\u05d4 \\u05d9\\u05e6\\u05d0\\u05ea\\u05d9 \\u05dc\\u05d3\\u05e8\\u05da \\u05e2\\u05e6\\u05de\\u05d0\\u05d9\\u05ea \\u05d1\\u05de\\u05d8\\u05e8\\u05d4 \\u05dc\\u05e4\\u05e9\\u05d8 \\u05d5\\u05dc\\u05d4\\u05e0\\u05d2\\u05d9\\u05e9 \\u05d0\\u05ea \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d4\\u05d1\\u05d9\\u05e8\\u05d5\\u05e7\\u05e8\\u05d8\\u05d9 \\u05d1\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d8\\u05d5\\u05d1\\u05d9\\u05dd \\u05db\\u05db\\u05dc \\u05d4\\u05e0\\u05d9\\u05ea\\u05df.\\n\\u05db\\u05d3\\u05d9 \\u05dc\\u05e2\\u05de\\u05d5\\u05d3 \\u05d1\\u05d4\\u05d1\\u05d8\\u05d7\\u05d4 \\u05e9\\u05dc\\u05d9, \\u05d0\\u05e0\\u05d9 \\u05e2\\u05d5\\u05d1\\u05d3\\u05ea \\u05e2\\u05dd \\u05e8\\u05d5\\u05e4\\u05d0\\u05d9\\u05dd \\u05de\\u05d5\\u05de\\u05d7\\u05d9\\u05dd \\u05d1\\u05ea\\u05d7\\u05d5\\u05de\\u05d9\\u05dd \\u05e9\\u05d5\\u05e0\\u05d9\\u05dd, \\u05e9\\u05d7\\u05d5\\u05dc\\u05e7\\u05d9\\u05dd  \\u05d0\\u05d9\\u05ea\\u05d9 \\u05d0\\u05ea \\u05d4\\u05d7\\u05d6\\u05d5\\u05df \\u05dc\\u05d4\\u05e2\\u05e0\\u05d9\\u05e7 \\u05e4\\u05ea\\u05e8\\u05d5\\u05df \\u05d8\\u05d1\\u05e2\\u05d9 \\u05d5\\u05d7\\u05d5\\u05e7\\u05d9. \\u05d0\\u05e0\\u05d9 \\u05e4\\u05d5\\u05e2\\u05dc\\u05ea \\u05d0\\u05da \\u05d5\\u05e8\\u05e7 \\u05e2\\u05dd \\u05e8\\u05d5\\u05e4\\u05d0\\u05d9\\u05dd \\u05e9\\u05d4\\u05d5\\u05e1\\u05de\\u05db\\u05d5 \\u05e2\\u05dc \\u05d9\\u05d3\\u05d9 \\u05d4\\u05d9\\u05e7\\u05f4\\u05e8 \\u05d5\\u05dc\\u05e4\\u05d9 \\u05e0\\u05d4\\u05dc\\u05d9 \\u05de\\u05e9\\u05e8\\u05d3 \\u05d4\\u05d1\\u05e8\\u05d9\\u05d0\\u05d5\\u05ea.\\n\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05dc\\u05d4\\u05e9\\u05d9\\u05d2 \\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05ea\\u05d5\\u05da \\u05d9\\u05de\\u05d9\\u05dd \\u05e1\\u05e4\\u05d5\\u05e8\\u05d9\\u05dd \\u05dc\\u05de\\u05d8\\u05d5\\u05e4\\u05dc\\u05d9\\u05dd \\u05e9\\u05e2\\u05d5\\u05e0\\u05d9\\u05dd \\u05e2\\u05dc \\u05d4\\u05e7\\u05e8\\u05d9\\u05d8\\u05e8\\u05d9\\u05d5\\u05e0\\u05d9\\u05dd.\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:26:03Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1125016898590747\",\"id\":\"cyYLucNaeGyPiyLZlAssWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"terrific_welcome_1\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(22,'DoSEnjOSb1EUBEreSiWkWT','welcome_yavne99','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1: *9*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1: *9*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T07:53:51Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"2863274620491073\",\"id\":\"DoSEnjOSb1EUBEreSiWkWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_yavne99\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(23,'dw5OwfJ5rMjzDqqRVJgLWT','new_license_age','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05de\\u05d4 \\u05d4\\u05d2\\u05d9\\u05dc \\u05e9\\u05dc\\u05da?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05de\\u05d4 \\u05d4\\u05d2\\u05d9\\u05dc \\u05e9\\u05dc\\u05da?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-09T12:52:01Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1015619673426572\",\"id\":\"dw5OwfJ5rMjzDqqRVJgLWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_license_age\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(24,'EwtmWu0KEFConaEmru5iWT','test_template_333','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/418183033_1606992263394309_7512945199536143192_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=Bwy7mP9UCrUQ7kNvgG8zXBU&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaILdkTEKvpTUCC4FKiIG4qq6MC_v5p2CGNMZE1XwW-23o&oe=670BB4B6\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"test body\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/418183033_1606992263394309_7512945199536143192_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=Bwy7mP9UCrUQ7kNvgG8zXBU&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaILdkTEKvpTUCC4FKiIG4qq6MC_v5p2CGNMZE1XwW-23o&oe=670BB4B6\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"test body\",\"type\":\"BODY\"}],\"created_at\":\"2024-04-18T10:22:35Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1606992260060976\",\"id\":\"EwtmWu0KEFConaEmru5iWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"test_template_333\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(25,'F0XKjF2u3i5EqoyBW27bWT','new_template15','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/321242582_471039172268878_7518898076186966117_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=tVuiJUnbUj8Q7kNvgGgh6dN&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaICTIhRyFk1WO9wZBY8tmo6WSt69XG87ZqIXW1gOhepCr&oe=670BA979\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/321242582_471039172268878_7518898076186966117_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=tVuiJUnbUj8Q7kNvgGgh6dN&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaICTIhRyFk1WO9wZBY8tmo6WSt69XG87ZqIXW1gOhepCr&oe=670BA979\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-05-23T10:19:48Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"471039168935545\",\"id\":\"F0XKjF2u3i5EqoyBW27bWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_template15\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"INCORRECT_CATEGORY\",\"status\":\"rejected\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(26,'FgeEnIK1EgbIZ0so2aIMWT','terrific_no_answer','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d4\\u05d9\\u05d9 \\u05d6\\u05d0\\u05ea \\u05e2\\u05d3\\u05d9 \\u05de\\u05d4 \\u05e7\\u05d5\\u05e8\\u05d4? \\ud83c\\udf38\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d4\\u05d9\\u05d9 \\u05d6\\u05d0\\u05ea \\u05e2\\u05d3\\u05d9 \\u05de\\u05d4 \\u05e7\\u05d5\\u05e8\\u05d4? \\ud83c\\udf38\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-11T07:24:17Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1001112104611148\",\"id\":\"FgeEnIK1EgbIZ0so2aIMWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"terrific_no_answer\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(27,'Fnn016ANSlfwjo0f0gxlWT','new_template12','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/417302905_1467401810543500_813866919816281997_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=H7vx-9flvLUQ7kNvgHtaNXQ&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIDATpy9MOgLXOw00_9ezXMjYrvHJ1RpZ41sjfp0s2jNo&oe=670BB376\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/417302905_1467401810543500_813866919816281997_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=H7vx-9flvLUQ7kNvgHtaNXQ&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIDATpy9MOgLXOw00_9ezXMjYrvHJ1RpZ41sjfp0s2jNo&oe=670BB376\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-05-23T08:33:35Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1467401807210167\",\"id\":\"Fnn016ANSlfwjo0f0gxlWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_template12\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(28,'FyCRdBjX54gJ4bOvuurGWT','sample_issue_resolution','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','id','[{\"text\":\"Halo {{1}}, apakah kami bisa mengatasi masalah yang sedang Anda hadapi?\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Ya\",\"type\":\"QUICK_REPLY\"},{\"text\":\"Tidak\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"Halo {{1}}, apakah kami bisa mengatasi masalah yang sedang Anda hadapi?\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Ya\",\"type\":\"QUICK_REPLY\"},{\"text\":\"Tidak\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:15Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"237152371191347\",\"id\":\"FyCRdBjX54gJ4bOvuurGWT\",\"language\":\"id\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_issue_resolution\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(29,'gallFX7wkjKtCCO1p1tyWT','wellcom_check_who_is_texting','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"format\":\"TEXT\",\"text\":\"\\u05d4\\u05d9\\u05d9, \\u05d0\\u05e0\\u05d9 \\u05d4\\u05d1\\u05d5\\u05d8 voipe\",\"type\":\"HEADER\"},{\"text\":\"\\u05d1\\u05e9\\u05d1\\u05d9\\u05dc \\u05e9\\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05e1\\u05d9\\u05d9\\u05e2 \\u05de\\u05d4\\u05e8 \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05e2\\u05dc\\u05d9 \\u05dc\\u05d3\\u05e2\\u05ea \\u05d1\\u05de\\u05d4 \\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05d6\\u05d5\\u05e8 \\ud83e\\udd14\\n\\u05d0\\u05d6 \\u05d1\\u05d1\\u05e7\\u05e9\\u05d4 \\u05d4\\u05e7\\u05d9\\u05e9\\u05d5 \\u05de\\u05d8\\u05d4 \\ud83d\\udc47 \\u05e9\\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\",\"type\":\"BODY\"},{\"text\":\"voipe bot\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"\\u05dc\\u05e7\\u05d5\\u05d7 \\u05d7\\u05d3\\u05e9\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05ea\\u05de\\u05d9\\u05db\\u05d4 \\u05d8\\u05db\\u05e0\\u05d9\\u05ea\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05dc\\u05e7\\u05d5\\u05d7\\u05d5\\u05ea\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"TEXT\",\"text\":\"\\u05d4\\u05d9\\u05d9, \\u05d0\\u05e0\\u05d9 \\u05d4\\u05d1\\u05d5\\u05d8 voipe\",\"type\":\"HEADER\"},{\"text\":\"\\u05d1\\u05e9\\u05d1\\u05d9\\u05dc \\u05e9\\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05e1\\u05d9\\u05d9\\u05e2 \\u05de\\u05d4\\u05e8 \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05e2\\u05dc\\u05d9 \\u05dc\\u05d3\\u05e2\\u05ea \\u05d1\\u05de\\u05d4 \\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05d6\\u05d5\\u05e8 \\ud83e\\udd14\\n\\u05d0\\u05d6 \\u05d1\\u05d1\\u05e7\\u05e9\\u05d4 \\u05d4\\u05e7\\u05d9\\u05e9\\u05d5 \\u05de\\u05d8\\u05d4 \\ud83d\\udc47 \\u05e9\\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\",\"type\":\"BODY\"},{\"text\":\"voipe bot\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"\\u05dc\\u05e7\\u05d5\\u05d7 \\u05d7\\u05d3\\u05e9\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05ea\\u05de\\u05d9\\u05db\\u05d4 \\u05d8\\u05db\\u05e0\\u05d9\\u05ea\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05dc\\u05e7\\u05d5\\u05d7\\u05d5\\u05ea\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:23Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"327150312391832\",\"id\":\"gallFX7wkjKtCCO1p1tyWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"wellcom_check_who_is_texting\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(30,'GFgMaZsOowjmVwLsKb1bWT','test_er','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"format\":\"TEXT\",\"text\":\"my text bla bla header\",\"type\":\"HEADER\"},{\"text\":\"my text bla bla body\",\"type\":\"BODY\"},{\"text\":\"footer text\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Unsubcribe from Promos\",\"type\":\"QUICK_REPLY\"},{\"text\":\"Unsubscribe from All\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"TEXT\",\"text\":\"my text bla bla header\",\"type\":\"HEADER\"},{\"text\":\"my text bla bla body\",\"type\":\"BODY\"},{\"text\":\"footer text\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Unsubcribe from Promos\",\"type\":\"QUICK_REPLY\"},{\"text\":\"Unsubscribe from All\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2024-04-04T11:50:00Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"774876484588679\",\"id\":\"GFgMaZsOowjmVwLsKb1bWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"test_er\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(31,'gNeRDwu6Jt1JXxJHOJ5hWT','welcome_esh9','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05d1\\u05d8\\u05d9\\u05d7\\u05d5\\u05ea \\u05d0\\u05e9.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1: *9*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05d1\\u05d8\\u05d9\\u05d7\\u05d5\\u05ea \\u05d0\\u05e9.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1: *9*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T07:54:34Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"7872828419498771\",\"id\":\"gNeRDwu6Jt1JXxJHOJ5hWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_esh9\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(32,'GWQun5nFjP62oL6HkMSuWT','sample_movie_ticket_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','pt_BR','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Seu ingresso para *{{1}}*\\n*Hor\\u00e1rio* - {{2}}\\n*Local* - {{3}}\\n*Assentos* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Seu ingresso para *{{1}}*\\n*Hor\\u00e1rio* - {{2}}\\n*Local* - {{3}}\\n*Assentos* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:31Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"3055085391389598\",\"id\":\"GWQun5nFjP62oL6HkMSuWT\",\"language\":\"pt_BR\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_movie_ticket_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(33,'Hc0pqArcTWQFQSltl8xUWT','renew_message2','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e2\\u05dc \\u05de\\u05e0\\u05ea \\u05e9\\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05ea\\u05ea \\u05dc\\u05da \\u05e2\\u05dc\\u05d5\\u05d9\\u05d5\\u05ea \\u05de\\u05d3\\u05d5\\u05d9\\u05e7\\u05d5\\u05ea \\u05dc\\u05de\\u05e7\\u05e8\\u05d4 \\u05e9\\u05dc\\u05da \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05e9\\u05dc\\u05d5\\u05d7 \\u05dc\\u05d9 \\u05e6\\u05d9\\u05dc\\u05d5\\u05dd \\u05e9\\u05dc \\u05d4\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d5\\u05ea.\\u05d6 \\u05d0\\u05d5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05e2\\u05dc \\u05d4\\u05e9\\u05d0\\u05dc\\u05d5\\u05ea \\u05d4\\u05d1\\u05d0\\u05d5\\u05ea:\\n*1.* \\u05de\\u05d4 \\u05d4\\u05d0\\u05d1\\u05d7\\u05e0\\u05d4 \\u05d4\\u05e8\\u05e4\\u05d5\\u05d0\\u05d9\\u05ea? \\u05db\\u05d0\\u05d1\\u05d9\\u05dd \\u05d0\\u05d5 \\u05e8\\u05e7\\u05e2 \\u05e4\\u05e1\\u05d9\\u05db\\u05d9\\u05d0\\u05d8\\u05e8\\u05d9?\\n*2.* \\u05de\\u05d9 \\u05d4\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e9\\u05d7\\u05ea\\u05d5\\u05dd \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\\n*3.* \\u05de\\u05d4 \\u05d4\\u05db\\u05de\\u05d5\\u05ea \\u05e9\\u05d9\\u05e9 \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e2\\u05dc \\u05de\\u05e0\\u05ea \\u05e9\\u05d0\\u05d5\\u05db\\u05dc \\u05dc\\u05ea\\u05ea \\u05dc\\u05da \\u05e2\\u05dc\\u05d5\\u05d9\\u05d5\\u05ea \\u05de\\u05d3\\u05d5\\u05d9\\u05e7\\u05d5\\u05ea \\u05dc\\u05de\\u05e7\\u05e8\\u05d4 \\u05e9\\u05dc\\u05da \\u05e0\\u05d9\\u05ea\\u05df \\u05dc\\u05e9\\u05dc\\u05d5\\u05d7 \\u05dc\\u05d9 \\u05e6\\u05d9\\u05dc\\u05d5\\u05dd \\u05e9\\u05dc \\u05d4\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df \\u05d5\\u05ea.\\u05d6 \\u05d0\\u05d5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05e2\\u05dc \\u05d4\\u05e9\\u05d0\\u05dc\\u05d5\\u05ea \\u05d4\\u05d1\\u05d0\\u05d5\\u05ea:\\n*1.* \\u05de\\u05d4 \\u05d4\\u05d0\\u05d1\\u05d7\\u05e0\\u05d4 \\u05d4\\u05e8\\u05e4\\u05d5\\u05d0\\u05d9\\u05ea? \\u05db\\u05d0\\u05d1\\u05d9\\u05dd \\u05d0\\u05d5 \\u05e8\\u05e7\\u05e2 \\u05e4\\u05e1\\u05d9\\u05db\\u05d9\\u05d0\\u05d8\\u05e8\\u05d9?\\n*2.* \\u05de\\u05d9 \\u05d4\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e9\\u05d7\\u05ea\\u05d5\\u05dd \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\\n*3.* \\u05de\\u05d4 \\u05d4\\u05db\\u05de\\u05d5\\u05ea \\u05e9\\u05d9\\u05e9 \\u05d1\\u05e8\\u05d9\\u05e9\\u05d9\\u05d5\\u05df?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:38:39Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"3655520774686316\",\"id\":\"Hc0pqArcTWQFQSltl8xUWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"renew_message2\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(34,'ioHxJUt7xpJGvV6iVDpBWT','voipe_welcome_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd \\u05d0\\u05e0\\u05d7\\u05e0\\u05d5 \\u05d5\\u05d5\\u05d9\\u05d9\\u05e4\\u05d9 \\u05d1\\u05de\\u05d4 \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05d6\\u05d5\\u05e8?\",\"type\":\"BODY\"},{\"buttons\":[{\"text\":\"\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05ea\\u05de\\u05d9\\u05db\\u05d4\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05db\\u05dc \\u05e0\\u05d5\\u05e9\\u05d0 \\u05d0\\u05d7\\u05e8\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd \\u05d0\\u05e0\\u05d7\\u05e0\\u05d5 \\u05d5\\u05d5\\u05d9\\u05d9\\u05e4\\u05d9 \\u05d1\\u05de\\u05d4 \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05d6\\u05d5\\u05e8?\",\"type\":\"BODY\"},{\"buttons\":[{\"text\":\"\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05ea\\u05de\\u05d9\\u05db\\u05d4\",\"type\":\"QUICK_REPLY\"},{\"text\":\"\\u05db\\u05dc \\u05e0\\u05d5\\u05e9\\u05d0 \\u05d0\\u05d7\\u05e8\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2024-09-09T11:23:15Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"4021573461457916\",\"id\":\"ioHxJUt7xpJGvV6iVDpBWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"voipe_welcome_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(35,'iQlgCx5Yy6TfNS6u7SoRWT','welcome_mivne9','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05de\\u05e2\\u05e8\\u05db\\u05d5\\u05ea \\u05de\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1: *9*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05de\\u05e2\\u05e8\\u05db\\u05d5\\u05ea \\u05de\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1: *9*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T07:52:43Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"343498662140761\",\"id\":\"iQlgCx5Yy6TfNS6u7SoRWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_mivne9\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(36,'j4o8cIUWLwONTlTui1qWWT','welcome_yavne','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"example\":{\"body_text\":[[\"\\u05d5\\u05d9\\u05e7\\u05d9 \\u05e0\\u05d7\\u05d5\\u05dd\"]]},\"text\":\"{{1}} \\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"\\u05d5\\u05d9\\u05e7\\u05d9 \\u05e0\\u05d7\\u05d5\\u05dd\"]]},\"text\":\"{{1}} \\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:13:16Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"798995922380510\",\"id\":\"j4o8cIUWLwONTlTui1qWWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_yavne\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(37,'jQliRBeqNaJBLTiQ6H26WT','start_template_1_f5g42k52x','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"example\":{\"body_text\":[[\"Hello from 1msg\"]]},\"text\":\"\\u26aa {{1}} \\u2039 \\u2039\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"Hello from 1msg\"]]},\"text\":\"\\u26aa {{1}} \\u2039 \\u2039\",\"type\":\"BODY\"}],\"created_at\":\"2024-01-15T06:13:50Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"775956801035434\",\"id\":\"jQliRBeqNaJBLTiQ6H26WT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"start_template_1_f5g42k52x\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(38,'KfHtE16NfJ9Brxm02TUUWT','start_template_1_em37ozk3b','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"example\":{\"body_text\":[[\"Hello from 1msg\"]]},\"text\":\"\\ud83d\\udcac {{1}} \\u2039 \\u2039\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"Hello from 1msg\"]]},\"text\":\"\\ud83d\\udcac {{1}} \\u2039 \\u2039\",\"type\":\"BODY\"}],\"created_at\":\"2024-01-11T16:12:48Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"2311483585729078\",\"id\":\"KfHtE16NfJ9Brxm02TUUWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"start_template_1_em37ozk3b\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(39,'Kj2XhLNpIepsWso4KGdwWT','update_order_1','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d0\\u05e0\\u05d0 \\u05d4\\u05d6\\u05df \\u05d0\\u05ea \\u05e7\\u05d5\\u05d3 \\u05d4\\u05d0\\u05ea\\u05e8\\/\\u05e4\\u05e8\\u05d5\\u05d9\\u05e7\\u05d8.\\n(\\u05d1\\u05de\\u05d9\\u05d3\\u05d4 \\u05d5\\u05d0\\u05d9\\u05e0\\u05da \\u05d9\\u05d5\\u05d3\\u05e2 \\u05d0\\u05e0\\u05d0 \\u05e6\\u05d9\\u05d9\\u05df \\u05d0\\u05ea \\u05e9\\u05dd \\u05de\\u05d6\\u05de\\u05d9\\u05df \\u05d4\\u05e2\\u05d1\\u05d5\\u05d3\\u05d4 \\u05d5\\u05d0\\u05ea \\u05e9\\u05dd \\u05d0\\u05ea\\u05e8 \\u05d4\\u05e2\\u05d1\\u05d5\\u05d3\\u05d4)\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d0\\u05e0\\u05d0 \\u05d4\\u05d6\\u05df \\u05d0\\u05ea \\u05e7\\u05d5\\u05d3 \\u05d4\\u05d0\\u05ea\\u05e8\\/\\u05e4\\u05e8\\u05d5\\u05d9\\u05e7\\u05d8.\\n(\\u05d1\\u05de\\u05d9\\u05d3\\u05d4 \\u05d5\\u05d0\\u05d9\\u05e0\\u05da \\u05d9\\u05d5\\u05d3\\u05e2 \\u05d0\\u05e0\\u05d0 \\u05e6\\u05d9\\u05d9\\u05df \\u05d0\\u05ea \\u05e9\\u05dd \\u05de\\u05d6\\u05de\\u05d9\\u05df \\u05d4\\u05e2\\u05d1\\u05d5\\u05d3\\u05d4 \\u05d5\\u05d0\\u05ea \\u05e9\\u05dd \\u05d0\\u05ea\\u05e8 \\u05d4\\u05e2\\u05d1\\u05d5\\u05d3\\u05d4)\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:15:15Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1708327189571166\",\"id\":\"Kj2XhLNpIepsWso4KGdwWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"update_order_1\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(40,'KlwT6u4UeDcMDqmymo4JWT','new_template13','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/328737455_3867460720207909_2251888652358422256_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=H_S-jNdZG9EQ7kNvgEk_WMW&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIF0LTSSJq17H2vl-WbPKvpZ3kC1HTebcPL0UFw1XdKTD&oe=670B9DDE\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/328737455_3867460720207909_2251888652358422256_n.jpg?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=H_S-jNdZG9EQ7kNvgEk_WMW&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIF0LTSSJq17H2vl-WbPKvpZ3kC1HTebcPL0UFw1XdKTD&oe=670B9DDE\"]},\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-05-23T09:06:46Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"3867460713541243\",\"id\":\"KlwT6u4UeDcMDqmymo4JWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_template13\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"INCORRECT_CATEGORY\",\"status\":\"rejected\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(41,'L5gK6odGZNg4rb76QFljWT','sample_purchase_feedback','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','pt_BR','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Agradecemos a aquisi\\u00e7\\u00e3o de {{1}}! Valorizamos seu feedback e gostar\\u00edamos de saber mais sobre sua experi\\u00eancia.\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Participe da pesquisa\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Agradecemos a aquisi\\u00e7\\u00e3o de {{1}}! Valorizamos seu feedback e gostar\\u00edamos de saber mais sobre sua experi\\u00eancia.\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Participe da pesquisa\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:17Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"325538302404196\",\"id\":\"L5gK6odGZNg4rb76QFljWT\",\"language\":\"pt_BR\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_purchase_feedback\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(42,'lD00DSrHY5qOuPSy6alWWT','new_license_background','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e2\\u05dc \\u05d0\\u05d9\\u05d6\\u05d4 \\u05e8\\u05e7\\u05e2 \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9 \\u05de\\u05d1\\u05d5\\u05e7\\u05e9 \\u05d4\\u05e7\\u05e0\\u05d0\\u05d1\\u05d9\\u05e1?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e2\\u05dc \\u05d0\\u05d9\\u05d6\\u05d4 \\u05e8\\u05e7\\u05e2 \\u05e8\\u05e4\\u05d5\\u05d0\\u05d9 \\u05de\\u05d1\\u05d5\\u05e7\\u05e9 \\u05d4\\u05e7\\u05e0\\u05d0\\u05d1\\u05d9\\u05e1?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-09T12:51:20Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"2815110945320903\",\"id\":\"lD00DSrHY5qOuPSy6alWWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_license_background\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(43,'lG5AU8MhtAA0HpIGpHldWT','new_license_medicines','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05d4\\u05d0\\u05dd \\u05d9\\u05e9 \\u05e9\\u05d9\\u05de\\u05d5\\u05e9 \\u05e7\\u05d5\\u05d3\\u05dd \\u05d1\\u05ea\\u05e8\\u05d5\\u05e4\\u05d5\\u05ea?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05d4\\u05d0\\u05dd \\u05d9\\u05e9 \\u05e9\\u05d9\\u05de\\u05d5\\u05e9 \\u05e7\\u05d5\\u05d3\\u05dd \\u05d1\\u05ea\\u05e8\\u05d5\\u05e4\\u05d5\\u05ea?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-09T12:52:59Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1328510605219852\",\"id\":\"lG5AU8MhtAA0HpIGpHldWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_license_medicines\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(44,'lMYdKzHn1Zdz9uGu2nrjWT','sample_movie_ticket_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','es','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Tu entrada para *{{1}}*\\n*Hora* - {{2}}\\n*Lugar* - {{3}}\\n*Asientos* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Tu entrada para *{{1}}*\\n*Hora* - {{2}}\\n*Lugar* - {{3}}\\n*Asientos* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:33Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"3297679743791885\",\"id\":\"lMYdKzHn1Zdz9uGu2nrjWT\",\"language\":\"es\",\"modified_at\":\"2024-09-13T12:41:27Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_movie_ticket_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(45,'lobyyBttvH0BA4csfCgbWT','start_template_1_8cc269t','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"body_text\":[[\"People love to receive notifications\"]]},\"text\":\"\\u203a\\u203a\\u203a {{1}} \\u2039 \\u2039\\u2039 \\u2039\\u2039\\u2039\",\"type\":\"BODY\"},{\"text\":\"Sent via WhatsApp Business API\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"People love to receive notifications\"]]},\"text\":\"\\u203a\\u203a\\u203a {{1}} \\u2039 \\u2039\\u2039 \\u2039\\u2039\\u2039\",\"type\":\"BODY\"},{\"text\":\"Sent via WhatsApp Business API\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T12:13:43Z\",\"created_by\":{\"user_id\":\"bGuGabU\",\"user_name\":\"Nikita Lialin\"},\"external_id\":\"739200647550644\",\"id\":\"lobyyBttvH0BA4csfCgbWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"start_template_1_8cc269t\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(46,'lpLBIJz0XGf659nwKnhrWT','welcome_esh','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05d1\\u05d8\\u05d9\\u05d7\\u05d5\\u05ea \\u05d0\\u05e9.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05d1\\u05d8\\u05d9\\u05d7\\u05d5\\u05ea \\u05d0\\u05e9.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:32:52Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"987199446476551\",\"id\":\"lpLBIJz0XGf659nwKnhrWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_esh\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(47,'lpP4Wcvz2PpKfNfe7FKVWT','dosage_message1','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05dc\\u05d2\\u05d1\\u05d9 \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3, \\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05e9\\u05e4\\u05d7\\u05d4:* 950 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05d4 \\u05de\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e4\\u05e8\\u05d8\\u05d9 \\u05e9\\u05dc\\u05e0\\u05d5: * 1250 \\u05e9\\\"\\u05d7\\n\\n*\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4 (\\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d4):* 400-500 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05d1\\u05de\\u05e7\\u05d5\\u05dd \\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4):* 1400 \\u05e9\\\"\\u05d7\\n\\n*\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05dc\\u05d0 \\u05dc\\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4 \\u05db\\u05de\\u05d5 \\u05d1\\u05e8\\u05d2\\u05d9\\u05dc):* 1400 \\u05e9\\u05f4\\u05d7\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05dc\\u05d2\\u05d1\\u05d9 \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3, \\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05e9\\u05e4\\u05d7\\u05d4:* 950 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05d4 \\u05de\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e4\\u05e8\\u05d8\\u05d9 \\u05e9\\u05dc\\u05e0\\u05d5: * 1250 \\u05e9\\\"\\u05d7\\n\\n*\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4 (\\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d4):* 400-500 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05d1\\u05de\\u05e7\\u05d5\\u05dd \\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4):* 1400 \\u05e9\\\"\\u05d7\\n\\n*\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05dc\\u05d0 \\u05dc\\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4 \\u05db\\u05de\\u05d5 \\u05d1\\u05e8\\u05d2\\u05d9\\u05dc):* 1400 \\u05e9\\u05f4\\u05d7\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:41:27Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"440058975602767\",\"id\":\"lpP4Wcvz2PpKfNfe7FKVWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"dosage_message1\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(48,'m3llbg1OwNwPB3YeUIwgWT','sample_issue_resolution','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','es','[{\"text\":\"Hola, {{1}}. \\u00bfPudiste solucionar el problema que ten\\u00edas?\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"S\\u00ed\",\"type\":\"QUICK_REPLY\"},{\"text\":\"No\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"Hola, {{1}}. \\u00bfPudiste solucionar el problema que ten\\u00edas?\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"S\\u00ed\",\"type\":\"QUICK_REPLY\"},{\"text\":\"No\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:14Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"838784003395807\",\"id\":\"m3llbg1OwNwPB3YeUIwgWT\",\"language\":\"es\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_issue_resolution\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(49,'MDe70zN0fwDLBOmOt0uEWT','sample_flight_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"This is your flight confirmation for {{1}}-{{2}} on {{3}}.\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"This is your flight confirmation for {{1}}-{{2}} on {{3}}.\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:28Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"569333737806927\",\"id\":\"MDe70zN0fwDLBOmOt0uEWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_flight_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(50,'MKlKJgGWIs9SJ5QebPdfWT','hello','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e9\\u05e4\\u05e0\\u05d9\\u05ea\\u05dd \\u05d0\\u05dc\\u05d9\\u05e0\\u05d5, \\u05de\\u05d9\\u05d3 \\u05e0\\u05e2\\u05e0\\u05d4\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e9\\u05e4\\u05e0\\u05d9\\u05ea\\u05dd \\u05d0\\u05dc\\u05d9\\u05e0\\u05d5, \\u05de\\u05d9\\u05d3 \\u05e0\\u05e2\\u05e0\\u05d4\",\"type\":\"BODY\"}],\"created_at\":\"2023-12-12T12:26:27Z\",\"created_by\":{\"user_id\":\"BihzsUU\",\"user_name\":\"VOIPE\"},\"external_id\":\"671883904930722\",\"id\":\"MKlKJgGWIs9SJ5QebPdfWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"hello\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(51,'mynkMmHUSJMNP7gHu5QoWT','welcome_mivne0','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05de\\u05e2\\u05e8\\u05db\\u05d5\\u05ea \\u05de\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05de\\u05e2\\u05e8\\u05db\\u05d5\\u05ea \\u05de\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T06:28:17Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1891194897952597\",\"id\":\"mynkMmHUSJMNP7gHu5QoWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_mivne0\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(52,'mzwRgaFIQ2SKG9zs10NTWT','call_with_agent','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\\n\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4. \\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea. \\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: https:\\/\\/maabadot.com\\/\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\\n\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4. \\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea. \\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: https:\\/\\/maabadot.com\\/\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:16:33Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1178254370168239\",\"id\":\"mzwRgaFIQ2SKG9zs10NTWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"call_with_agent\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(53,'nT1f638gIvsGCwhvGeDPWT','renew_message1','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05dc\\u05d2\\u05d1\\u05d9 \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3, \\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05e9\\u05e4\\u05d7\\u05d4:* 950 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05d4 \\u05de\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e4\\u05e8\\u05d8\\u05d9 \\u05e9\\u05dc\\u05e0\\u05d5:* 1250 \\u05e9\\\"\\u05d7\\n\\n*\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4 (\\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d4):* 400-500 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05d1\\u05de\\u05e7\\u05d5\\u05dd \\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4):* 1400 \\u05e9\\\"\\u05d7\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05dc\\u05d2\\u05d1\\u05d9 \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3, \\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05e9\\u05e4\\u05d7\\u05d4:* 950 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05d4 \\u05de\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e4\\u05e8\\u05d8\\u05d9 \\u05e9\\u05dc\\u05e0\\u05d5:* 1250 \\u05e9\\\"\\u05d7\\n\\n*\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4 (\\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d4):* 400-500 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05d1\\u05de\\u05e7\\u05d5\\u05dd \\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4):* 1400 \\u05e9\\\"\\u05d7\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T05:37:25Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"667519168911102\",\"id\":\"nT1f638gIvsGCwhvGeDPWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"renew_message1\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(54,'NUM1k4dxy9yUF2tdmsPcWT','sample_shipping_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','id','[{\"text\":\"Paket Anda sudah dikirim. Paket akan sampai dalam {{1}} hari kerja.\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"text\":\"Paket Anda sudah dikirim. Paket akan sampai dalam {{1}} hari kerja.\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:24Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"3804803942979467\",\"id\":\"NUM1k4dxy9yUF2tdmsPcWT\",\"language\":\"id\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_shipping_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(55,'NvxiCvrquDe2OXISdvZGWT','start_template_1_m222rnzblh','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"example\":{\"body_text\":[[\"0\"]]},\"text\":\"\\u26aa {{1}} \\u2039 \\u2039\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"0\"]]},\"text\":\"\\u26aa {{1}} \\u2039 \\u2039\",\"type\":\"BODY\"}],\"created_at\":\"2023-12-13T09:06:14Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"380475801092004\",\"id\":\"NvxiCvrquDe2OXISdvZGWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"start_template_1_m222rnzblh\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(56,'oNWk5ANy78c5r0zOlqTPWT','details','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05de\\u05d4 \\u05d4\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05de\\u05d1\\u05d5\\u05e7\\u05e9?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05de\\u05d4 \\u05d4\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05de\\u05d1\\u05d5\\u05e7\\u05e9?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:17:04Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"953749959832710\",\"id\":\"oNWk5ANy78c5r0zOlqTPWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"details\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(57,'oqR4dPUTTVT9pmceWcoPWT','sample_shipping_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"text\":\"Your package has been shipped. It will be delivered in {{1}} business days.\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"text\":\"Your package has been shipped. It will be delivered in {{1}} business days.\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:25Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"675801469924504\",\"id\":\"oqR4dPUTTVT9pmceWcoPWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_shipping_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(58,'oRdmKTXVa336AwGKzZxkWT','welcome_yavne_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:31:08Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"460251620269068\",\"id\":\"oRdmKTXVa336AwGKzZxkWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_yavne_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(59,'pHdREi4JoSsTBYIAXwdiWT','sample_purchase_feedback','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','es','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u00a1Gracias por comprar {{1}}! Valoramos tus comentarios y nos gustar\\u00eda saber c\\u00f3mo fue tu experiencia.\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Responder encuesta\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"\\u00a1Gracias por comprar {{1}}! Valoramos tus comentarios y nos gustar\\u00eda saber c\\u00f3mo fue tu experiencia.\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Responder encuesta\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:19Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"914291162850203\",\"id\":\"pHdREi4JoSsTBYIAXwdiWT\",\"language\":\"es\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_purchase_feedback\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(60,'PoGnWG0SiM8GUJ8KDyNSWT','sample_movie_ticket_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','id','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Tiket Anda untuk *{{1}}*\\n*Waktu* - {{2}}\\n*Tempat* - {{3}}\\n*Kursi* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Tiket Anda untuk *{{1}}*\\n*Waktu* - {{2}}\\n*Tempat* - {{3}}\\n*Kursi* - {{4}}\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:32Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"1397617217276283\",\"id\":\"PoGnWG0SiM8GUJ8KDyNSWT\",\"language\":\"id\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_movie_ticket_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(61,'qDGT4nKhx76MKO2qPGOnWT','hi','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05db\\u05dd, \\u05de\\u05d9\\u05d3 \\u05e0\\u05e2\\u05e0\\u05d4\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05db\\u05dd, \\u05de\\u05d9\\u05d3 \\u05e0\\u05e2\\u05e0\\u05d4\",\"type\":\"BODY\"}],\"created_at\":\"2023-12-12T13:25:59Z\",\"created_by\":{\"user_id\":\"BihzsUU\",\"user_name\":\"VOIPE\"},\"external_id\":\"730882558929644\",\"id\":\"qDGT4nKhx76MKO2qPGOnWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"hi\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(62,'qqQIirQtVuP3DPayAPLyWT','welcome_test','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"example\":{\"body_text\":[[\"\\u05d9\\u05e2\\u05dc\"]]},\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd {{1}}\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"\\u05d9\\u05e2\\u05dc\"]]},\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd {{1}}\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05ea\\u05e4\\u05e2\\u05d5\\u05dc \\u05d9\\u05d1\\u05e0\\u05d4.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-30T07:15:06Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"363843916574163\",\"id\":\"qqQIirQtVuP3DPayAPLyWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_test\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(63,'qUV3xzvIA7IMw62pTk8wWT','start_template_8_5ny2z3d2r','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"example\":{\"body_text\":[[\"\\u05d4\\u05d9\\u05d9 :-)\",\"\\u05d4\\u05d2\\u05e2\\u05ea\\u05dd \\u05dc\\u05de\\u05e2\\u05e0\\u05d4 \\u05e9\\u05dc \\u05d5\\u05d5\\u05d9\\u05d9\\u05e4\\u05d9 \\u05d8\\u05dc\\u05e7\\u05d5\\u05dd,\",\"\\u05d1\\u05db\\u05d3\\u05d9 \\u05e9\\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05d8\\u05e4\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05db\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d9\\u05e2\\u05d9\\u05dc\\u05d4 \\u05d5\\u05de\\u05e7\\u05e6\\u05d5\\u05e2\\u05d9\\u05ea \\u05d0\\u05e0\\u05d0 \\u05d4\\u05e9\\u05d9\\u05d1\\u05d5 \\u05e2\\u05dc \\u05e1\\u05d9\\u05d1\\u05ea \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05db\\u05dd:\",\"\\u05dc\\u05ea\\u05de\\u05d9\\u05db\\u05d4 \\u05d8\\u05db\\u05e0\\u05d9\\u05ea \\u05d4\\u05e9\\u05d9\\u05d1\\u05d5: 1\",\"\\u05dc\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05dc\\u05e7\\u05d5\\u05d7\\u05d5\\u05ea \\u05d9\\u05e9 \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 2\",\"\\u05dc\\u05dc\\u05e7\\u05d5\\u05d7\\u05d5\\u05ea \\u05d7\\u05d3\\u05e9\\u05d9\\u05dd \\u05d4\\u05e9\\u05d9\\u05d1\\u05d5: 3\",\"\\u05e0\\u05e6\\u05d9\\u05d2\\u05d9\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05d0\\u05ea \\u05de\\u05d9\\u05e8\\u05d1 \\u05d4\\u05de\\u05d0\\u05de\\u05e6\\u05d9\\u05dd \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05de\\u05e7\\u05e6\\u05d5\\u05e2\\u05d9\\u05d5\\u05ea.\",\"\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e9\\u05d9\\u05ea\\u05d5\\u05e3 \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 :-]\"]]},\"text\":\"\\u26aa {{1}}\\n{{2}}\\n{{3}}\\n{{4}}\\n{{5}}\\n{{6}}\\n{{7}}\\n{{8}} \\u2039 \\u2039\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"body_text\":[[\"\\u05d4\\u05d9\\u05d9 :-)\",\"\\u05d4\\u05d2\\u05e2\\u05ea\\u05dd \\u05dc\\u05de\\u05e2\\u05e0\\u05d4 \\u05e9\\u05dc \\u05d5\\u05d5\\u05d9\\u05d9\\u05e4\\u05d9 \\u05d8\\u05dc\\u05e7\\u05d5\\u05dd,\",\"\\u05d1\\u05db\\u05d3\\u05d9 \\u05e9\\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05d8\\u05e4\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05db\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d9\\u05e2\\u05d9\\u05dc\\u05d4 \\u05d5\\u05de\\u05e7\\u05e6\\u05d5\\u05e2\\u05d9\\u05ea \\u05d0\\u05e0\\u05d0 \\u05d4\\u05e9\\u05d9\\u05d1\\u05d5 \\u05e2\\u05dc \\u05e1\\u05d9\\u05d1\\u05ea \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05db\\u05dd:\",\"\\u05dc\\u05ea\\u05de\\u05d9\\u05db\\u05d4 \\u05d8\\u05db\\u05e0\\u05d9\\u05ea \\u05d4\\u05e9\\u05d9\\u05d1\\u05d5: 1\",\"\\u05dc\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05dc\\u05e7\\u05d5\\u05d7\\u05d5\\u05ea \\u05d9\\u05e9 \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 2\",\"\\u05dc\\u05dc\\u05e7\\u05d5\\u05d7\\u05d5\\u05ea \\u05d7\\u05d3\\u05e9\\u05d9\\u05dd \\u05d4\\u05e9\\u05d9\\u05d1\\u05d5: 3\",\"\\u05e0\\u05e6\\u05d9\\u05d2\\u05d9\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05d0\\u05ea \\u05de\\u05d9\\u05e8\\u05d1 \\u05d4\\u05de\\u05d0\\u05de\\u05e6\\u05d9\\u05dd \\u05dc\\u05d4\\u05e9\\u05d9\\u05d1 \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05de\\u05e7\\u05e6\\u05d5\\u05e2\\u05d9\\u05d5\\u05ea.\",\"\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e9\\u05d9\\u05ea\\u05d5\\u05e3 \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 :-]\"]]},\"text\":\"\\u26aa {{1}}\\n{{2}}\\n{{3}}\\n{{4}}\\n{{5}}\\n{{6}}\\n{{7}}\\n{{8}} \\u2039 \\u2039\",\"type\":\"BODY\"}],\"created_at\":\"2024-10-30T12:30:59Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"467607315732545\",\"id\":\"qUV3xzvIA7IMw62pTk8wWT\",\"language\":\"en_US\",\"modified_at\":\"2024-10-30T12:31:18Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"start_template_8_5ny2z3d2r\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":null,\"rejected_reason\":\"INVALID_FORMAT\",\"status\":\"rejected\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(64,'rDhfxumXlkDGWiCIvzs3WT','aaa','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','ar','[{\"format\":\"TEXT\",\"text\":\"test header\",\"type\":\"HEADER\"},{\"text\":\"bbb\",\"type\":\"BODY\"},{\"text\":\"text footer\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"TEXT\",\"text\":\"test header\",\"type\":\"HEADER\"},{\"text\":\"bbb\",\"type\":\"BODY\"},{\"text\":\"text footer\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-04-15T12:40:20Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1109881360317411\",\"id\":\"rDhfxumXlkDGWiCIvzs3WT\",\"language\":\"ar\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"aaa\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(65,'Rr3KJBOPkAbJ99MBpio7WT','dosage_message1_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05dc\\u05d2\\u05d1\\u05d9 \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3, \\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05e9\\u05e4\\u05d7\\u05d4:* 950 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d0\\u05d5 \\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05d4 \\u05de\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e4\\u05e8\\u05d8\\u05d9 \\u05e9\\u05dc\\u05e0\\u05d5:* 1250 \\u05e9\\\"\\u05d7\\n\\n*\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4 (\\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d4):* 400-500 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05d1\\u05de\\u05e7\\u05d5\\u05dd \\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4):* 1400 \\u05e9\\\"\\u05d7\\n\\n*\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05dc\\u05d0 \\u05dc\\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4 \\u05db\\u05de\\u05d5 \\u05d1\\u05e8\\u05d2\\u05d9\\u05dc):* 1400 \\u05e9\\u05f4\\u05d7\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05dc\\u05d2\\u05d1\\u05d9 \\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d1\\u05dc\\u05d1\\u05d3, \\u05d0\\u05e0\\u05d9 \\u05d0\\u05e0\\u05e1\\u05d4 \\u05dc\\u05d4\\u05e1\\u05d1\\u05d9\\u05e8 \\u05e2\\u05dc \\u05d4\\u05ea\\u05d4\\u05dc\\u05d9\\u05da \\u05d5\\u05d4\\u05de\\u05d7\\u05d9\\u05e8\\u05d9\\u05dd \\u05d1\\u05e6\\u05d5\\u05e8\\u05d4 \\u05d4\\u05db\\u05d9 \\u05e9\\u05e7\\u05d5\\u05e4\\u05d4 \\u05d5\\u05d1\\u05e8\\u05d5\\u05e8\\u05d4 \\u05e9\\u05d0\\u05e0\\u05d9 \\u05d9\\u05db\\u05d5\\u05dc\\u05d4 \\ud83d\\ude4f\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9\\/\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05ea \\u05e8\\u05d5\\u05e4\\u05d0 \\u05de\\u05e9\\u05e4\\u05d7\\u05d4:* 950 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05d0\\u05d5 \\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05e2\\u05dd \\u05d4\\u05de\\u05dc\\u05e6\\u05d4 \\u05de\\u05e8\\u05d5\\u05e4\\u05d0 \\u05e4\\u05e8\\u05d8\\u05d9 \\u05e9\\u05dc\\u05e0\\u05d5:* 1250 \\u05e9\\\"\\u05d7\\n\\n*\\u05d0\\u05d9 \\u05de\\u05e0\\u05d9\\u05e2\\u05d4 (\\u05ea\\u05dc\\u05d5\\u05d9 \\u05d1\\u05d4\\u05ea\\u05d5\\u05d5\\u05d9\\u05d4):* 400-500 \\u05e9\\\"\\u05d7\\n\\n*\\u05d7\\u05d9\\u05d3\\u05d5\\u05e9 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05d1\\u05de\\u05e7\\u05d5\\u05dd \\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4):* 1400 \\u05e9\\\"\\u05d7\\n\\n*\\u05d4\\u05e2\\u05dc\\u05d0\\u05d4 \\u05dc\\u05e9\\u05e0\\u05d4 \\u05de\\u05dc\\u05d0\\u05d4 (\\u05dc\\u05d0 \\u05dc\\u05d7\\u05e6\\u05d9 \\u05e9\\u05e0\\u05d4 \\u05db\\u05de\\u05d5 \\u05d1\\u05e8\\u05d2\\u05d9\\u05dc):* 1400 \\u05e9\\u05f4\\u05d7\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-10T07:02:09Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"858826579445188\",\"id\":\"Rr3KJBOPkAbJ99MBpio7WT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"dosage_message1_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(66,'rWCeUuw9c1CGMI0qYIGtWT','welcome_esh0','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05d1\\u05d8\\u05d9\\u05d7\\u05d5\\u05ea \\u05d0\\u05e9.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05e9\\u05dc\\u05d5\\u05dd,\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05dc\\u05de\\u05d7\\u05dc\\u05e7\\u05ea \\u05d1\\u05d8\\u05d9\\u05d7\\u05d5\\u05ea \\u05d0\\u05e9.\\n\\u05e0\\u05e6\\u05d9\\u05d2\\u05e0\\u05d5 \\u05d0\\u05d9\\u05e0\\u05dd \\u05d6\\u05de\\u05d9\\u05e0\\u05d9\\u05dd \\u05db\\u05e8\\u05d2\\u05e2 \\u05d5\\u05d1\\u05db\\u05d3\\u05d9 \\u05dc\\u05d6\\u05e8\\u05d6 \\u05d0\\u05ea \\u05d4\\u05d8\\u05d9\\u05e4\\u05d5\\u05dc \\u05d1\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05e0\\u05d5\\u05db\\u05dc \\u05dc\\u05e2\\u05e9\\u05d5\\u05ea \\u05d6\\u05d0\\u05ea \\u05d1\\u05d4\\u05ea\\u05db\\u05ea\\u05d1\\u05d5\\u05ea:\\n\\u05d0\\u05e0\\u05d0 \\u05d1\\u05d7\\u05e8 \\u05d0\\u05ea \\u05d4\\u05e4\\u05e2\\u05d5\\u05dc\\u05d4 \\u05e9\\u05d1\\u05e8\\u05e6\\u05d5\\u05e0\\u05da \\u05dc\\u05d1\\u05e6\\u05e2:\\n\\u05dc\\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05d7\\u05d3\\u05e9\\u05d4 \\u05d4\\u05e9\\u05d1: *1*\\n\\u05dc\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05d6\\u05de\\u05e0\\u05d4 \\u05e7\\u05d9\\u05d9\\u05de\\u05ea \\u05d4\\u05e9\\u05d1: *2*\\n\\u05dc\\u05d1\\u05d9\\u05e8\\u05d5\\u05e8 \\u05e4\\u05e8\\u05d8\\u05d9\\u05dd \\u05d5\\u05de\\u05d9\\u05d3\\u05e2 \\u05d4\\u05e9\\u05d1: *3*\\n\\u05dc\\u05e9\\u05d9\\u05d7\\u05d4 \\u05e2\\u05dd \\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e9\\u05d1: *4*\\n\\u05dc\\u05d7\\u05d6\\u05e8\\u05d4 \\u05dc\\u05ea\\u05e4\\u05e8\\u05d9\\u05d8 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d9 \\u05d4\\u05e9\\u05d1 *0*\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T06:31:03Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1469237800463359\",\"id\":\"rWCeUuw9c1CGMI0qYIGtWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"welcome_esh0\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(67,'s9mrR6Y0H5MllEenEP0WWT','voipe_welcome','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"hi, welcome to voipe support\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"hi, welcome to voipe support\",\"type\":\"BODY\"}],\"created_at\":\"2024-02-22T08:41:17Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1418243802396097\",\"id\":\"s9mrR6Y0H5MllEenEP0WWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"voipe_welcome\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(68,'tcjeRGExIsDJbEqepLbuWT','maabadot_request','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\n\\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\n\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: \\nMaabadot.com\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\n\\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\n\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: \\nMaabadot.com\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-25T12:40:55Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"513036577734636\",\"id\":\"tcjeRGExIsDJbEqepLbuWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"maabadot_request\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(69,'tKX33CHJdeSvr1cnocpFWT','sample_happy_hour_announcement','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"Happy hour is here! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nPlease be merry and enjoy the day. \\ud83c\\udf89\\nVenue: {{1}}\\nTime: {{2}}\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"Happy hour is here! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nPlease be merry and enjoy the day. \\ud83c\\udf89\\nVenue: {{1}}\\nTime: {{2}}\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:21Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"1879035305595048\",\"id\":\"tKX33CHJdeSvr1cnocpFWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_happy_hour_announcement\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(70,'TZk6Up7EG3Gu8TmGnLGGWT','sample_happy_hour_announcement','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','es','[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"\\u00a1Lleg\\u00f3 el happy hour! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nA divertirse y disfrutar. \\ud83c\\udf89\\nLugar: {{1}}\\nHora: {{2}}\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"\\u00a1Lleg\\u00f3 el happy hour! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nA divertirse y disfrutar. \\ud83c\\udf89\\nLugar: {{1}}\\nHora: {{2}}\",\"type\":\"BODY\"},{\"text\":\"Este mensaje proviene de un negocio no verificado.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:20Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"806675363329954\",\"id\":\"TZk6Up7EG3Gu8TmGnLGGWT\",\"language\":\"es\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_happy_hour_announcement\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(71,'U9gXMg6mTq4I5ceFsX52WT','update_order_2','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05de\\u05d4 \\u05d4\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05de\\u05d1\\u05d5\\u05e7\\u05e9?\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05de\\u05d4 \\u05d4\\u05e2\\u05d3\\u05db\\u05d5\\u05df \\u05d4\\u05de\\u05d1\\u05d5\\u05e7\\u05e9?\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:18:27Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"497867979274966\",\"id\":\"U9gXMg6mTq4I5ceFsX52WT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"update_order_2\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(72,'UHs9IxXRv4jMswYq70kIWT','sample_issue_resolution','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"text\":\"Hi {{1}}, were we able to solve the issue that you were facing?\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Yes\",\"type\":\"QUICK_REPLY\"},{\"text\":\"No\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"UTILITY\",\"components\":[{\"text\":\"Hi {{1}}, were we able to solve the issue that you were facing?\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Yes\",\"type\":\"QUICK_REPLY\"},{\"text\":\"No\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:14Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"758978961434907\",\"id\":\"UHs9IxXRv4jMswYq70kIWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_issue_resolution\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(73,'v0I0o5QWsPmI4pHtYv0LWT','seasonal_promotion','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_text\":[\"Summer Sale\"]},\"format\":\"TEXT\",\"text\":\"Our {{1}} is on!\",\"type\":\"HEADER\"},{\"example\":{\"body_text\":[[\"the end of August\",\"25OFF\",\"25%\"]]},\"text\":\"Shop now through {{1}} and use code {{2}} to get {{3}} off of all merchandise.\",\"type\":\"BODY\"},{\"text\":\"Use the buttons below to manage your marketing subscriptions\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Unsubcribe from Promos\",\"type\":\"QUICK_REPLY\"},{\"text\":\"Unsubscribe from All\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_text\":[\"Summer Sale\"]},\"format\":\"TEXT\",\"text\":\"Our {{1}} is on!\",\"type\":\"HEADER\"},{\"example\":{\"body_text\":[[\"the end of August\",\"25OFF\",\"25%\"]]},\"text\":\"Shop now through {{1}} and use code {{2}} to get {{3}} off of all merchandise.\",\"type\":\"BODY\"},{\"text\":\"Use the buttons below to manage your marketing subscriptions\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Unsubcribe from Promos\",\"type\":\"QUICK_REPLY\"},{\"text\":\"Unsubscribe from All\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2024-04-04T11:44:51Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"775876524502725\",\"id\":\"v0I0o5QWsPmI4pHtYv0LWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"seasonal_promotion\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(74,'Vo3nwtG2Kv1QjRVIoEx3WT','update_order_3_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\n\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\n\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T12:07:56Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"507925618301777\",\"id\":\"Vo3nwtG2Kv1QjRVIoEx3WT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"update_order_3_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(75,'VQ2bIqeDs4OSgX3TjdseWT','new_template8','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/418418479_770649421849205_5490941547427234705_n.pdf?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=WoUxZjmBbyMQ7kNvgHoakTa&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIC7QOrXpqpUprUPcF87GFK47BZgQFYQnjA_aoLzW3H_1&oe=670BA6D8\"]},\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"test body 8\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430 8\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/418418479_770649421849205_5490941547427234705_n.pdf?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=WoUxZjmBbyMQ7kNvgHoakTa&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIC7QOrXpqpUprUPcF87GFK47BZgQFYQnjA_aoLzW3H_1&oe=670BA6D8\"]},\"format\":\"DOCUMENT\",\"type\":\"HEADER\"},{\"text\":\"test body 8\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430 8\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-05-15T21:34:49Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"770649418515872\",\"id\":\"VQ2bIqeDs4OSgX3TjdseWT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_template8\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(76,'vzq69R4fd6ROpUMLTJoMWT','sample_purchase_feedback','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en_US','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Thank you for purchasing {{1}}! We value your feedback and would like to learn more about your experience.\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Take Survey\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Thank you for purchasing {{1}}! We value your feedback and would like to learn more about your experience.\",\"type\":\"BODY\"},{\"text\":\"This message is from an unverified business.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Take Survey\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:16Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"529329728105538\",\"id\":\"vzq69R4fd6ROpUMLTJoMWT\",\"language\":\"en_US\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_purchase_feedback\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(77,'wHdxFfbUUlGIl55mao74WT','update_order_3','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4  \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea.\\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4  \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T11:18:52Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"3767187663557347\",\"id\":\"wHdxFfbUUlGIl55mao74WT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:24Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"update_order_3\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(78,'XbHzvcSUn2NlhMo3jVbAWT','sample_purchase_feedback','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','id','[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Terima kasih sudah membeli {{1}}! Kami menghargai masukan Anda dan ingin mempelajari lebih lanjut terkait pengalaman Anda.\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Ikuti survei\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"IMAGE\",\"type\":\"HEADER\"},{\"text\":\"Terima kasih sudah membeli {{1}}! Kami menghargai masukan Anda dan ingin mempelajari lebih lanjut terkait pengalaman Anda.\",\"type\":\"BODY\"},{\"text\":\"Pesan ini berasal dari bisnis yang tidak terverifikasi.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Ikuti survei\",\"type\":\"URL\",\"url\":\"https:\\/\\/www.example.com\\/\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:18Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"844872546409624\",\"id\":\"XbHzvcSUn2NlhMo3jVbAWT\",\"language\":\"id\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_purchase_feedback\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(79,'yNjOWYu3WUSTjOLotLoCWT','sample_shipping_confirmation','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','pt_BR','[{\"text\":\"Seu pacote foi enviado. Ele ser\\u00e1 entregue em {{1}} dias \\u00fateis.\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}]','{\"category\":\"UTILITY\",\"components\":[{\"text\":\"Seu pacote foi enviado. Ele ser\\u00e1 entregue em {{1}} dias \\u00fateis.\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:26Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"339573467582378\",\"id\":\"yNjOWYu3WUSTjOLotLoCWT\",\"language\":\"pt_BR\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_shipping_confirmation\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(80,'zIFio9gHJ7Hqda5ICDXFWT','sample_issue_resolution','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','pt_BR','[{\"text\":\"Oi, {{1}}. N\\u00f3s conseguimos resolver o problema que voc\\u00ea estava enfrentando?\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Sim\",\"type\":\"QUICK_REPLY\"},{\"text\":\"N\\u00e3o\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"Oi, {{1}}. N\\u00f3s conseguimos resolver o problema que voc\\u00ea estava enfrentando?\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"},{\"buttons\":[{\"text\":\"Sim\",\"type\":\"QUICK_REPLY\"},{\"text\":\"N\\u00e3o\",\"type\":\"QUICK_REPLY\"}],\"type\":\"BUTTONS\"}],\"created_at\":\"2023-12-12T22:53:13Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"340823464072595\",\"id\":\"zIFio9gHJ7Hqda5ICDXFWT\",\"language\":\"pt_BR\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_issue_resolution\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(81,'zJSZGtywKw60NNB7pByuWT','sample_happy_hour_announcement','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','pt_BR','[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"O happy hour chegou! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nSeja feliz e aproveite o dia. \\ud83c\\udf89\\nLocal: {{1}}\\nHor\\u00e1rio: {{2}}\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"O happy hour chegou! \\ud83c\\udf7a\\ud83d\\ude00\\ud83c\\udf78\\nSeja feliz e aproveite o dia. \\ud83c\\udf89\\nLocal: {{1}}\\nHor\\u00e1rio: {{2}}\",\"type\":\"BODY\"},{\"text\":\"Esta mensagem \\u00e9 de uma empresa n\\u00e3o verificada.\",\"type\":\"FOOTER\"}],\"created_at\":\"2023-12-12T22:53:21Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"external_id\":\"241840033971703\",\"id\":\"zJSZGtywKw60NNB7pByuWT\",\"language\":\"pt_BR\",\"modified_at\":\"2024-09-13T12:41:26Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"sample_happy_hour_announcement\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(82,'zkvnrVuHTqY5GXw3u8hcWT','details_part3_new','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','he','[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\n\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}]','{\"category\":\"MARKETING\",\"components\":[{\"text\":\"\\u05ea\\u05d5\\u05d3\\u05d4. \\u05d0\\u05e0\\u05d5 \\u05e2\\u05d5\\u05e9\\u05d9\\u05dd \\u05db\\u05dc \\u05de\\u05d0\\u05de\\u05e5 \\u05dc\\u05e2\\u05e0\\u05d5\\u05ea \\u05dc\\u05da \\u05d1\\u05de\\u05d4\\u05d9\\u05e8\\u05d5\\u05ea \\u05d5\\u05d1\\u05d9\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05e4\\u05e0\\u05d9\\u05d9\\u05ea\\u05da \\u05ea\\u05d5\\u05e2\\u05d1\\u05e8 \\u05dc\\u05e0\\u05e6\\u05d9\\u05d2 \\u05d4\\u05e8\\u05d0\\u05e9\\u05d5\\u05df \\u05e9\\u05d9\\u05ea\\u05e4\\u05e0\\u05d4.\\n\\u05dc\\u05ea\\u05e9\\u05d5\\u05de\\u05ea \\u05dc\\u05d9\\u05d1\\u05da, \\u05dc\\u05e4\\u05e0\\u05d9\\u05d5\\u05ea \\u05e9\\u05d9\\u05ea\\u05e7\\u05d1\\u05dc\\u05d5 \\u05dc\\u05d0\\u05d7\\u05e8 \\u05d4\\u05e9\\u05e2\\u05d4 17:00, \\u05d0\\u05d5 \\u05d1\\u05d9\\u05d5\\u05dd \\u05e9\\u05d9\\u05e9\\u05d9\\/\\u05e9\\u05d1\\u05ea\\/\\u05d7\\u05d2\\u05d9\\u05dd \\u05d9\\u05e7\\u05d1\\u05dc\\u05d5 \\u05de\\u05d0\\u05d9\\u05ea\\u05e0\\u05d5 \\u05de\\u05e2\\u05e0\\u05d4 \\u05d1\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea. \\u05d4\\u05d6\\u05de\\u05e0\\u05d5\\u05ea \\u05e9\\u05d9\\u05d5\\u05d6\\u05e0\\u05d5 \\u05de\\u05d7\\u05d5\\u05e5 \\u05dc\\u05e9\\u05e2\\u05d5\\u05ea \\u05d4\\u05e4\\u05e2\\u05d9\\u05dc\\u05d5\\u05ea \\u05d9\\u05db\\u05e0\\u05e1\\u05d5 \\u05dc\\u05de\\u05e6\\u05d1 \\\"\\u05d4\\u05de\\u05ea\\u05e0\\u05d4\\\" \\u05d5\\u05d9\\u05d1\\u05d5\\u05e6\\u05e2\\u05d5 \\u05d1\\u05db\\u05e4\\u05d5\\u05e3 \\u05dc\\u05d6\\u05de\\u05d9\\u05e0\\u05d5\\u05ea \\u05d5\\u05dc\\u05dc\\u05d0 \\u05db\\u05dc \\u05d4\\u05ea\\u05d7\\u05d9\\u05d9\\u05d1\\u05d5\\u05ea.\\n\\u05ea\\u05d5\\u05d3\\u05d4 \\u05e2\\u05dc \\u05d4\\u05e1\\u05d1\\u05dc\\u05e0\\u05d5\\u05ea. \\u05d1\\u05d9\\u05db\\u05d5\\u05dc\\u05ea\\u05da \\u05dc\\u05d1\\u05e6\\u05e2 \\u05e9\\u05dc\\u05dc \\u05e4\\u05e2\\u05d5\\u05dc\\u05d5\\u05ea \\u05e0\\u05d5\\u05e1\\u05e4\\u05d5\\u05ea \\u05d1\\u05d0\\u05d5\\u05e4\\u05df \\u05e2\\u05e6\\u05de\\u05d0\\u05d9 \\u05d1\\u05d0\\u05ea\\u05e8 \\u05d4\\u05e9\\u05d9\\u05e8\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5: Maabadot.com\",\"type\":\"BODY\"}],\"created_at\":\"2024-07-18T12:08:54Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"1003613467643261\",\"id\":\"zkvnrVuHTqY5GXw3u8hcWT\",\"language\":\"he\",\"modified_at\":\"2024-09-13T12:41:23Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"details_part3_new\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}'),(83,'zn0oSU9Z4oZAOiFGaSb4WT','new_template7','32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75','en','[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/417610676_462905746198861_4557604138972017359_n.mp4?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=XIRiIzTRBSgQ7kNvgEuZfAQ&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIJ9KHLfyzLVe2_bXqqpzjMEjMXHubHoL__-CX6AC56Cn&oe=670BBB7D\"]},\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}]','{\"category\":\"MARKETING\",\"components\":[{\"example\":{\"header_handle\":[\"https:\\/\\/scontent.whatsapp.net\\/v\\/t61.29466-34\\/417610676_462905746198861_4557604138972017359_n.mp4?ccb=1-7&_nc_sid=8b1bef&_nc_ohc=XIRiIzTRBSgQ7kNvgEuZfAQ&_nc_ht=scontent.whatsapp.net&edm=AH51TzQEAAAA&oh=01_Q5AaIJ9KHLfyzLVe2_bXqqpzjMEjMXHubHoL__-CX6AC56Cn&oe=670BBB7D\"]},\"format\":\"VIDEO\",\"type\":\"HEADER\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0448\\u0430\\u0431\\u043b\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435\",\"type\":\"BODY\"},{\"text\":\"\\u043d\\u043e\\u0432\\u043e\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0444\\u0443\\u0442\\u0435\\u0440\\u0430\",\"type\":\"FOOTER\"}],\"created_at\":\"2024-04-30T13:46:50Z\",\"created_by\":{\"user_id\":\"system\",\"user_name\":\"System account\"},\"external_id\":\"462905739532195\",\"id\":\"zn0oSU9Z4oZAOiFGaSb4WT\",\"language\":\"en\",\"modified_at\":\"2024-09-13T12:41:25Z\",\"modified_by\":{\"user_id\":\"system\",\"user_name\":\"system\"},\"name\":\"new_template7\",\"namespace\":\"32b60a0b_5ef2_41cb_a3e5_d2f85c7eda75\",\"partner_id\":\"BEBD6pPA\",\"quality_score\":{\"reasons\":null,\"score\":\"UNKNOWN\"},\"rejected_reason\":\"NONE\",\"status\":\"approved\",\"updated_external\":true,\"waba_account_id\":\"4pgYNDWA\"}');
/*!40000 ALTER TABLE `whatsapp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mailbox_id` int NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `apply_to_prev` tinyint(1) NOT NULL DEFAULT '0',
  `complete` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `conditions` text COLLATE utf8mb4_unicode_ci,
  `actions` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_executions` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `workflows_mailbox_id_active_type_sort_order_index` (`mailbox_id`,`active`,`type`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-03 13:35:58
