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
    email VARCHAR(20),
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
    loginDate DATE,
    loginTime TIME,
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

-- Insert records into tables
INSERT INTO USERS
VALUES
('101', 'First', 'Last', 'password', 'email@domain.com', '1234567890', 0);
-- ('102', 'James', 'Adams', '12345', 'james@email.com', '3 Avenue Road, Sydney 2222', '1234567890', 'staff'),
-- ('103', 'Regina', 'Smith', 'unsecure', 'regina@yourspace.com', '666 Road Street, Parramatta 3650', '1234567890', 'admin'),
-- ('104', 'Thor', 'Odinson', 'hammer', 'thunder@gods.com', '1234 Midgard Street, Midgard 0001', '1234567890', 'customer'),
-- ('105', 'Ark', 'Antos', 'myths', 'hero@athens.com', '1 Street Lane, Pymble 2221', '1234567890', 'staff'),
-- ('106', 'Maximum', 'Ride', 'fang', 'flying@theflock.com', '225 Nest Avenue, Tree 9999', '1234567890', 'admin'),
-- ('107', 'Veronica', 'Mars', 'private', 'veronica@mars.com', '96 Ripe Road, Sydney 2000', '1234567890', 'customer'),
-- ('108', 'Gohan', 'Son', 'books', 'gohan@sonfam.com', '123 Pod Street, West City 4562', '1234567890', 'staff'),
-- ('109', 'John', 'Jackson', 'different', 'john@jackson.com', '123 Street Avenue, Suburb 1234', '1234567890', 'admin'),
-- ('110', 'Jack', 'Johnson', 'different', 'jack@johnson.com', '321 Avenue Street, Brubus 4321', '1234567890', 'customer');

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

-- Examples of Table Interactions:
-- Insert into Users Table
-- INSERT INTO APP.USERS (customerId, firstName, lastName, password, email, dob, address)
-- VALUES ('101', 'First', 'Last', 'password', 'email@domain.com', '2025-01-01', '1 Street Avenue, Suburb 2000');


-- Select all rows from Users
-- SELECT * FROM USERS;

-- Select specific columns based on row values from Users
-- SELECT customerId, email FROM USERS WHERE lastName = 'Last' AND firstName = 'First';