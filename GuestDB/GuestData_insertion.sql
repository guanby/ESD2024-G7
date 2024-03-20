USE GuestDB;

INSERT INTO Guest (GuestID, Username, Password, Email, PhoneNumber, Fullname, DOB, AccountCreatedDate, LastLoginDate, APIkey)
VALUES 
    (1, 'user1', 'password1', 'user1@example.com', '1234567890', 'User One', '1990-01-01', '2024-03-20', '2024-03-20', 'abc12345###'),
    (2, 'user2', 'password2', 'user2@example.com', '9876543210', 'User Two', '1991-02-02', '2024-03-20', '2024-03-20', NULL),
    (3, 'user3', 'password3', 'user3@example.com', '5551234567', 'User Three', '1992-03-03', '2024-03-20', '2024-03-20', NULL),
    (4, 'user4', 'password4', 'user4@example.com', '4449876543', 'User Four', '1993-04-04', '2024-03-20', '2024-03-20', NULL),
    (5, 'user5', 'password5', 'user5@example.com', '2223334445', 'User Five', '1994-05-05', '2024-03-20', '2024-03-20', NULL);
