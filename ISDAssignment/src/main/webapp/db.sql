-- Note: to properly implament this database would require another table linking ORDERS and PRODUCTS due to the many to many relationship.
-- As it stands, each order will only deal with a single product and when a customer orders multiple products they will technically create multiple orders.

-- Create Database
CREATE DATABASE IoTBayDB;

-- Create Tables
CREATE TABLE USERS(
    userId VARCHAR(10),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    password VARCHAR(20),
    email VARCHAR(100),
    phoneNumber VARCHAR(10),
    userType INT, -- 0 = customer, 1 = staff, 2 = admins
    PRIMARY KEY (userId)
);

CREATE TABLE PRODUCTS(
     productId VARCHAR(10),
     productName VARCHAR(30),
     productType VARCHAR(30),
     productDescription VARCHAR(500),
     quantity INTEGER,
     price FLOAT,
     PRIMARY KEY (productId)
);

CREATE TABLE ORDERS(
    orderId VARCHAR(30),
    orderCustomerId VARCHAR(30),
    orderProductId VARCHAR(30),
    orderPrice FLOAT,
    orderQuantity INTEGER,
    orderStatus VARCHAR(30), -- Can be Unprocessed, Processed, Completed or Cancelled
    PRIMARY KEY (orderId)
);

CREATE TABLE USERLOGINRECORDS(
    loginRecordId VARCHAR(10),
    userId VARCHAR(10),
    loginDate VARCHAR(10), -- Format: yyyy-mm-dd
    loginTime VARCHAR(5), -- Format: hh:mm
    logoutDate VARCHAR(10), -- Format: yyyy-mm-dd
    logoutTime VARCHAR(5), -- Format: hh:mm
    PRIMARY KEY (loginRecordId)
);

CREATE TABLE PAYMENTINFO(
    paymentInfoId VARCHAR(30),
    paymentType VARCHAR(10),
    cardNumber VARCHAR(16),
    cvc VARCHAR(4),
    expiryDate DATE,
    paymentAmount FLOAT,
    paymentDate DATE,
    PRIMARY KEY (paymentInfoId)
);


CREATE TABLE PAYMENTS (
    paymentInfoId VARCHAR(50) PRIMARY KEY,
    ORDERID VARCHAR(50),
    paymentType VARCHAR(50),
    cardNumber VARCHAR(20),
    cvc VARCHAR(10),
    expiryDate VARCHAR(10),
    paymentAmount FLOAT,
    paymentDate VARCHAR(20)
);

INSERT INTO ISDUser.UserLoginRecords (loginRecordId, userId, loginDate, loginTime, logoutDate, logoutTime) VALUES
('UR1', 'U12', '2025-05-01', '08:15', '2025-05-01', '16:30'),
('UR2', 'U7', '2025-05-01', '09:00', '2025-05-01', '17:00'),
('UR3', 'U19', '2025-05-01', '07:45', '2025-05-01', '15:45'),
('UR4', 'U3', '2025-05-01', '10:00', '2025-05-01', '18:00'),
('UR5', 'U15', '2025-05-01', '08:30', '2025-05-01', '16:45'),
('UR6', 'U6', '2025-05-02', '08:10', '2025-05-02', '16:20'),
('UR7', 'U18', '2025-05-02', '09:05', '2025-05-02', '17:10'),
('UR8', 'U2', '2025-05-02', '08:25', '2025-05-02', '16:35'),
('UR9', 'U11', '2025-05-02', '07:50', '2025-05-02', '15:50'),
('UR10', 'U20', '2025-05-02', '10:15', '2025-05-02', '18:15'),
('UR11', 'U5', '2025-05-03', '08:05', '2025-05-03', '16:10'),
('UR12', 'U14', '2025-05-03', '08:50', '2025-05-03', '17:05'),
('UR13', 'U9', '2025-05-03', '09:15', '2025-05-03', '17:30'),
('UR14', 'U17', '2025-05-03', '07:40', '2025-05-03', '15:30'),
('UR15', 'U1', '2025-05-03', '08:20', '2025-05-03', '16:25'),
('UR16', 'U8', '2025-05-04', '08:00', '2025-05-04', '16:00'),
('UR17', 'U13', '2025-05-04', '09:10', '2025-05-04', '17:20'),
('UR18', 'U4', '2025-05-04', '08:35', '2025-05-04', '16:40'),
('UR19', 'U16', '2025-05-04', '10:00', '2025-05-04', '18:00'),
('UR20', 'U10', '2025-05-04', '07:55', '2025-05-04', '15:55'),
('UR21', 'U3', '2025-05-05', '08:10', '2025-05-05', '16:15'),
('UR22', 'U12', '2025-05-05', '09:00', '2025-05-05', '17:00'),
('UR23', 'U7', '2025-05-05', '08:45', '2025-05-05', '16:50'),
('UR24', 'U19', '2025-05-05', '07:30', '2025-05-05', '15:30'),
('UR25', 'U6', '2025-05-05', '08:30', '2025-05-05', '16:30');

