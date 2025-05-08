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
    address VARCHAR(100),
    phoneNumber VARCHAR(10),
    userType ENUM('customer', 'staff', 'admin'), 
    PRIMARY KEY (userId)
);

CREATE TABLE PRODUCTS(
     productId VARCHAR(10),
     productName VARCHAR(30),
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

-- Insert records into tables
INSERT INTO APP.USERS
VALUES
('101', 'First', 'Last', 'password', 'email@domain.com', '1 Street Avenue, Suburb 2000', '1234567890', 'customer'),
('102', 'James', 'Adams', '12345', 'james@email.com', '3 Avenue Road, Sydney 2222', '1234567890', 'staff'),
('103', 'Regina', 'Smith', 'unsecure', 'regina@yourspace.com', '666 Road Street, Parramatta 3650', '1234567890', 'admin'),
('104', 'Thor', 'Odinson', 'hammer', 'thunder@gods.com', '1234 Midgard Street, Midgard 0001', '1234567890', 'customer'),
('105', 'Ark', 'Antos', 'myths', 'hero@athens.com', '1 Street Lane, Pymble 2221', '1234567890', 'staff'),
('106', 'Maximum', 'Ride', 'fang', 'flying@theflock.com', '225 Nest Avenue, Tree 9999', '1234567890', 'admin'),
('107', 'Veronica', 'Mars', 'private', 'veronica@mars.com', '96 Ripe Road, Sydney 2000', '1234567890', 'customer'),
('108', 'Gohan', 'Son', 'books', 'gohan@sonfam.com', '123 Pod Street, West City 4562', '1234567890', 'staff'),
('109', 'John', 'Jackson', 'different', 'john@jackson.com', '123 Street Avenue, Suburb 1234', '1234567890', 'admin'),
('110', 'Jack', 'Johnson', 'different', 'jack@johnson.com', '321 Avenue Street, Brubus 4321', '1234567890', 'customer');


-- Examples of Table Interactions:
-- Insert into Users Table
-- INSERT INTO APP.USERS (customerId, firstName, lastName, password, email, dob, address)
-- VALUES ('101', 'First', 'Last', 'password', 'email@domain.com', '2025-01-01', '1 Street Avenue, Suburb 2000');


-- Select all rows from Users
-- SELECT * FROM USERS;

-- Select specific columns based on row values from Users
-- SELECT customerId, email FROM USERS WHERE lastName = 'Last' AND firstName = 'First';