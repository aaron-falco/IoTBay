-- Create Database
CREATE DATABASE IoTBayDB;

-- Create Users Table
CREATE TABLE USERS(
    customerId VARCHAR(10),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    password VARCHAR(20),
    email VARCHAR(20),
    dob DATE,
    address VARCHAR(100),
    phoneNumber VARCHAR(12),
    PRIMARY KEY (customerId)
)

-- Insert into Users Table
INSERT INTO USERS (customerId, firstName, lastName, password, email, dob, address, phoneNumber)
VALUES ('101', 'First', 'Last', 'password', 'email@domain.com', 2025-01-01, '1 Street Avenue, Suburb 2000', '0412345678');

-- Select all rows from Users
SELECT * FROM USERS;

-- Select specific rows from Users
SELECT customerId, email FROM USERS WHERE lastName = 'Last' AND firstName = 'First';