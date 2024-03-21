SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Create database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;

-- Drop the table if it exists to avoid errors in case you're running this script again
DROP TABLE IF EXISTS Rooms;

-- Rooms Table
CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    ThemeName VARCHAR(255) NOT NULL,
    BedType ENUM('one double bed', 'two double beds', 'two single beds') NOT NULL,
    Date DATE NOT NULL,
    IsAvailable BOOLEAN NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,  -- Assuming up to 99999999.99 in price
    -- Unique constraint to ensure there's only one availability record per room per date
    UNIQUE (RoomID, Date)
) ENGINE=InnoDB;



