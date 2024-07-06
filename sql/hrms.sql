/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - hrms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hrms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `hrms`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `PersonId` int(11) NOT NULL,
  `HotelId` int(11) NOT NULL,
  UNIQUE KEY `PersonId` (`PersonId`),
  KEY `HotelId` (`HotelId`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`) ON DELETE CASCADE,
  CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`HotelId`) REFERENCES `hotel` (`HotelId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `admin` */

insert  into `admin`(`PersonId`,`HotelId`) values 
(2,1),
(4,2);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(255) DEFAULT NULL,
  `CustomerUsername` varchar(255) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','F','O')),
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `CustomerPassword` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `customer` */

insert  into `customer`(`CustomerId`,`Address`,`CustomerUsername`,`Gender`,`Phone`,`Email`,`CustomerPassword`,`MiddleName`,`FirstName`,`LastName`) values 
(1,'2345 Oak St, Somewhere','emily89','F','2345678901','emily89@email.com','e99a18c428cb38d5f260853678922e03','Rose','Emily','Johnson'),
(2,'4567 Maple St, Anytown','mike123','M','2345678902','mike123@email.com','adc83b19e793491b1c6ea0fd8b46cd9f32e592fc',NULL,'Michael','Brown'),
(3,'7890 Pine St, Here','clara2024','F','2345678903','clara2024@email.com','d8578edf8458ce06fbc5bb76a58c5ca4',NULL,'Clara','Wilson'),
(4,'1234 Elm St, Nowhere','dave55','M','2345678904','dave55@email.com','5d41402abc4b2a76b9719d911017c592','L','David','Smith'),
(5,'5678 Cedar St, Everywhere','sarah99','F','2345678905','sarah99@email.com','1f3870be274f6c49b3e31a0c6728957f',NULL,'Sarah','Green');

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `HotelName` varchar(255) NOT NULL,
  `HotelId` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(255) NOT NULL,
  `ContactInfo` varchar(15) NOT NULL,
  `StarRating` decimal(2,1) DEFAULT NULL CHECK (`StarRating` between 1 and 5),
  PRIMARY KEY (`HotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hotel` */

insert  into `hotel`(`HotelName`,`HotelId`,`Location`,`ContactInfo`,`StarRating`) values 
('Grand Plaza',1,'1234 Central Ave, Metropolis','1800123456',5.0),
('Sea Breeze Resort',2,'5678 Coastal Rd, Baytown','1800123457',4.0),
('Mountain Retreat',3,'9012 Hill St, Highland','1800123458',3.5),
('Urban Hotel',4,'3456 City Blvd, Downtown','1800123459',4.5),
('Lakeside Inn',5,'7890 Lake Rd, Lakeview','1800123460',4.0);

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `PersonId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','F','O')),
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Role` varchar(255) NOT NULL,
  PRIMARY KEY (`PersonId`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `person` */

insert  into `person`(`PersonId`,`FirstName`,`MiddleName`,`LastName`,`Username`,`Password`,`Gender`,`ContactNumber`,`Role`) values 
(1,'John','Quincy','Doe','johndoe','e99a18c428cb38d5f260853678922e03','M','1234567890','Receptionist'),
(2,'Jane',NULL,'Doe','janedoe','adc83b19e793491b1c6ea0fd8b46cd9f32e592fc','F','1234567891','Admin'),
(3,'Alice','Mary','Smith','alicesmith','d8578edf8458ce06fbc5bb76a58c5ca4','F','1234567892','Receptionist'),
(4,'Bob',NULL,'Brown','bobbrown','5d41402abc4b2a76b9719d911017c592','M','1234567893','Admin'),
(5,'Charlie',NULL,'Green','charliegreen','1f3870be274f6c49b3e31a0c6728957f','O','1234567894','Receptionist');

/*Table structure for table `receptionist` */

DROP TABLE IF EXISTS `receptionist`;

CREATE TABLE `receptionist` (
  `PersonId` int(11) NOT NULL,
  `AdminId` int(11) NOT NULL,
  UNIQUE KEY `PersonId` (`PersonId`),
  KEY `AdminId` (`AdminId`),
  CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`) ON DELETE CASCADE,
  CONSTRAINT `receptionist_ibfk_2` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`PersonId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `receptionist` */

insert  into `receptionist`(`PersonId`,`AdminId`) values 
(1,2),
(3,2),
(5,4);

/*Table structure for table `reservation` */

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `ReservationId` int(11) NOT NULL AUTO_INCREMENT,
  `ReceptionistId` int(11) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `BookingStatus` varchar(255) NOT NULL CHECK (`BookingStatus` in ('Confirmed','Cancelled','Pending')),
  `BookingSource` varchar(255) DEFAULT NULL,
  `RoomNo` int(11) DEFAULT NULL,
  `Building` varchar(255) DEFAULT NULL,
  `CheckInDate` date NOT NULL,
  `ReservationDate` date DEFAULT curdate(),
  `CheckOutDate` date DEFAULT NULL,
  PRIMARY KEY (`ReservationId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `RoomNo` (`RoomNo`,`Building`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`RoomNo`, `Building`) REFERENCES `room` (`RoomNo`, `Building`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `reservation` */

insert  into `reservation`(`ReservationId`,`ReceptionistId`,`CustomerId`,`BookingStatus`,`BookingSource`,`RoomNo`,`Building`,`CheckInDate`,`ReservationDate`,`CheckOutDate`) values 
(6,1,1,'Confirmed','Online',101,'A','2024-06-15','2024-05-17','2024-06-20'),
(7,3,2,'Confirmed','Direct',102,'A','2024-07-01','2024-05-17','2024-07-05'),
(8,1,3,'Pending','Online',201,'B','2024-08-10','2024-05-17','2024-08-15'),
(9,3,4,'Cancelled','Agency',202,'B','2024-09-05','2024-05-17','2024-09-10'),
(10,5,5,'Confirmed','Direct',301,'C','2024-10-01','2024-05-17','2024-10-05');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `RoomNo` int(11) NOT NULL,
  `HotelId` int(11) DEFAULT NULL,
  `receptionistid` int(11) DEFAULT NULL,
  `Building` varchar(255) NOT NULL,
  `RoomType` varchar(255) NOT NULL,
  PRIMARY KEY (`RoomNo`,`Building`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room` */

insert  into `room`(`RoomNo`,`HotelId`,`receptionistid`,`Building`,`RoomType`) values 
(101,1,NULL,'A','Deluxe'),
(102,1,NULL,'A','Standard'),
(201,2,NULL,'B','Suite'),
(202,2,NULL,'B','Standard'),
(301,3,NULL,'C','Deluxe');

/*Table structure for table `roomfeatures` */

DROP TABLE IF EXISTS `roomfeatures`;

CREATE TABLE `roomfeatures` (
  `RoomName` varchar(50) NOT NULL,
  `RoomPrice` decimal(10,2) NOT NULL,
  `RoomSize` varchar(50) DEFAULT NULL,
  `B&B` char(5) DEFAULT NULL CHECK (`B&B` in ('Yes','No')),
  `Availability` varchar(50) NOT NULL CHECK (`Availability` in ('Available','Booked','Maintenance')),
  `ViewType` varchar(50) DEFAULT NULL,
  `BathroomType` varchar(20) DEFAULT NULL,
  `SmokingNonSmoking` char(1) DEFAULT NULL CHECK (`SmokingNonSmoking` in ('S','N')),
  `ACNonAC` char(1) DEFAULT NULL CHECK (`ACNonAC` in ('A','N')),
  `BedType` varchar(50) NOT NULL,
  `RoomNo` int(11) NOT NULL,
  `Building` varchar(255) NOT NULL,
  UNIQUE KEY `RoomNo` (`RoomNo`,`Building`),
  CONSTRAINT `roomfeatures_ibfk_1` FOREIGN KEY (`RoomNo`, `Building`) REFERENCES `room` (`RoomNo`, `Building`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roomfeatures` */

insert  into `roomfeatures`(`RoomName`,`RoomPrice`,`RoomSize`,`B&B`,`Availability`,`ViewType`,`BathroomType`,`SmokingNonSmoking`,`ACNonAC`,`BedType`,`RoomNo`,`Building`) values 
('Deluxe King',130.00,'Large','Yes','Available','City','Ensuite','N','A','King',101,'A'),
('Standard Queen',100.00,'Medium','No','Booked','Garden','Shared','N','N','Queen',102,'A'),
('Presidential Suite',300.00,'Extra Large','Yes','Available','Panoramic','Ensuite','N','A','King',201,'B'),
('Standard Twin',90.00,'Medium','No','Booked','None','Shared','S','N','Twin',202,'B'),
('Deluxe Double',150.00,'Large','Yes','Maintenance','Lake','Ensuite','N','A','Double',301,'C');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL AUTO_INCREMENT,
  `ReservationId` int(11) NOT NULL,
  `PaymentMethod` varchar(255) NOT NULL CHECK (`PaymentMethod` in ('Credit Card','Debit Card','Cash','Online')),
  `Amount` decimal(10,2) NOT NULL,
  `TransactionType` varchar(255) NOT NULL CHECK (`TransactionType` in ('Booking','Refund','Amendment')),
  `TransactionStatus` varchar(255) NOT NULL CHECK (`TransactionStatus` in ('Pending','Completed','Failed')),
  `DateAndTime` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`TransactionId`),
  KEY `ReservationId` (`ReservationId`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`ReservationId`) REFERENCES `reservation` (`ReservationId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaction` */

insert  into `transaction`(`TransactionId`,`ReservationId`,`PaymentMethod`,`Amount`,`TransactionType`,`TransactionStatus`,`DateAndTime`) values 
(11,6,'Credit Card',500.00,'Booking','Completed','2024-06-01 12:00:00'),
(12,7,'Debit Card',300.00,'Booking','Completed','2024-07-01 14:30:00'),
(13,8,'Online',400.00,'Booking','Pending','2024-08-10 10:15:00'),
(14,9,'Cash',200.00,'Refund','Completed','2024-09-06 09:00:00'),
(15,10,'Credit Card',600.00,'Booking','Completed','2024-10-01 11:45:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