-- Insert records into tables
INSERT INTO USERS (userId, firstName, lastName, password, email, phoneNumber, userType) VALUES
('U1', 'Alice', 'Smith', 'pass1234', 'alice.smith@example.com', '0412345678', 0),
('U2', 'Bob', 'Johnson', 'securepwd', 'bob.johnson@example.com', '0423456789', 1),
('U3', 'Carol', 'Williams', 'carolpass', 'carol.williams@example.com', '0434567890', 2),
('U4', 'David', 'Brown', 'davidpass', 'david.brown@example.com', '0445678901', 0),
('U5', 'Eva', 'Jones', 'evaj1234', 'eva.jones@example.com', '0456789012', 1),
('U6', 'Frank', 'Garcia', 'frankpwd', 'frank.garcia@example.com', '0467890123', 2),
('U7', 'Grace', 'Miller', 'gracepw1', 'grace.miller@example.com', '0478901234', 0),
('U8', 'Henry', 'Davis', 'henrypass', 'henry.davis@example.com', '0489012345', 1),
('U9', 'Ivy', 'Martinez', 'ivypasswd', 'ivy.martinez@example.com', '0490123456', 2),
('U10', 'Jack', 'Hernandez', 'jackpw88', 'jack.hernandez@example.com', '0411223344', 0),
('U11', 'Karen', 'Lopez', 'karen123', 'karen.lopez@example.com', '0422334455', 1),
('U12', 'Leo', 'Gonzalez', 'leo4321', 'leo.gonzalez@example.com', '0433445566', 2),
('U13', 'Mona', 'Wilson', 'monapw22', 'mona.wilson@example.com', '0444556677', 0),
('U14', 'Nick', 'Anderson', 'nickpass', 'nick.anderson@example.com', '0455667788', 1),
('U15', 'Olga', 'Thomas', 'olga3210', 'olga.thomas@example.com', '0466778899', 2),
('U16', 'Paul', 'Taylor', 'paulpw99', 'paul.taylor@example.com', '0477889900', 0),
('U17', 'Quinn', 'Moore', 'quinnpw', 'quinn.moore@example.com', '0488990011', 1),
('U18', 'Rose', 'Jackson', 'rosepass', 'rose.jackson@example.com', '0499001122', 2),
('U19', 'Sam', 'White', 'sampass1', 'sam.white@example.com', '0410333444', 0),
('U20', 'Tina', 'Harris', 'tina4567', 'tina.harris@example.com', '0420444555', 1);


INSERT INTO PRODUCTS (productId, productName, productType, productDescription, quantity, price)
VALUES 
('P001', 'Smart Thermostat', 'Thermostat', 'WiFi-enabled smart thermostat with mobile control and scheduling.', 50, 199.99),
('P002', 'Security Camera', 'Camera', '1080p indoor/outdoor camera with motion detection and night vision.', 100, 89.95),
('P003', 'Smart Light Bulb', 'Lighting', 'Color-changing LED bulb compatible with Alexa and Google Home.', 200, 14.99),
('P004', 'Smart Door Lock', 'Lock', 'Bluetooth-enabled door lock with keypad and remote access.', 40, 149.50),
('P005', 'Water Leak Sensor', 'Sensor', 'IoT sensor that alerts when water is detected in basements or kitchens.', 75, 39.95),
('P006', 'Smart Plug', 'Plug', 'WiFi smart plug with energy monitoring features.', 150, 22.49),
('P007', 'Air Quality Monitor', 'Monitor', 'Tracks CO2, VOCs, and PM2.5 for better home air quality.', 60, 129.00),
('P008', 'IoT Light Strip', 'Lighting', 'RGB light strip with app control and voice assistant support.', 120, 34.99),
('P009', 'Smart Speaker Hub', 'Hub', 'Centralized control for IoT devices with built-in voice assistant.', 90, 179.00),
('P010', 'Motion Sensor', 'Sensor', 'PIR motion sensor for home automation and security systems.', 110, 19.95),
('P011', 'Smart Smoke Detector', 'Sensor', 'WiFi-enabled smoke and carbon monoxide detector with mobile alerts.', 80, 59.99),
('P012', 'Smart Garage Opener', 'Controller', 'Smart garage door controller with real-time open/close status.', 45, 99.95),
('P013', 'Smart Sprinkler Controller', 'Controller', 'Automated irrigation scheduling with weather-based adjustments.', 30, 149.00),
('P014', 'Smart Mirror', 'Display', 'Touch-enabled mirror with weather, calendar, and news display.', 20, 299.99),
('P015', 'Energy Monitoring System', 'Monitor', 'Whole-home energy usage monitor with detailed analytics.', 25, 199.00),
('P016', 'IoT Pet Feeder', 'Appliance', 'WiFi-controlled pet feeder with portion scheduling and video camera.', 35, 124.95),
('P017', 'Smart Window Sensor', 'Sensor', 'Contact sensor for windows with tamper detection and mobile alerts.', 100, 18.50),
('P018', 'Smart Blinds Controller', 'Controller', 'Automated blinds opener with schedule and light sensor integration.', 40, 89.99),
('P019', 'IoT Coffee Maker', 'Appliance', 'Schedule coffee brewing via app or voice assistant integration.', 25, 149.99),
('P020', 'Smart Water Valve', 'Valve', 'Remote-controlled valve for automatic shutoff during leaks.', 50, 109.00);

