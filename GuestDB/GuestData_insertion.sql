USE GuestDB;

INSERT INTO Guest (GuestName, Password, Email, PhoneNumber, Fullname, DOB, AccountCreatedDate, LastLoginDate, APIkey, CardNumber, CardExpiryDate, CVC)
VALUES 
('user1', 'hashed_password1', 'user1@example.com', '1234567890', 'User One', '1990-01-01', '2024-03-17', '2024-03-17', 'apikey1', '1234567890123456', '2024-12-01', '123'),
('user2', 'hashed_password2', 'user2@example.com', '2345678901', 'User Two', '1995-05-05', '2024-03-16', '2024-03-17', 'apikey2', '2345678901234567', '2025-01-01', '456'),
('user3', 'hashed_password3', 'user3@example.com', '3456789012', 'User Three', '1988-08-08', '2024-03-15', '2024-03-17', 'apikey3', '3456789012345678', '2024-11-01', '789'),
('user4', 'hashed_password4', 'user4@example.com', '4567890123', 'User Four', '1992-12-12', '2024-03-14', '2024-03-17', 'apikey4', '4567890123456789', '2024-10-01', '012'),
('user5', 'hashed_password5', 'user5@example.com', '5678901234', 'User Five', '1999-03-20', '2024-03-13', '2024-03-17', 'apikey5', '5678901234567890', '2024-09-01', '345');
