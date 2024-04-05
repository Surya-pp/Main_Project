/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - keep_in_touch
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`keep_in_touch` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `keep_in_touch`;

/*Table structure for table `ambulance` */

DROP TABLE IF EXISTS `ambulance`;

CREATE TABLE `ambulance` (
  `Ambulance_id` int(11) NOT NULL AUTO_INCREMENT,
  `Hospital_id` int(11) DEFAULT NULL,
  `Ambulance` varchar(100) DEFAULT NULL,
  `Details` varchar(100) DEFAULT NULL,
  `Phone` varchar(100) DEFAULT NULL,
  `Regnum` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Ambulance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ambulance` */

insert  into `ambulance`(`Ambulance_id`,`Hospital_id`,`Ambulance`,`Details`,`Phone`,`Regnum`) values 
(2,8,'sbar','knkkmmmm','9867548692','555599');

/*Table structure for table `appointments` */

DROP TABLE IF EXISTS `appointments`;

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` varchar(30) DEFAULT NULL,
  `date_time` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `appointments` */

insert  into `appointments`(`appointment_id`,`doctor_id`,`patient_id`,`appointment_date`,`date_time`,`status`,`amount`) values 
(1,3,1,'21545','now','appointed',NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL),
(3,3,2,'14/3/2021','2021-03-13','appointed',NULL),
(4,3,3,'14/3/23','2023-01-23','appointed',NULL),
(5,4,3,'2023-04-22','2023-04-19','pending',NULL),
(6,11,7,'2023-11-08','2023-11-07','cancelled','503'),
(13,12,7,'08/24','2024-01-15','appointed','0'),
(7,10,7,'23/12/2023','2023-12-21','pending','0'),
(8,11,7,'28/12/2023','2023-12-21','pending','0'),
(9,9,7,'30/12/2023','2023-12-28','pending','1'),
(10,6,7,'29/12/2023','2023-12-28','pending','0'),
(11,6,7,'29/12/2023','2023-12-28','pending','100'),
(12,12,7,'20/1/2024','2024-01-12','paid','500'),
(14,13,7,'01/28','2024-01-20','pending','0');

/*Table structure for table `blooddonation` */

DROP TABLE IF EXISTS `blooddonation`;

CREATE TABLE `blooddonation` (
  `blooddonation_id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `fromtime` varchar(100) DEFAULT NULL,
  `tofrom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`blooddonation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `blooddonation` */

insert  into `blooddonation`(`blooddonation_id`,`place`,`date`,`fromtime`,`tofrom`) values 
(1,'kochi','2024-01-20','23:56','13:59'),
(2,'kochi','2023-12-29','19:50','07:50'),
(23,'thayineri','2023-01-11','00:58','12:01'),
(5,'nnm','2024-01-23','05:06','04:05'),
(6,'nnm','2024-01-19','19:56','21:58'),
(7,'kkk','2024-01-25','04:53','04:53'),
(8,'kkk','2024-01-25','04:53','04:53'),
(13,'kochi','2023-12-21','23:56','07:08'),
(10,'kkk','2024-01-25','04:53','04:53'),
(11,'kochi','2023-12-21','23:56','13:02'),
(12,'kkk','2024-01-25','04:53','08:56'),
(16,'kochiiiii','2023-12-21','23:56','13:02'),
(19,'tvm','2024-01-31','20:56','23:55'),
(17,'kochiiiii','2023-12-21','23:56','13:02'),
(20,'tvm','2024-01-31','20:56','23:55');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category`) values 
(2,'Bags'),
(3,'Vehicles '),
(5,'Jdjdj'),
(7,'Fan'),
(8,'Girl');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `complaint` varchar(30) DEFAULT NULL,
  `reply` varchar(30) DEFAULT NULL,
  `date_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`patient_id`,`complaint`,`reply`,`date_time`) values 
(1,1,'not good','hiii','17-02-2021'),
(2,1,'werty','sdfsdc','17-02-2021'),
(3,3,'dfdf','good','2023-04-19'),
(17,7,'good hospitality ','pending','2024-01-20'),
(16,7,'yyyy','ok','2024-01-15'),
(6,7,'dghj','jjj','2023-12-20'),
(15,7,'ghuhbbh','fffff','2024-01-15'),
(8,7,'ningal poraaa','YYY','2023-12-20'),
(14,7,'fggh','pending','2024-01-14'),
(13,7,'hrrygv','jnjn','2023-12-28'),
(12,7,'cvh','ggg','2023-12-28');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `departments` */

insert  into `departments`(`department_id`,`hospital_id`,`department_name`) values 
(4,1,'Gynaecology'),
(3,1,'ENT'),
(5,4,'dept'),
(6,7,'ent'),
(7,7,'Gynaecology');

/*Table structure for table `diseases` */

DROP TABLE IF EXISTS `diseases`;

CREATE TABLE `diseases` (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `diseases` */

insert  into `diseases`(`disease_id`,`title`,`description`) values 
(18,'FEVER','XGFHGJHJH'),
(28,'dengue','body pain'),
(38,'fever','fcvbhjkl;'),
(39,'diahera','ttt\r\n\r\n'),
(35,'fever','headache\r\ngghjk'),
(36,'fever','headache'),
(37,'gvvgv','hbhb'),
(34,'fever','lightliy'),
(26,'dengue','body pain'),
(24,'dengue','body pain'),
(25,'dengue','body pain'),
(22,'dengue','jjjj');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

insert  into `doctor`(`doctor_id`,`login_id`,`hospital_id`,`first_name`,`last_name`,`place`,`phone`,`email`,`image`,`qualification`,`department`) values 
(11,34,9,'malu','mhh','tvm','9874561230','ii@qq',NULL,'MBBStt',NULL),
(13,49,8,'malu','mhh','tvm','9874561230','ii@qq','static/images/93b188b0-8905-4486-8358-87368284c95fteam-6.jpg','MBBStt',NULL),
(12,47,8,'malu','mhh','tvm','9874561230','ii@qq','static/images/62065f79-9cf4-4131-a6c6-127993bea6b2team-4.jpg','MBBStt',NULL),
(14,52,8,'malu','mhh','tvm','9874561230','ii@qq','static/images/3a4c3a37-ee6d-4b59-a08d-51a3eb3b0162testimonials-3.jpg','MBBStt',NULL),
(15,53,8,'malu','mhh','tvm','9874561230','ii@qq','static/images/f1d8a2b2-d516-4793-b148-1daab6c233cctestimonials-2.jpg','MBBS',NULL),
(20,62,7,'Minashi','m','vayatila','6998759985','ee@e','static/images/5b27f1a2-a935-4ff3-9bf6-935b18135f0etestimonials-2.jpg','MBBS','department_name');

/*Table structure for table `duplicates` */

DROP TABLE IF EXISTS `duplicates`;

CREATE TABLE `duplicates` (
  `duplicate_id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_record_id` int(11) DEFAULT NULL,
  `fpath` varchar(1000) DEFAULT NULL,
  `dfile` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`duplicate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `duplicates` */

insert  into `duplicates`(`duplicate_id`,`medical_record_id`,`fpath`,`dfile`) values 
(1,8,'static/duplicates/e15307fd-0115-4294-8cab-0d769f75e1b6.jpg','static/duplicates/024f26d5-27c1-450e-9336-82a267a51330.jpg');

/*Table structure for table `hospitals` */

DROP TABLE IF EXISTS `hospitals`;

CREATE TABLE `hospitals` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `hospital_name` varchar(30) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `landmark` varchar(30) DEFAULT NULL,
  `latitiude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `hospitals` */

insert  into `hospitals`(`hospital_id`,`login_id`,`hospital_name`,`place`,`landmark`,`latitiude`,`longitude`,`phone`,`email`,`image`,`status`) values 
(12,51,'arya','palakad','new bus stand kannur','10.000345802107944','76.28303329132795','6984466336','ee@e','static/images/e7bf29ce-528f-48de-9c2d-4b5add0faa0ahosp.jpg','approved'),
(7,23,'lesi','kannur','new bus stand kannur','9.983482697083675','76.28404040209962','9090976554','thayineri@gmail.com',NULL,'rejected'),
(8,25,'ann marya','thrissur','new bus stand kannur','9.583801266382835','76.51918901139315','9874561230','ee@e',NULL,'approved'),
(11,46,'lili','dd','jn','9.981538477803893','76.29004855029298','6998759985','oo','static/images/1273113c-ed59-4d2f-b5ea-19ad5fe32b80bussiness.jpg','approved');

/*Table structure for table `lab` */

DROP TABLE IF EXISTS `lab`;

CREATE TABLE `lab` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `lab` */

insert  into `lab`(`lab_id`,`hospital_id`,`name`,`details`) values 
(5,8,'hgvv','gvgddd'),
(4,8,'kakmkjn','lluuuuuu');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values 
(1,'admin','admin','admin'),
(4,'%s','%s','%s'),
(15,'u','u','patient'),
(16,'zz','zz','patient'),
(23,'lesia','Saba223','pending'),
(25,'a','12','hospital'),
(34,'ashwin','Ash12345','doctor'),
(35,'u','u','user'),
(36,'o','o','patient'),
(39,'akhii','Asdf123','patient'),
(40,'pp','00','pharmacy'),
(41,'ph','ph','pharmacy'),
(42,'Krishna','Kkk1234','pending'),
(43,'ikiki','Kaaaa112','pending'),
(44,'Kkk','KKjj123','pending'),
(45,'ann','Kkk1233','pending'),
(46,'ann','Kkk1233','hospital'),
(47,'Akh','Ahkil123','doctor'),
(48,'nnnn','uuu','patient'),
(49,'malavika','Mala12344','doctor'),
(51,'Krishna','Krishn1233','hospital'),
(52,'Kavya','Kavy1234','doctor'),
(53,'malu','Malu1234','doctor'),
(54,'gggg','@AWeee12','patient'),
(62,'Minauu','MinUU@123','doctor');

/*Table structure for table `medical_records` */

DROP TABLE IF EXISTS `medical_records`;

CREATE TABLE `medical_records` (
  `medical_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `uploaded_by` varchar(30) DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL,
  `date_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`medical_record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `medical_records` */

insert  into `medical_records`(`medical_record_id`,`patient_id`,`doctor_id`,`uploaded_by`,`file`,`date_time`) values 
(25,2,3,'doctor','static/uploads/fe68f0d4-8767-48a8-91a6-478455c34f3ajagua.jpg','2021-09-17 11:34:38'),
(24,2,3,'doctor','static/uploads/d14bce9d-053e-4230-8bd4-6a2ec4e31b26jagua.jpg','2021-09-17 11:24:55'),
(23,2,3,'doctor','static/uploads/7cd10247-4946-4522-b224-1c39f9cac221hawthorn.jpg','2021-09-17 10:39:30'),
(22,1,3,'doctor','static/uploads/1797a845-823b-46b8-9662-ed5acf9294dajagua.jpg','2021-09-17 10:18:34'),
(26,1,3,'doctor','static/uploads/ff3ea93f-1db1-4acb-8baf-8a078263b50dACTIVITY_DIAGRAM_USER.png','2023-04-18 23:11:02'),
(27,3,1,'doctor','static/uploads/c61acd82-80cc-40e6-8645-894bfd3b1551ACTIVITY_DIAGRAM_USER.png','2023-04-19 06:45:01'),
(28,2,1,'doctor','static/uploads/24f2d319-9009-4b37-99c8-0febefb0855fPYTHON.docx','2023-11-07 13:34:30'),
(29,2,4,'doctor','static/uploads/54edbe22-1790-43e7-9498-bb66380c2ecfPYTHON.docx','2023-11-07 13:35:03'),
(30,5,5,'doctor','static/uploads/fda47bbc-c020-40fe-846b-4d3ee45e09ebPYTHON.docx','2023-11-07 13:41:42'),
(31,5,5,'doctor','static/uploads/8345b1c6-d4b2-4bb4-a441-58d568958581NANDHANA M R.pdf','2023-11-07 13:48:47'),
(32,5,5,'doctor','static/uploads/347d3b8a-ddce-4ece-970c-1f2dc6f3cdb9hr.jpg','2023-11-07 13:49:20'),
(33,5,11,'doctor','static/uploads/a74280dc-3869-4133-a142-098f61eb79feDesign1 rough (1).pdf','2023-12-18 17:53:44'),
(34,5,11,'doctor','static/uploads/d1651c28-9c77-4137-b856-aab644bd700d','2023-12-18 17:55:04'),
(35,5,11,'doctor','static/uploads/2ce647bb-9c63-4b7a-8eae-cb80e2f57c4e','2023-12-18 17:56:02'),
(36,5,11,'doctor','static/uploads/76ab3908-fa17-44cf-bc51-c91b140f6e9e','2023-12-18 17:58:00'),
(37,5,11,'doctor','static/uploads/f653ba34-14b3-428f-96bb-9f0ef82e18e7','2023-12-18 17:58:18'),
(38,7,0,'doctor','static/uploads/2ced7389-b013-474c-83c6-37f5d003fb2aabc.jpg','2023-12-22 14:16:38'),
(39,7,0,'doctor','static/uploads/b728e4af-2f66-498f-9569-4c0dcdbdc8a2abc.jpg','2023-12-22 14:20:04'),
(40,7,0,'doctor','static/uploads/7e29740b-6bca-4887-9c96-2ace7446169eabc.jpg','2023-12-22 17:03:29'),
(41,7,11,'doctor','static/uploads/138cda66-e406-4e86-811a-b282c2d1dcc3Review (1).java','2023-12-28 13:30:07'),
(42,7,0,'doctor','static/uploads/6746ce9d-a742-428a-98f0-7a7eee5138e9abc.jpg','2023-12-28 13:52:48'),
(43,7,12,'doctor','static/uploads/f6e5eb4e-6c08-48b7-a732-bb5225038a4amedi-removebg-preview.png','2024-01-13 15:20:55'),
(44,7,0,'doctor','static/uploads/bd76c242-0e4a-4733-88c0-8b101cab1909abc.jpg','2024-01-13 16:28:37'),
(45,7,0,'doctor','static/uploads/e069f81b-7a2c-493d-9f99-70a5038f3eddabc.jpg','2024-01-13 16:30:40'),
(46,7,0,'doctor','static/uploads/c8ad542d-d9d7-4515-a011-e70f309ea704abc.jpg','2024-01-13 16:41:47'),
(47,7,0,'doctor','static/uploads/f03befec-993a-4725-9a1c-4b9dfafab4d1abc.jpg','2024-01-15 13:45:12'),
(48,7,11,'doctor','static/uploads/8494460b-c364-407e-8275-7c31eed7c28eFarmers App - Modules and Tables.pdf','2024-01-18 18:29:27'),
(49,7,0,'doctor','static/uploads/7f72bf72-29ea-43be-94b4-50ddad8f2d48abc.jpg','2024-01-20 14:10:30');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` varchar(30) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(30) DEFAULT NULL,
  `message` varchar(30) DEFAULT NULL,
  `date_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `messages` */

insert  into `messages`(`message_id`,`sender_id`,`sender_type`,`receiver_id`,`receiver_type`,`message`,`date_time`) values 
(1,34,'patient',36,'doctor','hai appu','2023-12-21 17:35:56'),
(2,36,'',34,'','hii','2023-12-21'),
(3,34,'patient',36,'doctor','dsmncdscvdbn','2023-12-21 17:39:28'),
(4,34,'patient',9,'doctor','hhh','2023-12-28 13:27:18'),
(5,34,'patient',36,'doctor','jjj','2023-12-28 13:29:23'),
(6,36,'',34,'','hj','2023-12-28'),
(7,36,'',34,'','gff','2023-12-28'),
(8,36,'',34,'','ert','2023-12-28'),
(9,36,'',47,'','jj','2024-01-12'),
(10,36,'',47,'','hhh','2024-01-12'),
(11,36,'',47,'','tff','2024-01-12'),
(12,36,'',47,'','tff','2024-01-12'),
(13,36,'',47,'','ty','2024-01-12'),
(14,36,'',47,'','ho','2024-01-12'),
(15,36,'',47,'','ghj','2024-01-12'),
(16,47,'patient',9,'doctor','jjjj','2024-01-13 14:52:12'),
(17,36,'',49,'','hy','2024-01-15'),
(18,34,'patient',12,'doctor','jjjj','2024-01-18 18:29:08'),
(19,34,'patient',48,'doctor','hi','2024-01-18 20:25:19'),
(20,49,'patient',16,'doctor','kkk','2024-01-20 11:13:10');

/*Table structure for table `patients` */

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `patients` */

insert  into `patients`(`patient_id`,`login_id`,`first_name`,`last_name`,`dob`,`gender`,`place`,`phone`,`email`) values 
(1,NULL,'allu','p','30/07/1999','male','kollam','6238808286','alexp@gmail.com'),
(5,'16','sam','anu','2023-11-08','Male','kolam','9874561236','sd@gmail.com'),
(7,'36','sumith','kp','2023-12-28','Female','thrissur','9867548692','ji@ww'),
(9,'39','akhila','cs','13/1/2004','Female','ottapalam','1245678901','gd@gmail.com'),
(11,'50','SNEHA N.G','SNEHA N.G','15/1/2024','Male','otp','231456','ngsneha2000@gmail.com'),
(12,'54','kukku','y','05/23','Male','tvm','56667889084','jjj@gmail.com');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`appointment_id`,`amount`,`type`,`date`) values 
(1,6,'500',NULL,'2023-12-27'),
(2,6,'500',NULL,'2023-12-27'),
(3,6,'500',NULL,'2023-12-27'),
(4,6,'500',NULL,'2023-12-27'),
(5,6,'500',NULL,'2023-12-27'),
(6,6,'500',NULL,'2023-12-27'),
(7,6,'500',NULL,'2023-12-27'),
(8,6,'500',NULL,'2023-12-27'),
(9,8,'100',NULL,'2023-12-27'),
(10,8,'100',NULL,'2023-12-27'),
(11,6,'500',NULL,'2023-12-27'),
(12,1,'500','request','2023-12-28'),
(13,6,'500','pharmacyfee','2024-01-03'),
(14,6,'500','doctorfee','2024-01-12'),
(15,6,'522','pharmacyfee','2024-01-19'),
(16,6,'522','pharmacyfee','2024-01-19'),
(17,6,'522','pharmacyfee','2024-01-20');