INSERT INTO ORDERS (orderId, orderCustomerId, orderProductId, orderPrice, orderQuantity, orderStatus)
VALUES
('O001', 'U1', 'P001', 199.99, 1, 'Completed'),
('O002', 'U5', 'P003', 59.98, 2, 'Processed'),
('O003', 'U5', 'P005', 39.98, 2, 'Unprocessed'),
('O004', 'U7', 'P004', 149.99, 1, 'Cancelled'),
('O005', 'U7', 'P002', 399.99, 1, 'Completed'),
('O006', 'U1', 'P005', 99.95, 5, 'Completed'),
('O007', 'U4', 'P001', 199.99, 1, 'Unprocessed'),
('O008', 'U20', 'P003', 29.99, 1, 'Cancelled'),
('O009', 'U14', 'P004', 149.99, 1, 'Processed'),
('O010', 'U4', 'P002', 799.98, 2, 'Unprocessed'),
('O011', 'U5', 'P003', 89.97, 3, 'Completed'),
('O012', 'U14', 'P005', 59.97, 3, 'Completed'),
('O013', 'U15', 'P001', 399.98, 2, 'Completed'),
('O014', 'U1', 'P003', 29.99, 1, 'Completed'),
('O015', 'U15', 'P004', 149.99, 1, 'Completed'),
('O016', 'U10', 'P002', 399.99, 1, 'Completed'),
('O017', 'U10', 'P005', 99.95, 5, 'Completed'),
('O018', 'U1', 'P001', 199.99, 1, 'Completed'),
('O019', 'U7', 'P003', 59.98, 2, 'Completed'),
('O020', 'U1', 'P004', 299.98, 2, 'Completed'),
('O021', 'U1', 'P002', 399.99, 1, 'Completed'),
('O022', 'U19', 'P005', 19.99, 1, 'Completed'),
('O023', 'U20', 'P001', 199.99, 1, 'Completed'),
('O024', 'U19', 'P003', 59.98, 2, 'Completed'),
('O025', 'U19', 'P004', 299.98, 2, 'Completed'),
('O026', 'U19', 'P002', 399.99, 1, 'Completed'),
('O027', 'U19', 'P005', 39.98, 2, 'Completed'),
('O028', 'U19', 'P001', 199.99, 1, 'Completed'),
('O029', 'U1', 'P003', 89.97, 3, 'Completed'),
('O030', 'U19', 'P004', 149.99, 1, 'Completed');

