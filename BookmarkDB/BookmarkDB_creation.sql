-- Create database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS BookmarkDB;
USE BookmarkDB;


CREATE TABLE IF NOT EXISTS Bookmarks (
    BookmarkID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT,
    RoomID INT
);