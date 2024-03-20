-- Create database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS TransactionDB;
USE TransactionDB;

CREATE TABLE Transaction (
    TxnID INT PRIMARY KEY AUTO_INCREMENT,
    GuestID VARCHAR(255) NOT NULL,
    RoomID VARCHAR(255) NOT NULL,
    Amount INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    TransactionDatetime DATE NOT NULL
);