INSERT INTO PAYMENTINFO (paymentInfoId, paymentType, cardNumber, cvc, expiryDate, paymentAmount, paymentDate) VALUES
('P1001', 'Credit', '4111111111111111', '123', '2026-05-01', 125.00, '2025-05-01'),
('P1002', 'Debit', '4222222222222222', '456', '2025-12-15', 230.50, '2025-05-02'),
('P1003', 'PayPal', '5333333333333333', '789', '2025-09-30', 89.99, '2025-05-03'),
('P1004', 'Credit', '4444444444444444', '321', '2027-01-01', 150.25, '2025-05-04'),
('P1005', 'Debit', '5555555555555555', '654', '2026-03-01', 200.00, '2025-05-05'),
('P1006', 'Credit', '6666666666666666', '987', '2025-10-01', 110.75, '2025-05-06'),
('P1007', 'PayPal', '7777777777777777', '111', '2026-06-15', 330.00, '2025-05-07'),
('P1008', 'Credit', '8888888888888888', '222', '2027-02-28', 410.00, '2025-05-08'),
('P1009', 'Debit', '9999999999999999', '333', '2025-08-10', 95.00, '2025-05-09'),
('P1010', 'Credit', '1234567812345678', '444', '2026-04-25', 175.00, '2025-05-10'),
('P1011', 'PayPal', '2345678923456789', '555', '2025-11-11', 60.00, '2025-05-11'),
('P1012', 'Debit', '3456789034567890', '666', '2025-07-07', 120.00, '2025-05-12'),
('P1013', 'Credit', '4567890145678901', '777', '2026-12-12', 500.00, '2025-05-13'),
('P1014', 'PayPal', '5678901256789012', '888', '2025-09-09', 75.25, '2025-05-14'),
('P1015', 'Debit', '6789012367890123', '999', '2026-10-10', 300.00, '2025-05-15'),
('P1016', 'Credit', '7890123478901234', '000', '2025-06-06', 410.00, '2025-05-16'),
('P1017', 'PayPal', '8901234589012345', '112', '2026-07-07', 235.00, '2025-05-17'),
('P1018', 'Debit', '9012345690123456', '223', '2026-05-05', 180.00, '2025-05-18'),
('P1019', 'Credit', '0123456701234567', '334', '2025-03-03', 95.75, '2025-05-19'),
('P1020', 'PayPal', '1472583692583691', '445', '2027-09-09', 60.00, '2025-05-20');

INSERT INTO PAYMENTS (paymentInfoId, ORDERID, paymentType, cardNumber, cvc, expiryDate, paymentAmount, paymentDate) VALUES
('P1001', 'O1001', 'Credit', '4111111111111111', '123', '05/26', 125.00, '2025-05-01'),
('P1002', 'O1002', 'Debit', '4222222222222222', '456', '12/25', 230.50, '2025-05-02'),
('P1003', 'O1003', 'PayPal', '5333333333333333', '789', '09/25', 89.99, '2025-05-03'),
('P1004', 'O1004', 'Credit', '4444444444444444', '321', '01/27', 150.25, '2025-05-04'),
('P1005', 'O1005', 'Debit', '5555555555555555', '654', '03/26', 200.00, '2025-05-05'),
('P1006', 'O1006', 'Credit', '6666666666666666', '987', '10/25', 110.75, '2025-05-06'),
('P1007', 'O1007', 'PayPal', '7777777777777777', '111', '06/26', 330.00, '2025-05-07'),
('P1008', 'O1008', 'Credit', '8888888888888888', '222', '02/27', 410.00, '2025-05-08'),
('P1009', 'O1009', 'Debit', '9999999999999999', '333', '08/25', 95.00, '2025-05-09'),
('P1010', 'O1010', 'Credit', '1234567812345678', '444', '04/26', 175.00, '2025-05-10'),
('P1011', 'O1011', 'PayPal', '2345678923456789', '555', '11/25', 60.00, '2025-05-11'),
('P1012', 'O1012', 'Debit', '3456789034567890', '666', '07/25', 120.00, '2025-05-12'),
('P1013', 'O1013', 'Credit', '4567890145678901', '777', '12/26', 500.00, '2025-05-13'),
('P1014', 'O1014', 'PayPal', '5678901256789012', '888', '09/25', 75.25, '2025-05-14'),
('P1015', 'O1015', 'Debit', '6789012367890123', '999', '10/26', 300.00, '2025-05-15'),
('P1016', 'O1016', 'Credit', '7890123478901234', '000', '06/25', 410.00, '2025-05-16'),
('P1017', 'O1017', 'PayPal', '8901234589012345', '112', '07/26', 235.00, '2025-05-17'),
('P1018', 'O1018', 'Debit', '9012345690123456', '223', '05/26', 180.00, '2025-05-18'),
('P1019', 'O1019', 'Credit', '0123456701234567', '334', '03/25', 95.75, '2025-05-19'),
('P1020', 'O1020', 'PayPal', '1472583692583691', '445', '09/27', 60.00, '2025-05-20');



-- Examples of Table Interactions:
-- Insert into Users Table
-- INSERT INTO APP.USERS (customerId, firstName, lastName, password, email, dob, address)
-- VALUES ('101', 'First', 'Last', 'password', 'email@domain.com', '2025-01-01', '1 Street Avenue, Suburb 2000');


-- Select all rows from Users
-- SELECT * FROM USERS;

-- Select specific columns based on row values from Users
-- SELECT customerId, email FROM USERS WHERE lastName = 'Last' AND firstName = 'First';