/*Table structure for table `pharmacy` */

DROP TABLE IF EXISTS `pharmacy`;

CREATE TABLE `pharmacy` (
  `pharmacy_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pharmacy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `pharmacy` */

insert  into `pharmacy`(`pharmacy_id`,`login_id`,`name`,`place`,`landmark`,`phone`,`email`) values 
(1,40,'Krishna','thrissur','gandhi park','6998759985','ji@ww');

/*Table structure for table `predict` */

DROP TABLE IF EXISTS `predict`;

CREATE TABLE `predict` (
  `predict_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`predict_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `predict` */

/*Table structure for table `prescription` */

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) DEFAULT NULL,
  `prescription` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prescription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `prescription` */

insert  into `prescription`(`prescription_id`,`appointment_id`,`prescription`,`date`) values 
(1,1,'ty','2023-04-18 23:18:04'),
(2,6,'mijijiji','2023-12-19 09:12:16'),
(4,8,'ihujij','2023-12-25 21:18:08'),
(7,12,'nnnn','2024-01-13 15:31:49'),
(9,6,'jjj','2024-01-18 20:10:31'),
(10,6,'mijijijijjyy','2024-01-18 20:24:53');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `rate` varchar(100) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `Review` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

insert  into `rating`(`rating_id`,`patient_id`,`rate`,`doctor_id`,`Review`) values 
(6,7,'3.0',9,'super'),
(7,7,'4.0',10,'wooowww'),
(8,7,'4.0',11,'wooww'),
(9,7,'4.0',13,'good');

/*Table structure for table `request1` */

DROP TABLE IF EXISTS `request1`;

CREATE TABLE `request1` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `request1` */

insert  into `request1`(`request_id`,`prescription_id`,`pharmacy_id`,`amount`,`date`,`status`) values 
(2,2,1,'0','curdate()','pending'),
(4,2,1,'522','curdate()','paid'),
(5,2,1,'0','2024-01-02','pending');

/*Table structure for table `requests` */

DROP TABLE IF EXISTS `requests`;

CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_record_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `date_times` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `requests` */

insert  into `requests`(`request_id`,`medical_record_id`,`doctor_id`,`date_times`,`status`) values 
(4,2,3,'2021-03-16','pending'),
(3,2,3,'2021-03-16','pending'),
(5,3,3,'2021-03-16','Accepted'),
(6,10,3,'2021-09-16','pending');

/*Table structure for table `scheduling` */

DROP TABLE IF EXISTS `scheduling`;

CREATE TABLE `scheduling` (
  `scheduling_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `ftime` varchar(50) DEFAULT NULL,
  `ttime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`scheduling_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `scheduling` */

insert  into `scheduling`(`scheduling_id`,`doctor_id`,`ftime`,`ttime`) values 
(2,4,'07:30','10:30'),
(3,3,'07:30','10:30'),
(4,5,'13:48','18:46'),
(7,9,'16:15','08:24'),
(9,9,'08:15','22:28'),
(10,10,'10:25','14:25'),
(11,11,'18:47','23:47'),
(12,12,'23:32','13:32');

/*Table structure for table `symptoms` */

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `symptoms_id` int(11) NOT NULL AUTO_INCREMENT,
  `disease_id` int(11) DEFAULT NULL,
  `symptoms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`symptoms_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `symptoms` */

insert  into `symptoms`(`symptoms_id`,`disease_id`,`symptoms`) values 
(1,7,'ooppoopo'),
(6,9,'uuo'),
(5,9,'uuo'),
(12,12,'stoolppp'),
(16,16,'headache and coldS'),
(10,12,'pp'),
(18,13,'jnn'),
(19,13,'jjj'),
(20,16,'ddd'),
(22,15,'jjjj'),
(23,15,'jjjj'),
(25,5,'nfj'),
(26,5,'nfj'),
(27,5,'nfj'),
(28,5,'nfj'),
(29,21,'stool'),
(30,21,'stool'),
(31,21,'stool'),
(32,21,'stool'),
(33,28,'uuuu'),
(34,28,'uuuu'),
(37,39,'jjj');

/*Table structure for table `user_reg` */

DROP TABLE IF EXISTS `user_reg`;

CREATE TABLE `user_reg` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user_reg` */

insert  into `user_reg`(`user_id`,`fname`,`image`) values 
(1,'Durga','static/847c36d7-482c-4b41-93b3-5c7f0359c1071699612619769.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
