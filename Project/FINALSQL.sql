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

/*Table structure for table `appointments` */

DROP TABLE IF EXISTS `appointments`;

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` varchar(30) DEFAULT NULL,
  `date_time` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `appointments` */

insert  into `appointments`(`appointment_id`,`doctor_id`,`patient_id`,`appointment_date`,`date_time`,`status`) values 
(1,3,1,'21545','now','appointed'),
(2,NULL,NULL,NULL,NULL,NULL),
(3,3,2,'14/3/2021','2021-03-13','appointed'),
(4,3,3,'14/3/23','2023-01-23','appointed'),
(5,4,3,'2023-04-22','2023-04-19','pending'),
(6,5,5,'2023-11-08','2023-11-07','pending');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`patient_id`,`complaint`,`reply`,`date_time`) values 
(1,1,'not good','hiii','17-02-2021'),
(2,1,'werty','sdfsdc','17-02-2021'),
(3,3,'dfdf','good','2023-04-19');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `departments` */

insert  into `departments`(`department_id`,`hospital_id`,`department_name`) values 
(4,1,'Gynaecology'),
(3,1,'ENT'),
(5,4,'dept');

/*Table structure for table `diseases` */

DROP TABLE IF EXISTS `diseases`;

CREATE TABLE `diseases` (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `symptoms` varchar(1000) DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `diseases` */

insert  into `diseases`(`disease_id`,`doctor_id`,`title`,`description`,`symptoms`,`date_time`) values 
(1,1,'fever','pani','chuma','12-09-2020'),
(2,3,'vfever','hgbnb','nvgjh','2021-02-10'),
(3,1,'adasd','jhgj ghfgh','gfh','2023-04-20'),
(4,3,'I had just masterbated with an','gh','gfh','2023-04-27'),
(5,0,'corona','','high fever','2023-09-22'),
(6,0,'corona','knk','high fever','2023-09-22'),
(7,0,'Viral Fever ','The increase in bodily temperature due to the infection caused by the virus falls into the category of viral fever. These small ubiquitous microorganisms, the virus, usually range from a few hundred nanometres in size.','tiredness,weakness,Fatigue ,Higher Body temperature,Coughing, sneezing,Contaminated food or water,','2023-11-08'),
(8,0,'Asthma attack','An asthma attack is a sudden worsening of asthma symptoms. Asthma is a long-term condition that makes breathing difficult because airways in the lungs become narrow. Symptoms of asthma attack include coughing, wheezing, tightness in the chest and difficulty getting enough air.','Difficulty speaking,Gasping for breath.,Wheezing,Shortness of breath,Chest tightness, pain,Coughing.','2023-12-08');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

insert  into `doctor`(`doctor_id`,`login_id`,`department_id`,`first_name`,`last_name`,`place`,`phone`,`email`,`qualification`) values 
(1,3,1,'vijay','t','kochi','9898927','vijay@gmail.com','mbbs'),
(2,5,2,'alli','oo','kolam','978787','aok@gmail.com','mbbs'),
(3,6,2,'amal','ganesh','alappuzha','7484623736','amal@gmail.com','mbbs'),
(4,13,4,'Anjuu','mary','kochi','09812345679','anju@gmail.com','MBBS'),
(5,19,5,'sam kutty','kutty','pudukkad','78945612589','sam@gmail.com','mbddd');

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
  `email` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `hospitals` */

insert  into `hospitals`(`hospital_id`,`login_id`,`hospital_name`,`place`,`landmark`,`latitiude`,`longitude`,`phone`,`email`,`status`) values 
(1,2,'ad','sda','sda','sd','dd','saq','da@fbd.com','approved'),
(2,7,'st mary','ernakulam','near kollam','0805667','3456','878787','allu@gmail.com','approved'),
(3,14,'','','','','','','','approved'),
(4,17,'saran','defww','deewdwe','9.977760160080486','76.2777318464966','9874561236','sdfgh@fgh','approved');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values 
(1,'admin','admin','admin'),
(2,'hospital','hospital','hospital'),
(3,'doctor','doctor','doctor'),
(4,'%s','%s','%s'),
(5,'doctor','doctor','doctor'),
(6,'amal','amal','doctor'),
(7,'hospital1','hospital1','hospital'),
(9,'Jj','jj','patient'),
(12,'Anju@123','Anju@123','patient'),
(13,'Anjuz@56','Anjuz@56','doctor'),
(14,'','','hospital'),
(15,'u','u','user'),
(16,'zz','zz','patient'),
(17,'hos','hos','hospital'),
(19,'samd','samd','doctor');

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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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
(32,5,5,'doctor','static/uploads/347d3b8a-ddce-4ece-970c-1f2dc6f3cdb9hr.jpg','2023-11-07 13:49:20');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `messages` */

insert  into `messages`(`message_id`,`sender_id`,`sender_type`,`receiver_id`,`receiver_type`,`message`,`date_time`) values 
(1,9,'',6,'','Hdhdg','2021-03-16'),
(2,9,'',6,'','Ufgugffftg','2021-03-16'),
(3,6,NULL,9,NULL,'hh','2021-03-16'),
(4,1,'patient',9,'doctor','hii','2023-04-18 22:55:46'),
(5,12,'doctor',3,'patient','jjj','2023-04-19 06:30:52'),
(6,3,'patient',12,'doctor','jjjjj','2023-04-19 06:30:52'),
(7,16,'doctor',19,'patient','hao doctor','2023-11-07 13:47:29');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `patients` */

insert  into `patients`(`patient_id`,`login_id`,`first_name`,`last_name`,`dob`,`gender`,`place`,`phone`,`email`) values 
(1,NULL,'allu','p','30/07/1999','male','kollam','6238808286','alexp@gmail.com'),
(2,'9','Dgd','Jfd','13/3/2021','Male','Bdhd','9688527415','Xhxh@jdjd.djd'),
(3,'12','Anjuu','mary','2020-02-18','Female','kochi','09812345679','anju@gmail.com'),
(4,'15','sam','g','24/11/2023','Male','kolam','987456210','sh@gmail.com'),
(5,'16','sam','anu','2023-11-08','Male','kolam','9874561236','sd@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `prescription` */

insert  into `prescription`(`prescription_id`,`appointment_id`,`prescription`,`date`) values 
(1,1,'ty','2023-04-18 23:18:04'),
(2,6,'ddewdeeferfer','2023-11-07 13:48:27');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `rate` varchar(100) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

insert  into `rating`(`rating_id`,`patient_id`,`rate`,`doctor_id`) values 
(1,3,'Good',3),
(2,3,'Good',3),
(3,3,'Good',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `scheduling` */

insert  into `scheduling`(`scheduling_id`,`doctor_id`,`ftime`,`ttime`) values 
(1,4,'09:30','04:50'),
(2,4,'07:30','10:30'),
(3,3,'07:30','10:30'),
(4,5,'13:48','18:46');

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
