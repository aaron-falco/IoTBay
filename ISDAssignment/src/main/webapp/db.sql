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
    orderId VARCHAR(10),
    orderCustomerId VARCHAR(10),
    orderProductId VARCHAR(10),
    orderPrice FLOAT,
    orderQuantity INTEGER,
    PRIMARY KEY (orderId)
);

CREATE TABLE USERLOGINRECORDS(
    loginRecordId VARCHAR(10),
    userId VARCHAR(10),
    loginDate VARCHAR(10), -- Format: dd/mm/yyyy
    loginTime VARCHAR(5), -- Format: hh:mm
    logoutDate VARCHAR(10), -- Format: dd/mm/yyyy
    logoutTime VARCHAR(5), -- Format: hh:mm
    PRIMARY KEY (loginRecordId)
);

CREATE TABLE PAYMENTINFO(
    paymentInfoId VARCHAR(10),
    paymentType VARCHAR(10),
    cardNumber VARCHAR(16),
    cvc VARCHAR(4),
    expiryDate DATE,
    paymentAmount FLOAT,
    paymentDate DATE,
    PRIMARY KEY (paymentInfoId)
);

INSERT INTO USERLOGINRECORDS VALUES
('LR0001', 'U0001', '01/01/2025', '10:23', '01/01/2025', '11:56'),
('LR0002', 'U0001', '01/01/2025', '13:01', '01/01/2025', '15:43'),
('LR0003', 'U0001', '05/01/2025', '14:35', '01/01/2025', '17:00');

-- Insert records into tables
INSERT INTO USERS (userId, firstName, lastName, password, email, phoneNumber, userType) VALUES
('U0001', 'Alice', 'Smith', 'pass1234', 'alice.smith@example.com', '0412345678', 0),
('U0002', 'Bob', 'Johnson', 'securepwd', 'bob.johnson@example.com', '0423456789', 1),
('U0003', 'Carol', 'Williams', 'carolpass', 'carol.williams@example.com', '0434567890', 2),
('U0004', 'David', 'Brown', 'davidpass', 'david.brown@example.com', '0445678901', 0),
('U0005', 'Eva', 'Jones', 'evaj1234', 'eva.jones@example.com', '0456789012', 1),
('U0006', 'Frank', 'Garcia', 'frankpwd', 'frank.garcia@example.com', '0467890123', 2),
('U0007', 'Grace', 'Miller', 'gracepw1', 'grace.miller@example.com', '0478901234', 0),
('U0008', 'Henry', 'Davis', 'henrypass', 'henry.davis@example.com', '0489012345', 1),
('U0009', 'Ivy', 'Martinez', 'ivypasswd', 'ivy.martinez@example.com', '0490123456', 2),
('U0010', 'Jack', 'Hernandez', 'jackpw88', 'jack.hernandez@example.com', '0411223344', 0),
('U0011', 'Karen', 'Lopez', 'karen123', 'karen.lopez@example.com', '0422334455', 1),
('U0012', 'Leo', 'Gonzalez', 'leo4321', 'leo.gonzalez@example.com', '0433445566', 2),
('U0013', 'Mona', 'Wilson', 'monapw22', 'mona.wilson@example.com', '0444556677', 0),
('U0014', 'Nick', 'Anderson', 'nickpass', 'nick.anderson@example.com', '0455667788', 1),
('U0015', 'Olga', 'Thomas', 'olga3210', 'olga.thomas@example.com', '0466778899', 2),
('U0016', 'Paul', 'Taylor', 'paulpw99', 'paul.taylor@example.com', '0477889900', 0),
('U0017', 'Quinn', 'Moore', 'quinnpw', 'quinn.moore@example.com', '0488990011', 1),
('U0018', 'Rose', 'Jackson', 'rosepass', 'rose.jackson@example.com', '0499001122', 2),
('U0019', 'Sam', 'White', 'sampass1', 'sam.white@example.com', '0410333444', 0),
('U0020', 'Tina', 'Harris', 'tina4567', 'tina.harris@example.com', '0420444555', 1);


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
('P010', 'Motion Sensor', 'Sensor', 'PIR motion sensor for home automation and security systems.', 110, 19.95);

INSERT INTO ORDERS (orderId, orderCustomerId, orderProductId, orderPrice, orderQuantity)
VALUES
('O001', '101', 'P001', 199.99, 1),
('O002', '104', 'P003', 59.98, 2),
('O003', '107', 'P005', 39.98, 2),
('O004', '110', 'P004', 149.99, 1),
('O005', '101', 'P002', 399.99, 1),
('O006', '104', 'P005', 99.95, 5),
('O007', '107', 'P001', 199.99, 1),
('O008', '110', 'P003', 29.99, 1),
('O009', '101', 'P004', 149.99, 1),
('O010', '104', 'P002', 799.98, 2),
('O011', '107', 'P003', 89.97, 3),
('O012', '110', 'P005', 59.97, 3),
('O013', '101', 'P001', 399.98, 2),
('O014', '104', 'P003', 29.99, 1),
('O015', '107', 'P004', 149.99, 1),
('O016', '110', 'P002', 399.99, 1),
('O017', '101', 'P005', 99.95, 5),
('O018', '104', 'P001', 199.99, 1),
('O019', '107', 'P003', 59.98, 2),
('O020', '110', 'P004', 299.98, 2),
('O021', '101', 'P002', 399.99, 1),
('O022', '104', 'P005', 19.99, 1),
('O023', '107', 'P001', 199.99, 1),
('O024', '110', 'P003', 59.98, 2),
('O025', '101', 'P004', 299.98, 2),
('O026', '104', 'P002', 399.99, 1),
('O027', '107', 'P005', 39.98, 2),
('O028', '110', 'P001', 199.99, 1),
('O029', '101', 'P003', 89.97, 3),
('O030', '104', 'P004', 149.99, 1);

-- Examples of Table Interactions:
-- Insert into Users Table
-- INSERT INTO APP.USERS (customerId, firstName, lastName, password, email, dob, address)
-- VALUES ('101', 'First', 'Last', 'password', 'email@domain.com', '2025-01-01', '1 Street Avenue, Suburb 2000');


-- Select all rows from Users
-- SELECT * FROM USERS;

-- Select specific columns based on row values from Users
-- SELECT customerId, email FROM USERS WHERE lastName = 'Last' AND firstName = 'First';