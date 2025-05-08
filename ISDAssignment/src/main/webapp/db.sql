-- Note: to properly implament this database would require another table linking ORDERS and PRODUCTS due to the many to many relationship.
-- As it stands, each order will only deal with a single product and when a customer orders multiple products they will technically create multiple orders.

-- Create Database
CREATE DATABASE IoTBayDB;

-- Create Tables
CREATE TABLE STAFF(
    staffId VARCHAR(10),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    password VARCHAR(20),
    email VARCHAR(20),
    PRIMARY KEY (staffId)
);

CREATE TABLE CUSTOMERS(
    customerId VARCHAR(10),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    password VARCHAR(20),
    email VARCHAR(20),
    dob DATE,
    address VARCHAR(100),
    cardNumber VARCHAR(12),
    ccv VARCHAR(3),
    PRIMARY KEY (customerId)
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

-- Insert records into tables
INSERT INTO APP.CUSTOMERS
VALUES
('101', 'First', 'Last', 'password', 'email@domain.com', '2025-01-01', '1 Street Avenue, Suburb 2000', '1234567890', '123'),
('102', 'James', 'Adams', '12345', 'james@email.com', '1985-10-10', '3 Avenue Road, Sydney 2222', '1234567890', '123'),
('103', 'Regina', 'Smith', 'unsecure', 'regina@yourspace.com', '2003-09-08', '666 Road Street, Parramatta 3650', '1234567890', '123'),
('104', 'Thor', 'Odinson', 'hammer', 'thunder@gods.com', '2005-09-06', '1234 Midgard Street, Midgard 0001', '1234567890', '123'),
('105', 'Ark', 'Antos', 'myths', 'hero@athens.com', '1996-01-02', '1 Street Lane, Pymble 2221', '1234567890', '123'),
('106', 'Maximum', 'Ride', 'fang', 'flying@theflock.com', '1997-05-08', '225 Nest Avenue, Tree 9999', '1234567890', '123'),
('107', 'Veronica', 'Mars', 'private', 'veronica@mars.com', '1982-06-02', '96 Ripe Road, Sydney 2000', '1234567890', '123'),
('108', 'Gohan', 'Son', 'books', 'gohan@sonfam.com', '2001-09-06', '123 Pod Street, West City 4562', '1234567890', '123'),
('109', 'John', 'Jackson', 'different', 'john@jackson.com', '1960-01-01', '123 Street Avenue, Suburb 1234', '1234567890', '123'),
('110', 'Jack', 'Johnson', 'different', 'jack@johnson.com', '1960-01-01', '321 Avenue Street, Brubus 4321', '1234567890', '123');


-- Examples of Table Interactions:
-- Insert into Users Table
-- INSERT INTO APP.USERS (customerId, firstName, lastName, password, email, dob, address)
-- VALUES ('101', 'First', 'Last', 'password', 'email@domain.com', '2025-01-01', '1 Street Avenue, Suburb 2000');


-- Select all rows from Users
-- SELECT * FROM USERS;

-- Select specific columns based on row values from Users
-- SELECT customerId, email FROM USERS WHERE lastName = 'Last' AND firstName = 'First';