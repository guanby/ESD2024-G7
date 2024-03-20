-- Create database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS GuestDB;
USE GuestDB;


CREATE TABLE IF NOT EXISTS Guest (
    GuestID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255) NOT NULL,
    Fullname VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    AccountCreatedDate DATE NOT NULL,
    LastLoginDate DATE NOT NULL,
    APIkey VARCHAR(255)
);
