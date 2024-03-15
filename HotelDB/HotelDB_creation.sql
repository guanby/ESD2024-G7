SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Create database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS HotelDB2;
USE HotelDB2;

-- ThemedRooms Table
CREATE TABLE ThemedRooms (
    ThemeID INT AUTO_INCREMENT PRIMARY KEY,
    ThemeName VARCHAR(255) NOT NULL,
    BedType ENUM('one double bed', 'two double beds') NOT NULL
) ENGINE=InnoDB;

-- Rooms Table
CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    ThemeID INT,
    RoomNumber VARCHAR(50) NOT NULL,
    UNIQUE (RoomNumber),
    CONSTRAINT fk_Theme
        FOREIGN KEY (ThemeID)
        REFERENCES ThemedRooms(ThemeID)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Availability Table
CREATE TABLE Availability (
    AvailabilityID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    Date DATE NOT NULL,
    IsAvailable BOOLEAN NOT NULL,
    CONSTRAINT fk_Room
        FOREIGN KEY (RoomID)
        REFERENCES Rooms(RoomID)
        ON DELETE CASCADE,
    -- Unique constraint to ensure there's only one availability record per room per date
    UNIQUE (RoomID, Date)
) ENGINE=InnoDB;





