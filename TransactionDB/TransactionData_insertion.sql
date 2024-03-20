USE TransactionDB;

INSERT INTO Transaction (TxnID, GuestID, RoomID, Amount, Status, TransactionDatetime)
VALUES 
    (1, '1', '101', 100, 'Pending', '2024-03-20 08:00:00'),
    (2, '2', '201', 150, 'Completed', '2024-03-21 10:23:43'),
    (3, '3', '301', 200, 'Pending', '2024-03-22 13:45:21'),
    (4, '4', '401', 250, 'Completed', '2024-03-23 15:20:00'),
    (5, '5', '501', 300, 'Pending', '2024-03-24 18:10:08');
