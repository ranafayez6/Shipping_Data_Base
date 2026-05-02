Create database shipingDB;
use shipingDB;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    RegistrationDate DATE
);

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    LicenseNumber VARCHAR(50),
    DateOfBirth DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE ShipmentStatus (
    StatusID INT PRIMARY KEY,
    StatusName VARCHAR(50) NOT NULL,
    SequenceOrder INT,
    Description VARCHAR(255)
);

CREATE TABLE Shipment (
    ShipmentID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    BranchID INT NOT NULL,
    DriverID INT,
    StatusID INT NOT NULL,
    TrackingNumber VARCHAR(50) UNIQUE,
    ShipmentDate DATE,
    EstimatedDeliveryDate DATE,
    ActualDeliveryDate DATE,
    ShippingCost DECIMAL(10,2),
    ShipmentRating INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (StatusID) REFERENCES ShipmentStatus(StatusID)
);

CREATE TABLE Package (
    PackageID INT PRIMARY KEY,
    ShipmentID INT NOT NULL,
    Weight DECIMAL(10,2),
    Dimensions VARCHAR(100),
    Fragile BIT,
    Description VARCHAR(255),
    FOREIGN KEY (ShipmentID) REFERENCES Shipment(ShipmentID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    ShipmentID INT UNIQUE NOT NULL,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    IsPaid BIT,
    FOREIGN KEY (ShipmentID) REFERENCES Shipment(ShipmentID)
);



INSERT INTO Customer (CustomerID, FullName, Email, PhoneNumber, Address, RegistrationDate) VALUES
(1,'Ahmed Saber','ahmed1@example.com','01010000001','Cairo, Egypt','2025-01-01'),
(2,'Mohamed Ali','mohamed2@example.com','01010000002','Giza, Egypt','2025-01-02'),
(3,'Sara Hassan','sara3@example.com','01010000003','Alexandria, Egypt','2025-01-03'),
(4,'Laila Mahmoud','laila4@example.com','01010000004','Cairo, Egypt','2025-01-04'),
(5,'Khaled Youssef','khaled5@example.com','01010000005','Giza, Egypt','2025-01-05'),
(6,'Mona Adel','mona6@example.com','01010000006','Cairo, Egypt','2025-01-06'),
(7,'Omar Tarek','omar7@example.com','01010000007','Alexandria, Egypt','2025-01-07'),
(8,'Nour Fathy','nour8@example.com','01010000008','Cairo, Egypt','2025-01-08'),
(9,'Hassan Samir','hassan9@example.com','01010000009','Giza, Egypt','2025-01-09'),
(10,'Mariam Hossam','mariam10@example.com','01010000010','Cairo, Egypt','2025-01-10'),
(11,'Amr Mostafa','amr11@example.com','01010000011','Alexandria, Egypt','2025-01-11'),
(12,'Aya Khaled','aya12@example.com','01010000012','Giza, Egypt','2025-01-12'),
(13,'Tamer Sherif','tamer13@example.com','01010000013','Cairo, Egypt','2025-01-13'),
(14,'Dina Adel','dina14@example.com','01010000014','Alexandria, Egypt','2025-01-14'),
(15,'Mahmoud Samir','mahmoud15@example.com','01010000015','Cairo, Egypt','2025-01-15'),
(16,'Salma Hany','salma16@example.com','01010000016','Giza, Egypt','2025-01-16'),
(17,'Mostafa Khalid','mostafa17@example.com','01010000017','Cairo, Egypt','2025-01-17'),
(18,'Fatma Nabil','fatma18@example.com','01010000018','Alexandria, Egypt','2025-01-18'),
(19,'Youssef Amr','youssef19@example.com','01010000060','Cairo, Egypt','2025-01-19'),
(20,'Reem Tamer','reem20@example.com','01010000019','Giza, Egypt','2025-01-20'),
(21,'Khalid Hassan','khalid21@example.com','01010000020','Cairo, Egypt','2025-01-21'),
(22,'Heba Omar','heba22@example.com','01010000021','Alexandria, Egypt','2025-01-22'),
(23,'Adham Samir','adham23@example.com','01010000022','Giza, Egypt','2025-01-23'),
(24,'Noha Khaled','noha24@example.com','01010000023','Cairo, Egypt','2025-01-24'),
(25,'Ahmed Fathy','ahmed25@example.com','01010000024','Alexandria, Egypt','2025-01-25'),
(26,'Sara Youssef','sara26@example.com','01010000025','Giza, Egypt','2025-01-26'),
(27,'Omar Mostafa','omar27@example.com','01010000026','Cairo, Egypt','2025-01-27'),
(28,'Mona Tamer','mona28@example.com','01010000027','Alexandria, Egypt','2025-01-28'),
(29,'Hany Samir','hany29@example.com','01010000028','Giza, Egypt','2025-01-29'),
(30,'Dina Khaled','dina30@example.com','01010000029','Cairo, Egypt','2025-01-30'),
(31,'Mohamed Hossam','mohamed31@example.com','01010000030','Alexandria, Egypt','2025-01-31'),
(32,'Salma Fathy','salma32@example.com','01010000031','Giza, Egypt','2025-02-01'),
(33,'Tamer Omar','tamer33@example.com','01010000032','Cairo, Egypt','2025-02-02'),
(34,'Aya Mostafa','aya34@example.com','01010000033','Alexandria, Egypt','2025-02-03'),
(35,'Mahmoud Khalid','mahmoud35@example.com','01010000034','Giza, Egypt','2025-02-04'),
(36,'Reem Hany','reem36@example.com','01010000035','Cairo, Egypt','2025-02-05'),
(37,'Adham Fathy','adham37@example.com','01010000070','Alexandria, Egypt','2025-02-06'),
(38,'Noha Samir','noha38@example.com','01010000036','Giza, Egypt','2025-02-07'),
(39,'Ahmed Tamer','ahmed39@example.com','01010000037','Cairo, Egypt','2025-02-08'),
(40,'Sara Mostafa','sara40@example.com','01010000038','Alexandria, Egypt','2025-02-09'),
(41,'Omar Khaled','omar41@example.com','01010000039','Giza, Egypt','2025-02-10'),
(42,'Mona Hossam','mona42@example.com','01010000040','Cairo, Egypt','2025-02-11'),
(43,'Hassan Fathy','hassan43@example.com','01010000041','Alexandria, Egypt','2025-02-12'),
(44,'Dina Samir','dina44@example.com','01010000042','Giza, Egypt','2025-02-13'),
(45,'Mahmoud Tamer','mahmoud45@example.com','01010000043','Cairo, Egypt','2025-02-14'),
(46,'Salma Mostafa','salma46@example.com','01010000044','Alexandria, Egypt','2025-02-15'),
(47,'Tamer Khaled','tamer47@example.com','01010000045','Giza, Egypt','2025-02-16'),
(48,'Aya Hany','aya48@example.com','01010000046','Cairo, Egypt','2025-02-17'),
(49,'Reem Samir','reem49@example.com','01010000047','Alexandria, Egypt','2025-02-18'),
(50,'Ahmed Fathy','ahmed50@example.com','01010000048','Giza, Egypt','2025-02-19');


INSERT INTO Branch (BranchID, BranchName, Location, PhoneNumber) VALUES
(1,'Cairo Central','Cairo, Egypt','01020000001'),
(2,'Giza Main','Giza, Egypt','01020000002'),
(3,'Alexandria Port','Alexandria, Egypt','01020000003'),
(4,'Cairo East','Cairo, Egypt','01020000004'),
(5,'Giza West','Giza, Egypt','01020000005'),
(6,'Alexandria West','Alexandria, Egypt','01020000006'),
(7,'Cairo Airport','Cairo, Egypt','01020000007'),
(8,'Giza Downtown','Giza, Egypt','01020000008'),
(9,'Alexandria Downtown','Alexandria, Egypt','01020000009'),
(10,'Cairo South','Cairo, Egypt','01020000010');


INSERT INTO Driver (DriverID, FullName, PhoneNumber, LicenseNumber, DateOfBirth, BranchID) VALUES
(1,'Ali Ahmed','01030000001','L10001','1990-01-01',1),
(2,'Mohamed Samir','01030000002','L10002','1988-02-03',1),
(3,'Omar Khaled','01030000003','L10003','1992-03-05',2),
(4,'Hassan Tamer','01030000004','L10004','1991-04-10',2),
(5,'Ahmed Fathy','01030000005','L10005','1989-05-12',3),
(6,'Tamer Mostafa','01030000006','L10006','1990-06-08',3),
(7,'Mahmoud Adel','01030000007','L10007','1993-07-20',4),
(8,'Khaled Youssef','01030000008','L10008','1992-08-14',4),
(9,'Omar Hany','01030000009','L10009','1991-09-22',5),
(10,'Ali Fathy','01030000010','L10010','1988-10-30',5),
(11,'Ahmed Samir','01030000011','L10011','1990-11-11',6),
(12,'Hassan Adel','01030000012','L10012','1989-12-05',6),
(13,'Mohamed Khaled','01030000013','L10013','1992-01-15',7),
(14,'Tamer Hany','01030000014','L10014','1991-02-25',7),
(15,'Ali Mostafa','01030000015','L10015','1993-03-30',8),
(16,'Omar Adel','01030000016','L10016','1990-04-04',8),
(17,'Mahmoud Khaled','01030000017','L10017','1989-05-10',9),
(18,'Ahmed Hany','01030000018','L10018','1992-06-15',9),
(19,'Tamer Samir','01030000019','L10019','1991-07-18',10),
(20,'Khaled Ahmed','01030000020','L10020','1990-08-22',10),
(21,'Omar Fathy','01030000021','L10021','1988-09-10',1),
(22,'Ali Khaled','01030000022','L10022','1989-10-12',1),
(23,'Mahmoud Samir','01030000023','L10023','1991-11-16',2),
(24,'Ahmed Adel','01030000024','L10024','1992-12-01',2),
(25,'Tamer Khaled','01030000025','L10025','1993-01-20',3),
(26,'Hassan Fathy','01030000026','L10026','1990-02-28',3),
(27,'Omar Mostafa','01030000027','L10027','1991-03-15',4),
(28,'Ali Hany','01030000028','L10028','1988-04-25',4),
(29,'Mahmoud Fathy','01030000029','L10029','1989-05-30',5),
(30,'Ahmed Khaled','01030000030','L10030','1992-06-08',5),
(31,'Tamer Ahmed','01030000031','L10031','1993-07-12',6),
(32,'Omar Samir','01030000032','L10032','1990-08-18',6),
(33,'Hassan Mostafa','01030000033','L10033','1989-09-22',7),
(34,'Ali Adel','01030000034','L10034','1991-10-27',7),
(35,'Mahmoud Hany','01030000035','L10035','1992-11-05',8),
(36,'Ahmed Mostafa','01030000036','L10036','1993-12-12',8),
(37,'Tamer Adel','01030000037','L10037','1988-01-19',9),
(38,'Omar Khaled','01030000038','L10038','1990-02-23',9),
(39,'Hassan Ahmed','01030000039','L10039','1991-03-30',10),
(40,'Ali Fathy','01030000040','L10040','1992-04-04',10),
(41,'Mahmoud Khaled','01030000041','L10041','1989-05-15',1),
(42,'Ahmed Samir','01030000042','L10042','1990-06-20',1),
(43,'Tamer Hany','01030000043','L10043','1991-07-25',2),
(44,'Omar Adel','01030000044','L10044','1992-08-30',2),
(45,'Hassan Khaled','01030000045','L10045','1993-09-10',3),
(46,'Ali Samir','01030000046','L10046','1990-10-15',3),
(47,'Mahmoud Adel','01030000047','L10047','1989-11-20',4),
(48,'Ahmed Hany','01030000048','L10048','1991-12-25',4),
(49,'Tamer Fathy','01030000049','L10049','1992-01-05',5),
(50,'Omar Ahmed','01030000050','L10050','1993-02-10',5);


INSERT INTO ShipmentStatus (StatusID, StatusName, SequenceOrder, Description) VALUES
(1,'Created',1,'Shipment has been created'),
(2,'Received at Branch',2,'Shipment received at branch'),
(3,'In Transit',3,'Shipment is on the way'),
(4,'Out for Delivery',4,'Shipment is out for delivery'),
(5,'Delivered',5,'Shipment successfully delivered'),
(6,'Failed Delivery',6,'Delivery attempt failed'),
(7,'Returned',7,'Shipment returned to sender'),
(8,'Cancelled',8,'Shipment cancelled by customer');


INSERT INTO Shipment (ShipmentID, CustomerID, BranchID, DriverID, StatusID, TrackingNumber, ShipmentDate, EstimatedDeliveryDate, ActualDeliveryDate, ShippingCost, ShipmentRating) VALUES
(1,1,1,1,5,'TRK0001','2025-01-05','2025-01-10','2025-01-09',150.00,5),
(2,2,2,2,5,'TRK0002','2025-01-06','2025-01-11','2025-01-12',120.00,3),
(3,3,3,3,5,'TRK0003','2025-01-07','2025-01-12','2025-01-15',200.00,2),
(4,4,4,4,6,'TRK0004','2025-01-08','2025-01-13',NULL,180.00,NULL),
(5,5,5,5,5,'TRK0005','2025-01-09','2025-01-14','2025-01-14',250.00,4),
(6,6,1,6,5,'TRK0006','2025-01-10','2025-01-15','2025-01-16',130.00,3),
(7,7,2,7,4,'TRK0007','2025-01-11','2025-01-16',NULL,170.00,NULL),
(8,8,3,8,5,'TRK0008','2025-01-12','2025-01-17','2025-01-19',160.00,4),
(9,9,4,9,8,'TRK0009','2025-01-13','2025-01-18',NULL,190.00,NULL),
(10,10,5,10,5,'TRK0010','2025-01-14','2025-01-19','2025-01-18',220.00,5),
(11,11,1,11,5,'TRK0011','2025-01-15','2025-01-20','2025-01-21',140.00,2),
(12,12,2,12,5,'TRK0012','2025-01-16','2025-01-21','2025-01-20',150.00,4),
(13,13,3,13,5,'TRK0013','2025-01-17','2025-01-22','2025-01-24',170.00,3),
(14,14,4,14,7,'TRK0014','2025-01-18','2025-01-23',NULL,200.00,NULL),
(15,15,5,15,5,'TRK0015','2025-01-19','2025-01-24','2025-01-23',210.00,5),
(16,16,1,16,5,'TRK0016','2025-01-20','2025-01-25','2025-01-27',130.00,1),
(17,17,2,17,5,'TRK0017','2025-01-21','2025-01-26','2025-01-26',160.00,4),
(18,18,3,18,5,'TRK0018','2025-01-22','2025-01-27','2025-01-28',180.00,3),
(19,19,4,19,6,'TRK0019','2025-01-23','2025-01-28',NULL,190.00,NULL),
(20,20,5,20,5,'TRK0020','2025-01-24','2025-01-29','2025-01-29',220.00,5),
(21,21,1,21,5,'TRK0021','2025-01-25','2025-01-30','2025-01-30',140.00,4),
(22,22,2,22,5,'TRK0022','2025-01-26','2025-01-31','2025-01-31',150.00,4),
(23,23,3,23,3,'TRK0023','2025-01-27','2025-02-01',NULL,170.00,NULL),
(24,24,4,24,5,'TRK0024','2025-01-28','2025-02-02','2025-02-03',200.00,3),
(25,25,5,25,5,'TRK0025','2025-01-29','2025-02-03','2025-02-02',210.00,5),
(26,26,1,26,5,'TRK0026','2025-01-30','2025-02-04','2025-02-05',130.00,2),
(27,27,2,27,5,'TRK0027','2025-01-31','2025-02-05','2025-02-04',160.00,4),
(28,28,3,28,5,'TRK0028','2025-02-01','2025-02-06','2025-02-08',180.00,3),
(29,29,4,29,8,'TRK0029','2025-02-02','2025-02-07',NULL,190.00,NULL),
(30,30,5,30,5,'TRK0030','2025-02-03','2025-02-08','2025-02-07',220.00,5),
(31,31,1,31,5,'TRK0031','2025-02-04','2025-02-09','2025-02-10',140.00,1),
(32,32,2,32,5,'TRK0032','2025-02-05','2025-02-10','2025-02-09',150.00,4),
(33,33,3,33,4,'TRK0033','2025-02-06','2025-02-11',NULL,170.00,NULL),
(34,34,4,34,5,'TRK0034','2025-02-07','2025-02-12','2025-02-14',200.00,2),
(35,35,5,35,5,'TRK0035','2025-02-08','2025-02-13','2025-02-12',210.00,5),
(36,36,1,36,5,'TRK0036','2025-02-09','2025-02-14','2025-02-15',130.00,3),
(37,37,2,37,6,'TRK0037','2025-02-10','2025-02-15',NULL,160.00,NULL),
(38,38,3,38,5,'TRK0038','2025-02-11','2025-02-16','2025-02-16',180.00,4),
(39,39,4,39,5,'TRK0039','2025-02-12','2025-02-17','2025-02-19',190.00,3),
(40,40,5,40,5,'TRK0040','2025-02-13','2025-02-18','2025-02-17',220.00,5),
(41,41,1,41,7,'TRK0041','2025-02-14','2025-02-19',NULL,140.00,NULL),
(42,42,2,42,5,'TRK0042','2025-02-15','2025-02-20','2025-02-21',150.00,4),
(43,43,3,43,5,'TRK0043','2025-02-16','2025-02-21','2025-02-20',170.00,5),
(44,44,4,44,5,'TRK0044','2025-02-17','2025-02-22','2025-02-24',200.00,2),
(45,45,5,45,5,'TRK0045','2025-02-18','2025-02-23','2025-02-22',210.00,4),
(46,46,1,46,5,'TRK0046','2025-02-19','2025-02-24','2025-02-26',130.00,1),
(47,47,2,47,3,'TRK0047','2025-02-20','2025-02-25',NULL,160.00,NULL),
(48,48,3,48,5,'TRK0048','2025-02-21','2025-02-26','2025-02-27',180.00,3),
(49,49,4,49,5,'TRK0049','2025-02-22','2025-02-27','2025-02-28',190.00,4),
(50,50,5,50,5,'TRK0050','2025-02-23','2025-02-28','2025-02-27',220.00,5);


INSERT INTO Payment (PaymentID, ShipmentID, PaymentDate, Amount, PaymentMethod, IsPaid) VALUES
(1,1,'2025-01-05',150.00,'Credit Card',1),
(2,2,'2025-01-06',120.00,'Cash',1),
(3,3,'2025-01-07',200.00,'Credit Card',1),
(4,4,NULL,180.00,'Cash',0),
(5,5,'2025-01-09',250.00,'Credit Card',1),
(6,6,'2025-01-10',130.00,'Cash',1),
(7,7,NULL,170.00,'Credit Card',0),
(8,8,'2025-01-12',160.00,'Cash',1),
(9,9,NULL,190.00,'Credit Card',0),
(10,10,'2025-01-14',220.00,'Cash',1),
(11,11,'2025-01-15',140.00,'Credit Card',1),
(12,12,'2025-01-17',150.00,'Cash',1),
(13,13,'2025-01-18',170.00,'Credit Card',1),
(14,14,NULL,200.00,'Cash',0),
(15,15,'2025-01-20',210.00,'Credit Card',1),
(16,16,'2025-01-21',130.00,'Cash',1),
(17,17,'2025-01-23',160.00,'Credit Card',1),
(18,18,'2025-01-24',180.00,'Cash',1),
(19,19,NULL,190.00,'Credit Card',0),
(20,20,'2025-01-26',220.00,'Cash',1),
(21,21,'2025-01-27',140.00,'Credit Card',1),
(22,22,'2025-01-28',150.00,'Cash',1),
(23,23,NULL,170.00,'Credit Card',0),
(24,24,'2025-01-30',200.00,'Cash',1),
(25,25,'2025-01-31',210.00,'Credit Card',1),
(26,26,'2025-02-01',130.00,'Cash',1),
(27,27,'2025-02-02',160.00,'Credit Card',1),
(28,28,'2025-02-04',180.00,'Cash',1),
(29,29,NULL,190.00,'Credit Card',0),
(30,30,'2025-02-05',220.00,'Cash',1),
(31,31,'2025-02-06',140.00,'Credit Card',1),
(32,32,'2025-02-07',150.00,'Cash',1),
(33,33,NULL,170.00,'Credit Card',0),
(34,34,'2025-02-09',200.00,'Cash',1),
(35,35,'2025-02-10',210.00,'Credit Card',1),
(36,36,'2025-02-11',130.00,'Cash',1),
(37,37,NULL,160.00,'Credit Card',0),
(38,38,'2025-02-13',180.00,'Cash',1),
(39,39,'2025-02-14',190.00,'Credit Card',1),
(40,40,'2025-02-15',220.00,'Cash',1),
(41,41,NULL,140.00,'Credit Card',0),
(42,42,'2025-02-17',150.00,'Cash',1),
(43,43,'2025-02-18',170.00,'Credit Card',1),
(44,44,'2025-02-20',200.00,'Cash',1),
(45,45,'2025-02-21',210.00,'Credit Card',1),
(46,46,'2025-02-22',130.00,'Cash',1),
(47,47,NULL,160.00,'Credit Card',0),
(48,48,'2025-02-24',180.00,'Cash',1),
(49,49,'2025-02-25',190.00,'Credit Card',1),
(50,50,'2025-02-27',220.00,'Cash',1);

INSERT INTO Package (PackageID, ShipmentID, Weight, Dimensions, Fragile, Description) VALUES
(1,1,2.5,'30x20x15',1,'Electronics - Laptop'),
(2,1,0.8,'20x15x10',0,'Accessories'),
(3,2,3.2,'40x25x20',1,'Glassware Set'),
(4,3,2.0,'25x20x10',0,'Clothing - Heavy'),
(5,3,1.2,'20x15x15',1,'Fragile Decor'),
(6,4,4.5,'50x30x20',0,'Kitchen Appliances'),
(7,5,3.8,'35x25x20',0,'Shoes - 2 pairs'),
(8,5,0.5,'15x10x5',0,'Documents'),
(9,6,2.0,'25x20x10',0,'Books - 5 items'),
(10,7,3.0,'30x20x15',0,'Clothing - Box'),
(11,7,1.5,'25x20x15',1,'Electronics - Phone'),
(12,8,4.2,'50x30x25',0,'Sports Equipment'),
(13,9,2.5,'30x20x15',1,'Fragile Electronics'),
(14,10,3.5,'40x25x20',0,'Household Items'),
(15,10,0.8,'15x10x5',0,'Documents - Legal'),
(16,11,2.2,'25x20x10',0,'Books - Heavy'),
(17,12,1.8,'20x15x10',1,'Glass Items'),
(18,13,4.0,'45x30x20',0,'Furniture Part'),
(19,13,1.2,'25x15x10',0,'Hardware'),
(20,14,2.8,'30x25x15',1,'Artwork'),
(21,15,5.0,'60x40x30',0,'Large Appliance'),
(22,16,1.5,'20x15x10',0,'Clothing - Light'),
(23,16,0.6,'15x10x8',1,'Watch'),
(24,17,3.2,'35x25x20',0,'Toys'),
(25,18,2.0,'25x20x10',1,'Fragile Gift'),
(26,18,1.0,'20x15x5',0,'Envelope'),
(27,19,4.5,'50x30x25',0,'Exercise Equipment'),
(28,20,2.5,'30x20x15',0,'Books - 8 items'),
(29,20,1.2,'25x15x10',1,'Collectible'),
(30,21,3.0,'35x25x20',0,'Clothing - Bulk'),
(31,22,1.8,'20x15x15',1,'Electronics - Tablet'),
(32,23,4.0,'50x30x20',0,'Kitchen Set'),
(33,24,2.2,'25x20x15',0,'Shoes - 3 pairs'),
(34,24,0.5,'15x10x5',0,'Documents'),
(35,25,3.5,'40x25x20',1,'Fragile Vase'),
(36,26,2.0,'25x20x10',0,'Books - 6 items'),
(37,27,1.5,'20x15x10',0,'Clothing'),
(38,28,4.2,'50x30x25',1,'Expensive Electronics'),
(39,29,2.8,'30x25x15',0,'Household'),
(40,30,3.0,'35x25x20',0,'Furniture Items'),
(41,30,0.8,'15x10x5',0,'Manual'),
(42,31,1.6,'20x15x10',1,'Delicate Items'),
(43,32,3.5,'40x25x20',0,'Sports Gear'),
(44,33,4.8,'55x35x25',0,'Large Package'),
(45,34,2.0,'25x20x10',1,'Fragile Electronics'),
(46,34,0.7,'15x10x5',0,'Cables'),
(47,35,3.2,'35x25x20',0,'Toys - Large'),
(48,36,1.8,'20x15x15',0,'Clothing - Pack'),
(49,37,2.5,'30x20x15',1,'Glass Decor'),
(50,38,4.0,'45x30x20',0,'Home Appliance'),
(51,39,2.2,'25x20x10',0,'Books - 10 items'),
(52,40,3.5,'40x25x20',1,'Fragile Set'),
(53,41,1.5,'20x15x10',0,'Accessories'),
(54,42,4.5,'50x30x25',0,'Exercise Gear'),
(55,43,2.0,'25x20x15',0,'Shoes - 2 pairs'),
(56,44,3.8,'35x25x20',1,'Electronics - TV'),
(57,45,2.5,'30x20x15',0,'Clothing - Heavy'),
(58,46,1.2,'20x15x10',0,'Books - Small'),
(59,47,4.0,'45x30x20',0,'Kitchen Items'),
(60,48,2.2,'25x20x15',1,'Fragile Items'),
(61,49,3.0,'35x25x20',0,'Sports Equipment'),
(62,50,1.8,'20x15x10',0,'Clothing - Light');

-- Add some indexes for better query performance
CREATE INDEX idx_shipment_customer ON Shipment(CustomerID);
CREATE INDEX idx_shipment_status ON Shipment(StatusID);
CREATE INDEX idx_shipment_driver ON Shipment(DriverID);
CREATE INDEX idx_package_shipment ON Package(ShipmentID);
CREATE INDEX idx_payment_shipment ON Payment(ShipmentID);

select * from Branch ;
select * from Customer ;
select * from Package ;
select * from Driver ;
select * from Payment ;
select * from Shipment ;
select * from ShipmentStatus ;



-- 1. Percentage of Late vs On-Time Shipments
SELECT 
    COUNT(CASE WHEN ActualDeliveryDate > EstimatedDeliveryDate THEN 1 END) AS LateDeliveries,
    COUNT(CASE WHEN ActualDeliveryDate <= EstimatedDeliveryDate THEN 1 END) AS OnTimeDeliveries,
    COUNT(CASE WHEN ActualDeliveryDate IS NULL THEN 1 END) AS NotDeliveredYet,
    ROUND(COUNT(CASE WHEN ActualDeliveryDate > EstimatedDeliveryDate THEN 1 END) * 100.0 / 
          COUNT(CASE WHEN ActualDeliveryDate IS NOT NULL THEN 1 END), 2) AS LateDeliveryPercentage
FROM Shipment
WHERE ActualDeliveryDate IS NOT NULL;
-- COMMENT: Calculates the percentage of shipments delivered late. If percentage is high, we need to improve delivery operations or adjust estimates

-- =====================================================
-- 2. Average Delay Days by Branch
SELECT 
    b.BranchName,
    b.Location,
    COUNT(s.ShipmentID) AS TotalShipments,
    AVG(DATEDIFF(day, s.EstimatedDeliveryDate, s.ActualDeliveryDate)) AS AvgDelayDays,
    COUNT(CASE WHEN s.ActualDeliveryDate > s.EstimatedDeliveryDate THEN 1 END) AS LateCount
FROM Shipment s
JOIN Branch b ON s.BranchID = b.BranchID
WHERE s.ActualDeliveryDate IS NOT NULL
GROUP BY b.BranchID, b.BranchName, b.Location
ORDER BY AvgDelayDays DESC;
-- COMMENT: Identifies which branch has the highest delivery delay so we can focus improvement efforts there

-- =====================================================
-- 3. Driver Performance Analysis (Best and Worst Drivers)
SELECT TOP 5
    d.FullName AS DriverName,
    COUNT(s.ShipmentID) AS DeliveriesCount,
    AVG(CAST(s.ShipmentRating AS FLOAT)) AS AvgRating,
    COUNT(CASE WHEN s.ActualDeliveryDate > s.EstimatedDeliveryDate THEN 1 END) AS LateDeliveries,
    ROUND(AVG(DATEDIFF(day, s.EstimatedDeliveryDate, s.ActualDeliveryDate)), 1) AS AvgDelayDays
FROM Shipment s
JOIN Driver d ON s.DriverID = d.DriverID
WHERE s.ShipmentRating IS NOT NULL AND s.ActualDeliveryDate IS NOT NULL
GROUP BY d.DriverID, d.FullName
ORDER BY AvgRating DESC;
-- COMMENT: Reveals best drivers based on ratings and delays, allowing us to reward them or send them for training

-- =====================================================
-- 4. Revenue Analysis by Shipment Status
SELECT 
    ss.StatusName,
    COUNT(s.ShipmentID) AS ShipmentCount,
    SUM(p.Amount) AS TotalRevenue,
    AVG(p.Amount) AS AvgRevenue,
    COUNT(CASE WHEN p.IsPaid = 0 THEN 1 END) AS UnpaidCount
FROM Shipment s
JOIN ShipmentStatus ss ON s.StatusID = ss.StatusID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
GROUP BY ss.StatusID, ss.StatusName
ORDER BY TotalRevenue DESC;
-- COMMENT: Shows how much money was lost from cancelled or returned shipments, and how many payments are still pending

-- =====================================================
-- 5. Average Delivery Time by City and Fragile Type
SELECT 
    SUBSTRING(b.Location, 1, CHARINDEX(',', b.Location) - 1) AS City,
    CASE WHEN p.Fragile = 1 THEN 'Fragile' ELSE 'Regular' END As PackageType,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount,
    AVG(DATEDIFF(day, s.ShipmentDate, s.ActualDeliveryDate)) AS AvgDeliveryDays,
    AVG(s.ShippingCost) AS AvgShippingCost
FROM Shipment s
JOIN Branch b ON s.BranchID = b.BranchID
JOIN Package p ON s.ShipmentID = p.ShipmentID
WHERE s.ActualDeliveryDate IS NOT NULL
GROUP BY SUBSTRING(b.Location, 1, CHARINDEX(',', b.Location) - 1), p.Fragile
ORDER BY City, PackageType;
-- COMMENT: Compares delivery time between fragile vs regular packages in each city

-- =====================================================
-- 6. Top Customers with Highest Spending and Ratings
SELECT TOP 10
    c.FullName,
    c.Address,
    COUNT(s.ShipmentID) AS OrdersCount,
    ROUND(AVG(CAST(s.ShipmentRating AS FLOAT)), 1) AS AvgRating,
    SUM(p.Amount) AS TotalSpent,
    COUNT(CASE WHEN s.ShipmentRating <= 2 THEN 1 END) AS BadRatings,
    COUNT(CASE WHEN s.StatusID IN (6,7,8) THEN 1 END) AS ProblemOrders
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE s.ShipmentRating IS NOT NULL
GROUP BY c.CustomerID, c.FullName, c.Address
HAVING COUNT(s.ShipmentID) >= 1
ORDER BY TotalSpent DESC;
-- COMMENT: Identifies VIP customers who spend a lot so we can offer them special promotions

-- =====================================================
-- 7. Actual vs Expected Revenue Analysis (Gap Analysis)
SELECT 
    DATEPART(week, s.ShipmentDate) AS WeekNumber,
    COUNT(s.ShipmentID) AS ShipmentsCount,
    SUM(p.Amount) AS ActualRevenue,
    AVG(p.Amount) AS AvgRevenuePerShipment,
    COUNT(CASE WHEN p.IsPaid = 0 THEN 1 END) AS UnpaidShipments,
    SUM(CASE WHEN p.IsPaid = 0 THEN p.Amount ELSE 0 END) AS UnpaidAmount
FROM Shipment s
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE s.ShipmentDate BETWEEN '2025-01-01' AND '2025-02-28'
GROUP BY DATEPART(week, s.ShipmentDate)
ORDER BY WeekNumber;
-- COMMENT: Tracks weekly revenue and identifies unpaid shipments for collection follow-up

-- =====================================================
-- 8. Shipments Delayed More Than 5 Days (Emergency Cases)
SELECT 
    s.TrackingNumber,
    c.FullName AS CustomerName,
    b.BranchName,
    d.FullName AS DriverName,
    s.ShipmentDate,
    s.EstimatedDeliveryDate,
    s.ActualDeliveryDate,
    DATEDIFF(day, s.EstimatedDeliveryDate, s.ActualDeliveryDate) AS DaysLate,
    s.ShippingCost,
    CASE WHEN s.ShipmentRating IS NULL THEN 'Not Rated' ELSE CAST(s.ShipmentRating AS VARCHAR) END AS Rating
FROM Shipment s
JOIN Customer c ON s.CustomerID = c.CustomerID
JOIN Branch b ON s.BranchID = b.BranchID
LEFT JOIN Driver d ON s.DriverID = d.DriverID
WHERE s.ActualDeliveryDate > DATEADD(day, 5, s.EstimatedDeliveryDate)
ORDER BY DaysLate DESC;
-- COMMENT: Focuses on worst-case scenarios (delays over 5 days) for special follow-up and customer apology

-- =====================================================
-- 9. Payment Method Distribution and Outstanding Payments (Financial Analysis)
SELECT 
    p.PaymentMethod,
    COUNT(p.PaymentID) AS TotalTransactions,
    SUM(p.Amount) AS TotalAmount,
    AVG(p.Amount) AS AvgAmount,
    COUNT(CASE WHEN p.IsPaid = 0 THEN 1 END) AS UnpaidCount,
    SUM(CASE WHEN p.IsPaid = 0 THEN p.Amount ELSE 0 END) AS UnpaidAmount
FROM Payment p
GROUP BY p.PaymentMethod
ORDER BY TotalAmount DESC;
-- COMMENT: Identifies most used payment method and how much money is outstanding from each method

-- =====================================================
-- 10. Delivery Success Rate by Branch (Key Performance Indicator)
SELECT 
    b.BranchName,
    COUNT(s.ShipmentID) AS TotalShipments,
    COUNT(CASE WHEN s.StatusID = 5 THEN 1 END) AS SuccessfulDeliveries,
    ROUND(COUNT(CASE WHEN s.StatusID = 5 THEN 1 END) * 100.0 / COUNT(s.ShipmentID), 2) AS SuccessRate,
    COUNT(CASE WHEN s.StatusID IN (6,7) THEN 1 END) AS FailedOrReturned,
    COUNT(CASE WHEN s.StatusID = 8 THEN 1 END) AS Cancelled
FROM Shipment s
JOIN Branch b ON s.BranchID = b.BranchID
GROUP BY b.BranchID, b.BranchName
ORDER BY SuccessRate DESC;
-- COMMENT: Critical metric - branches with low success rate need management intervention or driver changes

-- =====================================================
-- 11. Weight vs Shipping Cost Analysis (Is Pricing Fair?)
SELECT 
    CASE 
        WHEN p.Weight < 1 THEN 'Light (<1kg)'
        WHEN p.Weight BETWEEN 1 AND 2 THEN 'Medium (1-2kg)'
        WHEN p.Weight BETWEEN 2 AND 3 THEN 'Heavy (2-3kg)'
        ELSE 'Very Heavy (>3kg)'
    END AS WeightCategory,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount,
    AVG(s.ShippingCost) AS AvgShippingCost,
    AVG(p.Weight) AS AvgWeight,
    AVG(s.ShippingCost / NULLIF(p.Weight, 0)) AS CostPerKg
FROM Shipment s
JOIN Package p ON s.ShipmentID = p.ShipmentID
GROUP BY 
    CASE 
        WHEN p.Weight < 1 THEN 'Light (<1kg)'
        WHEN p.Weight BETWEEN 1 AND 2 THEN 'Medium (1-2kg)'
        WHEN p.Weight BETWEEN 2 AND 3 THEN 'Heavy (2-3kg)'
        ELSE 'Very Heavy (>3kg)'
    END
ORDER BY AvgWeight;
-- COMMENT: Checks if pricing policy is fair based on weight and identifies needed adjustments

-- =====================================================
-- 12. Customers Who Frequently Complain (Ratings Below 3)
SELECT TOP 10
    c.FullName,
    c.Email,
    c.PhoneNumber,
    COUNT(s.ShipmentID) AS TotalOrders,
    COUNT(CASE WHEN s.ShipmentRating <= 2 THEN 1 END) AS Complaints,
    ROUND(COUNT(CASE WHEN s.ShipmentRating <= 2 THEN 1 END) * 100.0 / COUNT(s.ShipmentID), 2) AS ComplaintRate,
    AVG(DATEDIFF(day, s.ShipmentDate, s.ActualDeliveryDate)) AS AvgDeliveryDays
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
WHERE s.ShipmentRating IS NOT NULL
GROUP BY c.CustomerID, c.FullName, c.Email, c.PhoneNumber
HAVING COUNT(CASE WHEN s.ShipmentRating <= 2 THEN 1 END) >= 1
ORDER BY ComplaintRate DESC;
-- COMMENT: Identifies dissatisfied customers to reach out and resolve issues before they switch to competitors

-- =====================================================
-- 13. Seasonal Analysis - Peak Periods Identification
SELECT 
    DATEPART(month, ShipmentDate) AS Month,
    DATEPART(week, ShipmentDate) AS Week,
    COUNT(*) AS ShipmentsCount,
    AVG(ShippingCost) AS AvgCost,
    COUNT(CASE WHEN StatusID = 5 THEN 1 END) AS DeliveredCount
FROM Shipment
GROUP BY DATEPART(month, ShipmentDate), DATEPART(week, ShipmentDate)
ORDER BY Month, Week;
-- COMMENT: Identifies peak periods to prepare additional resources (drivers, staff, vehicles)

-- =====================================================
-- 14. Customer Shipment Frequency Analysis (Activity Level)

SELECT 
    CASE 
        WHEN OrderCount = 1 THEN 'New Customer'
        WHEN OrderCount BETWEEN 2 AND 3 THEN 'Regular'
        WHEN OrderCount >= 4 THEN 'Loyal'
    END AS CustomerType,
    COUNT(CustomerID) AS NumberOfCustomers,
    AVG(OrderCount) AS AvgOrdersPerCustomer,
    AVG(AvgRating) AS AvgRatingForType,
    SUM(TotalSpent) AS TotalRevenueFromType
FROM (
    SELECT 
        c.CustomerID,
        COUNT(s.ShipmentID) AS OrderCount,
        AVG(CAST(s.ShipmentRating AS FLOAT)) AS AvgRating,
        SUM(p.Amount) AS TotalSpent
    FROM Customer c
    JOIN Shipment s ON c.CustomerID = s.CustomerID
    JOIN Payment p ON s.ShipmentID = p.ShipmentID
    WHERE s.ShipmentRating IS NOT NULL
    GROUP BY c.CustomerID
) AS CustomerStats
GROUP BY 
    CASE 
        WHEN OrderCount = 1 THEN 'New Customer'
        WHEN OrderCount BETWEEN 2 AND 3 THEN 'Regular'
        WHEN OrderCount >= 4 THEN 'Loyal'
    END
ORDER BY TotalRevenueFromType DESC;
-- COMMENT: Classifies customers by loyalty level to design targeted marketing strategies for each segment

-- =====================================================
-- 16. Average number of packages per shipment by branch (Enhanced)
SELECT 
    b.BranchName,
    b.Location,
    COUNT(DISTINCT s.ShipmentID) AS TotalShipments,
    COUNT(p.PackageID) AS TotalPackages,
    ROUND(COUNT(p.PackageID) * 1.0 / COUNT(DISTINCT s.ShipmentID), 2) AS AvgPackagesPerShipment
FROM Branch b
JOIN Shipment s ON b.BranchID = s.BranchID
JOIN Package p ON s.ShipmentID = p.ShipmentID
GROUP BY b.BranchID, b.BranchName, b.Location
ORDER BY AvgPackagesPerShipment DESC;
-- COMMENT: Branches with higher average packages might need larger vehicles or more handling staff

-- =====================================================
-- 17. Total shipments count with breakdown by status
SELECT 
    COUNT(*) AS TotalShipments,
    COUNT(CASE WHEN StatusID = 5 THEN 1 END) AS Delivered,
    COUNT(CASE WHEN StatusID IN (1,2,3,4) THEN 1 END) AS InProgress,
    COUNT(CASE WHEN StatusID IN (6,7,8) THEN 1 END) AS ProblemShipments
FROM Shipment;
-- COMMENT: Gives quick overview of operational health - high problem shipments need investigation

-- =====================================================
-- 18. Total revenue from paid shipments only
SELECT 
    SUM(p.Amount) AS TotalCollectedRevenue,
    SUM(CASE WHEN p.IsPaid = 0 THEN p.Amount ELSE 0 END) AS OutstandingRevenue,
    ROUND(SUM(CASE WHEN p.IsPaid = 0 THEN p.Amount ELSE 0 END) * 100.0 / NULLIF(SUM(p.Amount), 0), 2) AS OutstandingPercentage
FROM Payment p
JOIN Shipment s ON p.ShipmentID = s.ShipmentID;
-- COMMENT: Shows revenue actually collected vs money still owed to the company

-- =====================================================
-- 19. Problematic shipment patterns (What leads to returns/cancellations)
SELECT 
    CASE WHEN p.Fragile = 1 THEN 'Fragile' ELSE 'Regular' END AS PackageType,
    CASE 
        WHEN SUM(p.Weight) < 2 THEN 'Light'
        WHEN SUM(p.Weight) BETWEEN 2 AND 5 THEN 'Medium'
        ELSE 'Heavy'
    END AS TotalWeight,
    COUNT(DISTINCT s.ShipmentID) AS TotalShipments,
    COUNT(CASE WHEN s.StatusID IN (6,7) THEN 1 END) AS FailedOrReturned,
    ROUND(COUNT(CASE WHEN s.StatusID IN (6,7) THEN 1 END) * 100.0 / COUNT(DISTINCT s.ShipmentID), 2) AS FailureRate
FROM Shipment s
JOIN Package p ON s.ShipmentID = p.ShipmentID
GROUP BY p.Fragile, 
    CASE 
        WHEN SUM(p.Weight) < 2 THEN 'Light'
        WHEN SUM(p.Weight) BETWEEN 2 AND 5 THEN 'Medium'
        ELSE 'Heavy'
    END
ORDER BY FailureRate DESC;
-- COMMENT: Identifies which package characteristics lead to most failures

-- =====================================================
-- 20. Revenue forecast based on current trends
SELECT 
    FORMAT(s.ShipmentDate, 'yyyy-MM') AS Month,
    SUM(p.Amount) AS ActualRevenue,
    LAG(SUM(p.Amount)) OVER (ORDER BY FORMAT(s.ShipmentDate, 'yyyy-MM')) AS PreviousMonthRevenue,
    ROUND((SUM(p.Amount) - LAG(SUM(p.Amount)) OVER (ORDER BY FORMAT(s.ShipmentDate, 'yyyy-MM'))) * 100.0 / 
          NULLIF(LAG(SUM(p.Amount)) OVER (ORDER BY FORMAT(s.ShipmentDate, 'yyyy-MM')), 0), 2) AS GrowthRate,
    ROUND(SUM(p.Amount) * (1 + (ROUND((SUM(p.Amount) - LAG(SUM(p.Amount)) OVER (ORDER BY FORMAT(s.ShipmentDate, 'yyyy-MM'))) * 100.0 / 
          NULLIF(LAG(SUM(p.Amount)) OVER (ORDER BY FORMAT(s.ShipmentDate, 'yyyy-MM')), 0), 2) / 100), 2) AS ForecastNextMonth
FROM Shipment s
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE p.IsPaid = 1
GROUP BY FORMAT(s.ShipmentDate, 'yyyy-MM')
ORDER BY Month;
-- COMMENT: Predicts next month's revenue based on growth trends for budgeting

-- =====================================================
-- 20. Average shipping cost with statistical breakdown
SELECT 
    AVG(ShippingCost) AS AvgShippingCost,
    STDEV(ShippingCost) AS StdDeviation,
    MAX(ShippingCost) AS MaxCost,
    MIN(ShippingCost) AS MinCost,
    MAX(ShippingCost) - MIN(ShippingCost) AS CostRange
FROM Shipment;
-- COMMENT: Understanding cost variation helps with pricing strategy and identifying outliers

-- =====================================================
-- 21. Branch performance ranking by average shipping cost
SELECT 
    b.BranchName,
    b.Location,
    AVG(s.ShippingCost) AS AvgCost,
    COUNT(s.ShipmentID) AS ShipmentCount,
    RANK() OVER (ORDER BY AVG(s.ShippingCost) DESC) AS CostRank
FROM Shipment s
JOIN Branch b ON s.BranchID = b.BranchID
GROUP BY b.BranchID, b.BranchName, b.Location
ORDER BY AvgCost DESC;
-- COMMENT: Identifies which branches handle higher-value shipments (premium customers)

-- =====================================================
-- 22. Top 5 customers by total spending (Enhanced)
SELECT TOP 5
    c.FullName,
    c.Address,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount,
    SUM(p.Amount) AS TotalSpent,
    AVG(p.Amount) AS AvgPerShipment,
    MAX(p.Amount) AS MaxSinglePayment
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE p.IsPaid = 1
GROUP BY c.CustomerID, c.FullName, c.Address
ORDER BY TotalSpent DESC;
-- COMMENT: VIP customers list for loyalty programs and special offers

-- =====================================================
-- 23. Bottom 5 customers by total spending (At-risk customers)
SELECT TOP 5
    c.FullName,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount,
    SUM(p.Amount) AS TotalSpent,
    AVG(p.Amount) AS AvgPerShipment,
    MAX(s.ShipmentDate) AS LastShipmentDate,
    DATEDIFF(day, MAX(s.ShipmentDate), GETDATE()) AS DaysSinceLastOrder
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
GROUP BY c.CustomerID, c.FullName
HAVING SUM(p.Amount) IS NOT NULL
ORDER BY TotalSpent ASC;
-- COMMENT: Identifies customers who might be leaving - time for re-engagement campaigns

-- =====================================================
-- 24. Package distribution per shipment (with statistics)
SELECT 
    PackageCount,
    COUNT(*) AS NumberOfShipments,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM (
    SELECT ShipmentID, COUNT(*) AS PackageCount
    FROM Package
    GROUP BY ShipmentID
) AS PackageStats
GROUP BY PackageCount
ORDER BY PackageCount;
-- COMMENT: Shows shipment complexity - most shipments have 1-2 packages, outliers need special handling

-- =====================================================
-- 25. Customer average payment analysis with ranking
SELECT 
    c.FullName,
    COUNT(p.PaymentID) AS PaymentCount,
    AVG(p.Amount) AS AvgPayment,
    SUM(p.Amount) AS TotalSpent,
    PERCENT_RANK() OVER (ORDER BY AVG(p.Amount)) AS AvgPaymentPercentile
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
GROUP BY c.CustomerID, c.FullName
ORDER BY AvgPayment DESC;
-- COMMENT: Segments customers by spending behavior for targeted marketing

-- =====================================================
-- 26. Fragile vs Non-Fragile package analysis with financial impact
SELECT 
    CASE WHEN p.Fragile = 1 THEN 'Fragile' ELSE 'Regular' END AS PackageType,
    COUNT(p.PackageID) AS PackageCount,
    COUNT(DISTINCT p.ShipmentID) AS ShipmentCount,
    AVG(s.ShippingCost) AS AvgShippingCost,
    SUM(s.ShippingCost) AS TotalShippingRevenue,
    AVG(s.ShipmentRating) AS AvgCustomerRating
FROM Package p
JOIN Shipment s ON p.ShipmentID = s.ShipmentID
GROUP BY p.Fragile;
-- COMMENT: Determines if fragile packages generate higher revenue but also lower ratings

-- =====================================================
-- 27. Customer shipment frequency analysis (RFM - Recency, Frequency, Monetary)
SELECT 
    c.FullName,
    DATEDIFF(day, MAX(s.ShipmentDate), '2025-02-28') AS Recency,
    COUNT(s.ShipmentID) AS Frequency,
    SUM(p.Amount) AS Monetary,
    CASE 
        WHEN COUNT(s.ShipmentID) >= 3 AND SUM(p.Amount) > 500 THEN 'Platinum'
        WHEN COUNT(s.ShipmentID) >= 2 AND SUM(p.Amount) > 300 THEN 'Gold'
        WHEN COUNT(s.ShipmentID) >= 1 THEN 'Silver'
        ELSE 'Bronze'
    END AS CustomerSegment
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE p.IsPaid = 1
GROUP BY c.CustomerID, c.FullName
ORDER BY Monetary DESC;
-- COMMENT: RFM analysis for customer segmentation and targeted retention strategies

-- =====================================================
-- 28. Branch problem analysis (Returns + Cancellations combined)
SELECT 
    b.BranchName,
    COUNT(CASE WHEN ss.StatusName = 'Returned' THEN 1 END) AS ReturnedCount,
    COUNT(CASE WHEN ss.StatusName = 'Cancelled' THEN 1 END) AS CancelledCount,
    COUNT(CASE WHEN ss.StatusName IN ('Returned', 'Cancelled') THEN 1 END) AS TotalProblems,
    ROUND(COUNT(CASE WHEN ss.StatusName IN ('Returned', 'Cancelled') THEN 1 END) * 100.0 / COUNT(s.ShipmentID), 2) AS ProblemRate
FROM Branch b
JOIN Shipment s ON b.BranchID = s.BranchID
JOIN ShipmentStatus ss ON s.StatusID = ss.StatusID
GROUP BY b.BranchID, b.BranchName
HAVING COUNT(CASE WHEN ss.StatusName IN ('Returned', 'Cancelled') THEN 1 END) > 0
ORDER BY ProblemRate DESC;
-- COMMENT: Identifies branches with highest problem rates for operational audit

-- =====================================================
-- 29. Shipment weight analysis (Heavy vs Light impact on delivery time)
SELECT 
    CASE 
        WHEN TotalWeight < 2 THEN 'Light (<2kg)'
        WHEN TotalWeight BETWEEN 2 AND 5 THEN 'Medium (2-5kg)'
        ELSE 'Heavy (>5kg)'
    END AS WeightCategory,
    COUNT(DISTINCT s.ShipmentID) AS ShipmentCount,
    AVG(DATEDIFF(day, s.ShipmentDate, s.ActualDeliveryDate)) AS AvgDeliveryDays,
    AVG(s.ShipmentRating) AS AvgRating
FROM Shipment s
JOIN (
    SELECT ShipmentID, SUM(Weight) AS TotalWeight
    FROM Package
    GROUP BY ShipmentID
) AS ShipmentWeight ON s.ShipmentID = ShipmentWeight.ShipmentID
WHERE s.ActualDeliveryDate IS NOT NULL
GROUP BY 
    CASE 
        WHEN TotalWeight < 2 THEN 'Light (<2kg)'
        WHEN TotalWeight BETWEEN 2 AND 5 THEN 'Medium (2-5kg)'
        ELSE 'Heavy (>5kg)'
    END
ORDER BY AvgDeliveryDays DESC;
-- COMMENT: Heavy shipments take longer to deliver - may need special logistics

-- =====================================================
-- 30. Payment method performance analysis
SELECT 
    PaymentMethod,
    COUNT(*) AS TransactionCount,
    SUM(Amount) AS TotalAmount,
    AVG(Amount) AS AvgAmount,
    COUNT(CASE WHEN IsPaid = 1 THEN 1 END) AS PaidCount,
    COUNT(CASE WHEN IsPaid = 0 THEN 1 END) AS UnpaidCount,
    ROUND(COUNT(CASE WHEN IsPaid = 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS DefaultRate
FROM Payment
GROUP BY PaymentMethod
ORDER BY TotalAmount DESC;
-- COMMENT: Identifies which payment methods have highest default rates for policy adjustment

-- =====================================================
-- 31. Time-based delivery performance trend
SELECT 
    FORMAT(s.ShipmentDate, 'yyyy-MM') AS Month,
    COUNT(CASE WHEN s.ActualDeliveryDate <= s.EstimatedDeliveryDate THEN 1 END) AS OnTimeDeliveries,
    COUNT(CASE WHEN s.ActualDeliveryDate > s.EstimatedDeliveryDate THEN 1 END) AS LateDeliveries,
    ROUND(COUNT(CASE WHEN s.ActualDeliveryDate <= s.EstimatedDeliveryDate THEN 1 END) * 100.0 / 
          COUNT(CASE WHEN s.ActualDeliveryDate IS NOT NULL THEN 1 END), 2) AS OnTimeRate
FROM Shipment s
WHERE s.ActualDeliveryDate IS NOT NULL
GROUP BY FORMAT(s.ShipmentDate, 'yyyy-MM')
ORDER BY Month;
-- COMMENT: Tracks delivery performance trends over time - improving or getting worse?

-- =====================================================
-- 32. Driver workload and efficiency correlation
SELECT 
    d.FullName,
    COUNT(s.ShipmentID) AS TotalDeliveries,
    AVG(DATEDIFF(day, s.ShipmentDate, s.ActualDeliveryDate)) AS AvgDeliveryTime,
    AVG(s.ShipmentRating) AS AvgRating,
    AVG(p.Amount) AS AvgRevenuePerDelivery
FROM Driver d
JOIN Shipment s ON d.DriverID = s.DriverID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE s.ActualDeliveryDate IS NOT NULL AND p.IsPaid = 1
GROUP BY d.DriverID, d.FullName
ORDER BY AvgRating DESC;
-- COMMENT: Identifies if high-volume drivers have lower ratings (burnout indicator)

-- =====================================================
-- 33. Customer lifetime value prediction (CLV)
SELECT 
    c.FullName,
    COUNT(s.ShipmentID) AS TotalOrders,
    SUM(p.Amount) AS TotalRevenue,
    AVG(p.Amount) AS AvgOrderValue,
    DATEDIFF(day, MIN(s.ShipmentDate), MAX(s.ShipmentDate)) AS CustomerLifetimeDays,
    ROUND(SUM(p.Amount) / NULLIF(DATEDIFF(day, MIN(s.ShipmentDate), MAX(s.ShipmentDate)), 0) * 30, 2) AS MonthlyValue
FROM Customer c
JOIN Shipment s ON c.CustomerID = s.CustomerID
JOIN Payment p ON s.ShipmentID = p.ShipmentID
WHERE p.IsPaid = 1
GROUP BY c.CustomerID, c.FullName
HAVING COUNT(s.ShipmentID) > 1
ORDER BY MonthlyValue DESC;
-- COMMENT: Calculates monthly customer value to prioritize retention efforts

-- =====================================================
-- 34. Branch efficiency score (Delivery speed + Success rate)
SELECT 
    b.BranchName,
    COUNT(s.ShipmentID) AS TotalShipments,
    ROUND(AVG(CASE WHEN s.ActualDeliveryDate <= s.EstimatedDeliveryDate THEN 100 ELSE 0 END), 2) AS OnTimeScore,
    ROUND(COUNT(CASE WHEN s.StatusID = 5 THEN 1 END) * 100.0 / COUNT(s.ShipmentID), 2) AS SuccessScore,
    ROUND((AVG(CASE WHEN s.ActualDeliveryDate <= s.EstimatedDeliveryDate THEN 100 ELSE 0 END) + 
           COUNT(CASE WHEN s.StatusID = 5 THEN 1 END) * 100.0 / COUNT(s.ShipmentID)) / 2, 2) AS OverallEfficiencyScore
FROM Branch b
JOIN Shipment s ON b.BranchID = s.BranchID
WHERE s.ActualDeliveryDate IS NOT NULL
GROUP BY b.BranchID, b.BranchName
ORDER BY OverallEfficiencyScore DESC;
-- COMMENT: Composite score ranking branches by overall performance







