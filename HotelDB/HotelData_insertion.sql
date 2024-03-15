

USE HotelDB;

INSERT INTO ThemedRooms (ThemeID, ThemeName, BedType) VALUES
(1, 'Safari Adventure', 'one double bed'),
(2, 'Ocean Bliss', 'two double beds'),
(3, 'Mountain Retreat', 'one double bed'),
(4, 'Urban Modern', 'one double bed'),
(5, 'Tropical Paradise', 'two double beds'),
(6, 'Disney Land', 'one double bed'),
(7, 'Futuristic', 'two double beds'),
(8, 'Vintage', 'one double bed'),
(9, 'Royal Suite', 'two double beds'),
(10, 'Space Odyssey', 'one double bed'),
(11, 'Art Deco', 'two double beds'),
(12, 'Taylor Swift', 'one double bed'),
(13, 'Gothic Medieval', 'two double beds'),
(14, 'Jungle Bungalow', 'one double bed'),
(15, 'Ice World', 'two double beds');

INSERT INTO Rooms (ThemeID, RoomNumber) VALUES
(1, '101'), (1, '102'),    -- Safari Adventure
(2, '201'), (2, '202'),    -- Ocean Bliss
(3, '301'), (3, '302'),    -- Mountain Retreat
(4, '401'), (4, '402'),    -- Urban Modern
(5, '501'), (5, '502'),    -- Tropical Paradise
(6, '601'),                -- Disney Land
(7, '701'),                -- Futuristic
(8, '801'),                -- Vintage
(9, '901'), (9,'902'),     -- Royal Suite
(10, '1001'),              -- Space Odyssey
(11, '1101'),              -- Art Deco
(12, '1201'), (12,'1202'), -- Taylor Swift
(13, '1301'),              -- Gothic Medieval
(14, '1401'), (14,'1402'), -- Jungle Bungalow
(15, '141');              -- Ice World

-- Expanding availability for each room over a month, with varied availability
-- true for available and false for not available
INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(1, '2024-04-01', true), (1, '2024-04-02', false), (1, '2024-04-03', true), (1, '2024-04-04', false), (1, '2024-04-05', true),
(1, '2024-04-06', true), (1, '2024-04-07', true), (1, '2024-04-08', false), (1, '2024-04-09', true), (1, '2024-04-10', false),
(1, '2024-04-11', true), (1, '2024-04-12', true), (1, '2024-04-13', false), (1, '2024-04-14', true), (1, '2024-04-15', true),
(1, '2024-04-16', true), (1, '2024-04-17', false), (1, '2024-04-18', true), (1, '2024-04-19', true), (1, '2024-04-20', false),
(1, '2024-04-21', true), (1, '2024-04-22', false), (1, '2024-04-23', true), (1, '2024-04-24', true), (1, '2024-04-25', false),
(1, '2024-04-26', true), (1, '2024-04-27', true), (1, '2024-04-28', false), (1, '2024-04-29', true), (1, '2024-04-30', true),
(1, '2024-05-01', false), (1, '2024-05-02', true), (1, '2024-05-03', false), (1, '2024-05-04', true), (1, '2024-05-05', true),
(1, '2024-05-06', true), (1, '2024-05-07', true), (1, '2024-05-08', false), (1, '2024-05-09', true), (1, '2024-05-10', false),
(1, '2024-05-11', true), (1, '2024-05-12', false), (1, '2024-05-13', true), (1, '2024-05-14', true), (1, '2024-05-15', false),
(1, '2024-05-16', true), (1, '2024-05-17', true), (1, '2024-05-18', false), (1, '2024-05-19', true), (1, '2024-05-20', true),
(1, '2024-05-21', false), (1, '2024-05-22', true), (1, '2024-05-23', false), (1, '2024-05-24', true), (1, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(2, '2024-04-01', false), (2, '2024-04-02', false), (2, '2024-04-03', true), (2, '2024-04-04', false), (2, '2024-04-05', true),
(2, '2024-04-06', true), (2, '2024-04-07', true), (2, '2024-04-08', true), (2, '2024-04-09', false), (2, '2024-04-10', false),
(2, '2024-04-11', true), (2, '2024-04-12', true), (2, '2024-04-13', false), (2, '2024-04-14', true), (2, '2024-04-15', false),
(2, '2024-04-16', false), (2, '2024-04-17', false), (2, '2024-04-18', true), (2, '2024-04-19', true), (2, '2024-04-20', false),
(2, '2024-04-21', true), (2, '2024-04-22', false), (2, '2024-04-23', true), (2, '2024-04-24', false), (2, '2024-04-25', true),
(2, '2024-04-26', true), (2, '2024-04-27', true), (2, '2024-04-28', false), (2, '2024-04-29', true), (2, '2024-04-30', true),
(2, '2024-05-01', false), (2, '2024-05-02', true), (2, '2024-05-03', true), (2, '2024-05-04', true), (2, '2024-05-05', true),
(2, '2024-05-06', true), (2, '2024-05-07', true), (2, '2024-05-08', false), (2, '2024-05-09', true), (2, '2024-05-10', true),
(2, '2024-05-11', false), (2, '2024-05-12', false), (2, '2024-05-13', true), (2, '2024-05-14', false), (2, '2024-05-15', false),
(2, '2024-05-16', true), (2, '2024-05-17', true), (2, '2024-05-18', false), (2, '2024-05-19', true), (2, '2024-05-20', true),
(2, '2024-05-21', false), (2, '2024-05-22', true), (2, '2024-05-23', false), (2, '2024-05-24', true), (2, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(3, '2024-04-01', true), (3, '2024-04-02', false), (3, '2024-04-03', true), (3, '2024-04-04', false), (3, '2024-04-05', true),
(3, '2024-04-06', false), (3, '2024-04-07', true), (3, '2024-04-08', false), (3, '2024-04-09', true), (3, '2024-04-10', false),
(3, '2024-04-11', true), (3, '2024-04-12', true), (3, '2024-04-13', true), (3, '2024-04-14', true), (3, '2024-04-15', true),
(3, '2024-04-16', true), (3, '2024-04-17', false), (3, '2024-04-18', true), (3, '2024-04-19', true), (3, '2024-04-20', false),
(3, '2024-04-21', false), (3, '2024-04-22', false), (3, '2024-04-23', true), (3, '2024-04-24', true), (3, '2024-04-25', true),
(3, '2024-04-26', true), (3, '2024-04-27', true), (3, '2024-04-28', false), (3, '2024-04-29', true), (3, '2024-04-30', true),
(3, '2024-05-01', false), (3, '2024-05-02', true), (3, '2024-05-03', false), (3, '2024-05-04', true), (3, '2024-05-05', true),
(3, '2024-05-06', true), (3, '2024-05-07', true), (3, '2024-05-08', false), (3, '2024-05-09', true), (3, '2024-05-10', false),
(3, '2024-05-11', true), (3, '2024-05-12', false), (3, '2024-05-13', true), (3, '2024-05-14', false), (3, '2024-05-15', false),
(3, '2024-05-16', true), (3, '2024-05-17', true), (3, '2024-05-18', false), (3, '2024-05-19', true), (3, '2024-05-20', false),
(3, '2024-05-21', false), (3, '2024-05-22', true), (3, '2024-05-23', false), (3, '2024-05-24', true), (3, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(4, '2024-04-01', true), (4, '2024-04-02', false), (4, '2024-04-03', true), (4, '2024-04-04', false), (4, '2024-04-05', true),
(4, '2024-04-06', true), (4, '2024-04-07', true), (4, '2024-04-08', false), (4, '2024-04-09', true), (4, '2024-04-10', false),
(4, '2024-04-11', false), (4, '2024-04-12', true), (4, '2024-04-13', false), (4, '2024-04-14', true), (4, '2024-04-15', true),
(4, '2024-04-16', false), (4, '2024-04-17', false), (4, '2024-04-18', true), (4, '2024-04-19', true), (4, '2024-04-20', false),
(4, '2024-04-21', false), (4, '2024-04-22', false), (4, '2024-04-23', true), (4, '2024-04-24', true), (4, '2024-04-25', false),
(4, '2024-04-26', true), (4, '2024-04-27', true), (4, '2024-04-28', false), (4, '2024-04-29', true), (4, '2024-04-30', true),
(4, '2024-05-01', false), (4, '2024-05-02', false), (4, '2024-05-03', false), (4, '2024-05-04', true), (4, '2024-05-05', true),
(4, '2024-05-06', true), (4, '2024-05-07', true), (4, '2024-05-08', false), (4, '2024-05-09', true), (4, '2024-05-10', false),
(4, '2024-05-11', true), (4, '2024-05-12', false), (4, '2024-05-13', false), (4, '2024-05-14', true), (4, '2024-05-15', false),
(4, '2024-05-16', true), (4, '2024-05-17', true), (4, '2024-05-18', false), (4, '2024-05-19', true), (4, '2024-05-20', true),
(4, '2024-05-21', false), (4, '2024-05-22', true), (4, '2024-05-23', false), (4, '2024-05-24', true), (4, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(5, '2024-04-01', false), (5, '2024-04-02', false), (5, '2024-04-03', true), (5, '2024-04-04', false), (5, '2024-04-05', false),
(5, '2024-04-06', true), (5, '2024-04-07', true), (5, '2024-04-08', true), (5, '2024-04-09', false), (5, '2024-04-10', false),
(5, '2024-04-11', true), (5, '2024-04-12', true), (5, '2024-04-13', false), (5, '2024-04-14', true), (5, '2024-04-15', false),
(5, '2024-04-16', false), (5, '2024-04-17', false), (5, '2024-04-18', true), (5, '2024-04-19', true), (5, '2024-04-20', false),
(5, '2024-04-21', true), (5, '2024-04-22', false), (5, '2024-04-23', true), (5, '2024-04-24', true), (5, '2024-04-25', true),
(5, '2024-04-26', true), (5, '2024-04-27', true), (5, '2024-04-28', true), (5, '2024-04-29', true), (5, '2024-04-30', false),
(5, '2024-05-01', false), (5, '2024-05-02', true), (5, '2024-05-03', true), (5, '2024-05-04', true), (5, '2024-05-05', true),
(5, '2024-05-06', true), (5, '2024-05-07', true), (5, '2024-05-08', false), (5, '2024-05-09', true), (5, '2024-05-10', true),
(5, '2024-05-11', false), (5, '2024-05-12', true), (5, '2024-05-13', true), (5, '2024-05-14', true), (5, '2024-05-15', false),
(5, '2024-05-16', true), (5, '2024-05-17', true), (5, '2024-05-18', false), (5, '2024-05-19', true), (5, '2024-05-20', true),
(5, '2024-05-21', false), (5, '2024-05-22', true), (5, '2024-05-23', true), (5, '2024-05-24', true), (5, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(6, '2024-04-01', true), (6, '2024-04-02', true), (6, '2024-04-03', true), (6, '2024-04-04', false), (6, '2024-04-05', true),
(6, '2024-04-06', true), (6, '2024-04-07', true), (6, '2024-04-08', false), (6, '2024-04-09', true), (6, '2024-04-10', false),
(6, '2024-04-11', true), (6, '2024-04-12', true), (6, '2024-04-13', true), (6, '2024-04-14', true), (6, '2024-04-15', true),
(6, '2024-04-16', true), (6, '2024-04-17', false), (6, '2024-04-18', true), (6, '2024-04-19', true), (6, '2024-04-20', false),
(6, '2024-04-21', true), (6, '2024-04-22', false), (6, '2024-04-23', true), (6, '2024-04-24', true), (6, '2024-04-25', true),
(6, '2024-04-26', true), (6, '2024-04-27', true), (6, '2024-04-28', true), (6, '2024-04-29', true), (6, '2024-04-30', true),
(6, '2024-05-01', false), (6, '2024-05-02', true), (6, '2024-05-03', false), (6, '2024-05-04', true), (6, '2024-05-05', true),
(6, '2024-05-06', true), (6, '2024-05-07', true), (6, '2024-05-08', true), (6, '2024-05-09', true), (6, '2024-05-10', false),
(6, '2024-05-11', true), (6, '2024-05-12', false), (6, '2024-05-13', true), (6, '2024-05-14', false), (6, '2024-05-15', false),
(6, '2024-05-16', true), (6, '2024-05-17', true), (6, '2024-05-18', false), (6, '2024-05-19', true), (6, '2024-05-20', false),
(6, '2024-05-21', true), (6, '2024-05-22', true), (6, '2024-05-23', false), (6, '2024-05-24', true), (6, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(7, '2024-04-01', true), (7, '2024-04-02', false), (7, '2024-04-03', true), (7, '2024-04-04', false), (7, '2024-04-05', true),
(7, '2024-04-06', true), (7, '2024-04-07', true), (7, '2024-04-08', false), (7, '2024-04-09', true), (7, '2024-04-10', false),
(7, '2024-04-11', true), (7, '2024-04-12', true), (7, '2024-04-13', false), (7, '2024-04-14', true), (7, '2024-04-15', true),
(7, '2024-04-16', true), (7, '2024-04-17', false), (7, '2024-04-18', true), (7, '2024-04-19', true), (7, '2024-04-20', false),
(7, '2024-04-21', true), (7, '2024-04-22', false), (7, '2024-04-23', true), (7, '2024-04-24', true), (7, '2024-04-25', false),
(7, '2024-04-26', true), (7, '2024-04-27', true), (7, '2024-04-28', false), (7, '2024-04-29', true), (7, '2024-04-30', true),
(7, '2024-05-01', false), (7, '2024-05-02', true), (7, '2024-05-03', false), (7, '2024-05-04', true), (7, '2024-05-05', true),
(7, '2024-05-06', true), (7, '2024-05-07', true), (7, '2024-05-08', false), (7, '2024-05-09', true), (7, '2024-05-10', false),
(7, '2024-05-11', true), (7, '2024-05-12', false), (7, '2024-05-13', true), (7, '2024-05-14', true), (7, '2024-05-15', false),
(7, '2024-05-16', true), (7, '2024-05-17', true), (7, '2024-05-18', false), (7, '2024-05-19', true), (7, '2024-05-20', true),
(7, '2024-05-21', false), (7, '2024-05-22', true), (7, '2024-05-23', false), (7, '2024-05-24', true), (7, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(8, '2024-04-01', false), (8, '2024-04-02', false), (8, '2024-04-03', true), (8, '2024-04-04', false), (8, '2024-04-05', true),
(8, '2024-04-06', true), (8, '2024-04-07', true), (8, '2024-04-08', true), (8, '2024-04-09', false), (8, '2024-04-10', false),
(8, '2024-04-11', true), (8, '2024-04-12', true), (8, '2024-04-13', false), (8, '2024-04-14', true), (8, '2024-04-15', false),
(8, '2024-04-16', false), (8, '2024-04-17', false), (8, '2024-04-18', true), (8, '2024-04-19', true), (8, '2024-04-20', false),
(8, '2024-04-21', true), (8, '2024-04-22', false), (8, '2024-04-23', true), (8, '2024-04-24', false), (8, '2024-04-25', true),
(8, '2024-04-26', true), (8, '2024-04-27', true), (8, '2024-04-28', false), (8, '2024-04-29', true), (8, '2024-04-30', true),
(8, '2024-05-01', false), (8, '2024-05-02', true), (8, '2024-05-03', true), (8, '2024-05-04', true), (8, '2024-05-05', true),
(8, '2024-05-06', true), (8, '2024-05-07', true), (8, '2024-05-08', false), (8, '2024-05-09', true), (8, '2024-05-10', true),
(8, '2024-05-11', false), (8, '2024-05-12', false), (8, '2024-05-13', true), (8, '2024-05-14', false), (8, '2024-05-15', false),
(8, '2024-05-16', true), (8, '2024-05-17', true), (8, '2024-05-18', false), (8, '2024-05-19', true), (8, '2024-05-20', true),
(8, '2024-05-21', false), (8, '2024-05-22', true), (8, '2024-05-23', false), (8, '2024-05-24', true), (8, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(9, '2024-04-01', true), (9, '2024-04-02', false), (9, '2024-04-03', true), (9, '2024-04-04', false), (9, '2024-04-05', true),
(9, '2024-04-06', false), (9, '2024-04-07', true), (9, '2024-04-08', false), (9, '2024-04-09', true), (9, '2024-04-10', false),
(9, '2024-04-11', true), (9, '2024-04-12', true), (9, '2024-04-13', true), (9, '2024-04-14', true), (9, '2024-04-15', true),
(9, '2024-04-16', true), (9, '2024-04-17', false), (9, '2024-04-18', true), (9, '2024-04-19', true), (9, '2024-04-20', false),
(9, '2024-04-21', false), (9, '2024-04-22', false), (9, '2024-04-23', true), (9, '2024-04-24', true), (9, '2024-04-25', true),
(9, '2024-04-26', true), (9, '2024-04-27', true), (9, '2024-04-28', false), (9, '2024-04-29', true), (9, '2024-04-30', true),
(9, '2024-05-01', false), (9, '2024-05-02', true), (9, '2024-05-03', false), (9, '2024-05-04', true), (9, '2024-05-05', true),
(9, '2024-05-06', true), (9, '2024-05-07', true), (9, '2024-05-08', false), (9, '2024-05-09', true), (9, '2024-05-10', false),
(9, '2024-05-11', true), (9, '2024-05-12', false), (9, '2024-05-13', true), (9, '2024-05-14', false), (9, '2024-05-15', false),
(9, '2024-05-16', true), (9, '2024-05-17', true), (9, '2024-05-18', false), (9, '2024-05-19', true), (9, '2024-05-20', false),
(9, '2024-05-21', false), (9, '2024-05-22', true), (9, '2024-05-23', false), (9, '2024-05-24', true), (9, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(10, '2024-04-01', true), (10, '2024-04-02', false), (10, '2024-04-03', true), (10, '2024-04-04', false), (10, '2024-04-05', true),
(10, '2024-04-06', true), (10, '2024-04-07', true), (10, '2024-04-08', false), (10, '2024-04-09', true), (10, '2024-04-10', false),
(10, '2024-04-11', false), (10, '2024-04-12', true), (10, '2024-04-13', false), (10, '2024-04-14', true), (10, '2024-04-15', true),
(10, '2024-04-16', false), (10, '2024-04-17', false), (10, '2024-04-18', true), (10, '2024-04-19', true), (10, '2024-04-20', false),
(10, '2024-04-21', false), (10, '2024-04-22', false), (10, '2024-04-23', true), (10, '2024-04-24', true), (10, '2024-04-25', false),
(10, '2024-04-26', true), (10, '2024-04-27', true), (10, '2024-04-28', false), (10, '2024-04-29', true), (10, '2024-04-30', true),
(10, '2024-05-01', false), (10, '2024-05-02', false), (10, '2024-05-03', false), (10, '2024-05-04', true), (10, '2024-05-05', true),
(10, '2024-05-06', true), (10, '2024-05-07', true), (10, '2024-05-08', false), (10, '2024-05-09', true), (10, '2024-05-10', false),
(10, '2024-05-11', true), (10, '2024-05-12', false), (10, '2024-05-13', false), (10, '2024-05-14', true), (10, '2024-05-15', false),
(10, '2024-05-16', true), (10, '2024-05-17', true), (10, '2024-05-18', false), (10, '2024-05-19', true), (10, '2024-05-20', true),
(10, '2024-05-21', false), (10, '2024-05-22', true), (10, '2024-05-23', false), (10, '2024-05-24', true), (10, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(11, '2024-04-01', false), (11, '2024-04-02', false), (11, '2024-04-03', true), (11, '2024-04-04', false), (11, '2024-04-05', false),
(11, '2024-04-06', true), (11, '2024-04-07', true), (11, '2024-04-08', true), (11, '2024-04-09', false), (11, '2024-04-10', false),
(11, '2024-04-11', true), (11, '2024-04-12', true), (11, '2024-04-13', false), (11, '2024-04-14', true), (11, '2024-04-15', false),
(11, '2024-04-16', false), (11, '2024-04-17', false), (11, '2024-04-18', true), (11, '2024-04-19', true), (11, '2024-04-20', false),
(11, '2024-04-21', true), (11, '2024-04-22', false), (11, '2024-04-23', true), (11, '2024-04-24', true), (11, '2024-04-25', true),
(11, '2024-04-26', true), (11, '2024-04-27', true), (11, '2024-04-28', true), (11, '2024-04-29', true), (11, '2024-04-30', false),
(11, '2024-05-01', false), (11, '2024-05-02', true), (11, '2024-05-03', true), (11, '2024-05-04', true), (11, '2024-05-05', true),
(11, '2024-05-06', true), (11, '2024-05-07', true), (11, '2024-05-08', false), (11, '2024-05-09', true), (11, '2024-05-10', true),
(11, '2024-05-11', false), (11, '2024-05-12', true), (11, '2024-05-13', true), (11, '2024-05-14', true), (11, '2024-05-15', false),
(11, '2024-05-16', true), (11, '2024-05-17', true), (11, '2024-05-18', false), (11, '2024-05-19', true), (11, '2024-05-20', true),
(11, '2024-05-21', false), (11, '2024-05-22', true), (11, '2024-05-23', true), (11, '2024-05-24', true), (11, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(12, '2024-04-01', true), (12, '2024-04-02', true), (12, '2024-04-03', true), (12, '2024-04-04', false), (12, '2024-04-05', true),
(12, '2024-04-06', true), (12, '2024-04-07', true), (12, '2024-04-08', false), (12, '2024-04-09', true), (12, '2024-04-10', false),
(12, '2024-04-11', true), (12, '2024-04-12', true), (12, '2024-04-13', true), (12, '2024-04-14', true), (12, '2024-04-15', true),
(12, '2024-04-16', true), (12, '2024-04-17', false), (12, '2024-04-18', true), (12, '2024-04-19', true), (12, '2024-04-20', false),
(12, '2024-04-21', true), (12, '2024-04-22', false), (12, '2024-04-23', true), (12, '2024-04-24', true), (12, '2024-04-25', true),
(12, '2024-04-26', true), (12, '2024-04-27', true), (12, '2024-04-28', true), (12, '2024-04-29', true), (12, '2024-04-30', true),
(12, '2024-05-01', false), (12, '2024-05-02', true), (12, '2024-05-03', false), (12, '2024-05-04', true), (12, '2024-05-05', true),
(12, '2024-05-06', true), (12, '2024-05-07', true), (12, '2024-05-08', true), (12, '2024-05-09', true), (12, '2024-05-10', false),
(12, '2024-05-11', true), (12, '2024-05-12', false), (12, '2024-05-13', true), (12, '2024-05-14', false), (12, '2024-05-15', false),
(12, '2024-05-16', true), (12, '2024-05-17', true), (12, '2024-05-18', false), (12, '2024-05-19', true), (12, '2024-05-20', false),
(12, '2024-05-21', true), (12, '2024-05-22', true), (12, '2024-05-23', false), (12, '2024-05-24', true), (12, '2024-05-25', true);


INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(13, '2024-04-01', true), (13, '2024-04-02', false), (13, '2024-04-03', true), (13, '2024-04-04', false), (13, '2024-04-05', true),
(13, '2024-04-06', true), (13, '2024-04-07', true), (13, '2024-04-08', false), (13, '2024-04-09', true), (13, '2024-04-10', false),
(13, '2024-04-11', true), (13, '2024-04-12', true), (13, '2024-04-13', false), (13, '2024-04-14', true), (13, '2024-04-15', true),
(13, '2024-04-16', true), (13, '2024-04-17', false), (13, '2024-04-18', true), (13, '2024-04-19', true), (13, '2024-04-20', false),
(13, '2024-04-21', true), (13, '2024-04-22', false), (13, '2024-04-23', true), (13, '2024-04-24', true), (13, '2024-04-25', false),
(13, '2024-04-26', true), (13, '2024-04-27', true), (13, '2024-04-28', false), (13, '2024-04-29', true), (13, '2024-04-30', true),
(13, '2024-05-01', false), (13, '2024-05-02', true), (13, '2024-05-03', false), (13, '2024-05-04', true), (13, '2024-05-05', true),
(13, '2024-05-06', true), (13, '2024-05-07', true), (13, '2024-05-08', false), (13, '2024-05-09', true), (13, '2024-05-10', false),
(13, '2024-05-11', true), (13, '2024-05-12', false), (13, '2024-05-13', true), (13, '2024-05-14', true), (13, '2024-05-15', false),
(13, '2024-05-16', true), (13, '2024-05-17', true), (13, '2024-05-18', false), (13, '2024-05-19', true), (13, '2024-05-20', true),
(13, '2024-05-21', false), (13, '2024-05-22', true), (13, '2024-05-23', false), (13, '2024-05-24', true), (13, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(14, '2024-04-01', false), (14, '2024-04-02', false), (14, '2024-04-03', true), (14, '2024-04-04', false), (14, '2024-04-05', true),
(14, '2024-04-06', true), (14, '2024-04-07', true), (14, '2024-04-08', true), (14, '2024-04-09', false), (14, '2024-04-10', false),
(14, '2024-04-11', true), (14, '2024-04-12', true), (14, '2024-04-13', false), (14, '2024-04-14', true), (14, '2024-04-15', false),
(14, '2024-04-16', false), (14, '2024-04-17', false), (14, '2024-04-18', true), (14, '2024-04-19', true), (14, '2024-04-20', false),
(14, '2024-04-21', true), (14, '2024-04-22', false), (14, '2024-04-23', true), (14, '2024-04-24', false), (14, '2024-04-25', true),
(14, '2024-04-26', true), (14, '2024-04-27', true), (14, '2024-04-28', false), (14, '2024-04-29', true), (14, '2024-04-30', true),
(14, '2024-05-01', false), (14, '2024-05-02', true), (14, '2024-05-03', true), (14, '2024-05-04', true), (14, '2024-05-05', true),
(14, '2024-05-06', true), (14, '2024-05-07', true), (14, '2024-05-08', false), (14, '2024-05-09', true), (14, '2024-05-10', true),
(14, '2024-05-11', false), (14, '2024-05-12', false), (14, '2024-05-13', true), (14, '2024-05-14', false), (14, '2024-05-15', false),
(14, '2024-05-16', true), (14, '2024-05-17', true), (14, '2024-05-18', false), (14, '2024-05-19', true), (14, '2024-05-20', true),
(14, '2024-05-21', false), (14, '2024-05-22', true), (14, '2024-05-23', false), (14, '2024-05-24', true), (14, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(15, '2024-04-01', true), (15, '2024-04-02', false), (15, '2024-04-03', true), (15, '2024-04-04', false), (15, '2024-04-05', true),
(15, '2024-04-06', false), (15, '2024-04-07', true), (15, '2024-04-08', false), (15, '2024-04-09', true), (15, '2024-04-10', false),
(15, '2024-04-11', true), (15, '2024-04-12', true), (15, '2024-04-13', true), (15, '2024-04-14', true), (15, '2024-04-15', true),
(15, '2024-04-16', true), (15, '2024-04-17', false), (15, '2024-04-18', true), (15, '2024-04-19', true), (15, '2024-04-20', false),
(15, '2024-04-21', false), (15, '2024-04-22', false), (15, '2024-04-23', true), (15, '2024-04-24', true), (15, '2024-04-25', true),
(15, '2024-04-26', true), (15, '2024-04-27', true), (15, '2024-04-28', false), (15, '2024-04-29', true), (15, '2024-04-30', true),
(15, '2024-05-01', false), (15, '2024-05-02', true), (15, '2024-05-03', false), (15, '2024-05-04', true), (15, '2024-05-05', true),
(15, '2024-05-06', true), (15, '2024-05-07', true), (15, '2024-05-08', false), (15, '2024-05-09', true), (15, '2024-05-10', false),
(15, '2024-05-11', true), (15, '2024-05-12', false), (15, '2024-05-13', true), (15, '2024-05-14', false), (15, '2024-05-15', false),
(15, '2024-05-16', true), (15, '2024-05-17', true), (15, '2024-05-18', false), (15, '2024-05-19', true), (15, '2024-05-20', false),
(15, '2024-05-21', false), (15, '2024-05-22', true), (15, '2024-05-23', false), (15, '2024-05-24', true), (15, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(16, '2024-04-01', true), (16, '2024-04-02', false), (16, '2024-04-03', true), (16, '2024-04-04', false), (16, '2024-04-05', true),
(16, '2024-04-06', true), (16, '2024-04-07', true), (16, '2024-04-08', false), (16, '2024-04-09', true), (16, '2024-04-10', false),
(16, '2024-04-11', false), (16, '2024-04-12', true), (16, '2024-04-13', false), (16, '2024-04-14', true), (16, '2024-04-15', true),
(16, '2024-04-16', false), (16, '2024-04-17', false), (16, '2024-04-18', true), (16, '2024-04-19', true), (16, '2024-04-20', false),
(16, '2024-04-21', false), (16, '2024-04-22', false), (16, '2024-04-23', true), (16, '2024-04-24', true), (16, '2024-04-25', false),
(16, '2024-04-26', true), (16, '2024-04-27', true), (16, '2024-04-28', false), (16, '2024-04-29', true), (16, '2024-04-30', true),
(16, '2024-05-01', false), (16, '2024-05-02', false), (16, '2024-05-03', false), (16, '2024-05-04', true), (16, '2024-05-05', true),
(16, '2024-05-06', true), (16, '2024-05-07', true), (16, '2024-05-08', false), (16, '2024-05-09', true), (16, '2024-05-10', false),
(16, '2024-05-11', true), (16, '2024-05-12', false), (16, '2024-05-13', false), (16, '2024-05-14', true), (16, '2024-05-15', false),
(16, '2024-05-16', true), (16, '2024-05-17', true), (16, '2024-05-18', false), (16, '2024-05-19', true), (16, '2024-05-20', true),
(16, '2024-05-21', false), (16, '2024-05-22', true), (16, '2024-05-23', false), (16, '2024-05-24', true), (16, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(17, '2024-04-01', false), (17, '2024-04-02', false), (17, '2024-04-03', true), (17, '2024-04-04', false), (17, '2024-04-05', false),
(17, '2024-04-06', true), (17, '2024-04-07', true), (17, '2024-04-08', true), (17, '2024-04-09', false), (17, '2024-04-10', false),
(17, '2024-04-11', true), (17, '2024-04-12', true), (17, '2024-04-13', false), (17, '2024-04-14', true), (17, '2024-04-15', false),
(17, '2024-04-16', false), (17, '2024-04-17', false), (17, '2024-04-18', true), (17, '2024-04-19', true), (17, '2024-04-20', false),
(17, '2024-04-21', true), (17, '2024-04-22', false), (17, '2024-04-23', true), (17, '2024-04-24', true), (17, '2024-04-25', true),
(17, '2024-04-26', true), (17, '2024-04-27', true), (17, '2024-04-28', true), (17, '2024-04-29', true), (17, '2024-04-30', false),
(17, '2024-05-01', false), (17, '2024-05-02', true), (17, '2024-05-03', true), (17, '2024-05-04', true), (17, '2024-05-05', true),
(17, '2024-05-06', true), (17, '2024-05-07', true), (17, '2024-05-08', false), (17, '2024-05-09', true), (17, '2024-05-10', true),
(17, '2024-05-11', false), (17, '2024-05-12', true), (17, '2024-05-13', true), (17, '2024-05-14', true), (17, '2024-05-15', false),
(17, '2024-05-16', true), (17, '2024-05-17', true), (17, '2024-05-18', false), (17, '2024-05-19', true), (17, '2024-05-20', true),
(17, '2024-05-21', false), (17, '2024-05-22', true), (17, '2024-05-23', true), (17, '2024-05-24', true), (17, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(18, '2024-04-01', true), (18, '2024-04-02', true), (18, '2024-04-03', true), (18, '2024-04-04', false), (18, '2024-04-05', true),
(18, '2024-04-06', true), (18, '2024-04-07', true), (18, '2024-04-08', false), (18, '2024-04-09', true), (18, '2024-04-10', false),
(18, '2024-04-11', true), (18, '2024-04-12', true), (18, '2024-04-13', true), (18, '2024-04-14', true), (18, '2024-04-15', true),
(18, '2024-04-16', true), (18, '2024-04-17', false), (18, '2024-04-18', true), (18, '2024-04-19', true), (18, '2024-04-20', false),
(18, '2024-04-21', true), (18, '2024-04-22', false), (18, '2024-04-23', true), (18, '2024-04-24', true), (18, '2024-04-25', true),
(18, '2024-04-26', true), (18, '2024-04-27', true), (18, '2024-04-28', true), (18, '2024-04-29', true), (18, '2024-04-30', true),
(18, '2024-05-01', false), (18, '2024-05-02', true), (18, '2024-05-03', false), (18, '2024-05-04', true), (18, '2024-05-05', true),
(18, '2024-05-06', true), (18, '2024-05-07', true), (18, '2024-05-08', true), (18, '2024-05-09', true), (18, '2024-05-10', false),
(18, '2024-05-11', true), (18, '2024-05-12', false), (18, '2024-05-13', true), (18, '2024-05-14', false), (18, '2024-05-15', false),
(18, '2024-05-16', true), (18, '2024-05-17', true), (18, '2024-05-18', false), (18, '2024-05-19', true), (18, '2024-05-20', false),
(18, '2024-05-21', true), (18, '2024-05-22', true), (18, '2024-05-23', false), (18, '2024-05-24', true), (18, '2024-05-25', true);


INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(19, '2024-04-01', true), (19, '2024-04-02', false), (19, '2024-04-03', true), (19, '2024-04-04', false), (19, '2024-04-05', true),
(19, '2024-04-06', true), (19, '2024-04-07', true), (19, '2024-04-08', false), (19, '2024-04-09', true), (19, '2024-04-10', false),
(19, '2024-04-11', true), (19, '2024-04-12', true), (19, '2024-04-13', false), (19, '2024-04-14', true), (19, '2024-04-15', true),
(19, '2024-04-16', true), (19, '2024-04-17', false), (19, '2024-04-18', true), (19, '2024-04-19', true), (19, '2024-04-20', false),
(19, '2024-04-21', true), (19, '2024-04-22', false), (19, '2024-04-23', true), (19, '2024-04-24', true), (19, '2024-04-25', false),
(19, '2024-04-26', true), (19, '2024-04-27', true), (19, '2024-04-28', false), (19, '2024-04-29', true), (19, '2024-04-30', true),
(19, '2024-05-01', false), (19, '2024-05-02', true), (19, '2024-05-03', false), (19, '2024-05-04', true), (19, '2024-05-05', true),
(19, '2024-05-06', true), (19, '2024-05-07', true), (19, '2024-05-08', false), (19, '2024-05-09', true), (19, '2024-05-10', false),
(19, '2024-05-11', true), (19, '2024-05-12', false), (19, '2024-05-13', true), (19, '2024-05-14', true), (19, '2024-05-15', false),
(19, '2024-05-16', true), (19, '2024-05-17', true), (19, '2024-05-18', false), (19, '2024-05-19', true), (19, '2024-05-20', true),
(19, '2024-05-21', false), (19, '2024-05-22', true), (19, '2024-05-23', false), (19, '2024-05-24', true), (19, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(20, '2024-04-01', false), (20, '2024-04-02', false), (20, '2024-04-03', true), (20, '2024-04-04', false), (20, '2024-04-05', true),
(20, '2024-04-06', true), (20, '2024-04-07', true), (20, '2024-04-08', true), (20, '2024-04-09', false), (20, '2024-04-10', false),
(20, '2024-04-11', true), (20, '2024-04-12', true), (20, '2024-04-13', false), (20, '2024-04-14', true), (20, '2024-04-15', false),
(20, '2024-04-16', false), (20, '2024-04-17', false), (20, '2024-04-18', true), (20, '2024-04-19', true), (20, '2024-04-20', false),
(20, '2024-04-21', true), (20, '2024-04-22', false), (20, '2024-04-23', true), (20, '2024-04-24', false), (20, '2024-04-25', true),
(20, '2024-04-26', true), (20, '2024-04-27', true), (20, '2024-04-28', false), (20, '2024-04-29', true), (20, '2024-04-30', true),
(20, '2024-05-01', false), (20, '2024-05-02', true), (20, '2024-05-03', true), (20, '2024-05-04', true), (20, '2024-05-05', true),
(20, '2024-05-06', true), (20, '2024-05-07', true), (20, '2024-05-08', false), (20, '2024-05-09', true), (20, '2024-05-10', true),
(20, '2024-05-11', false), (20, '2024-05-12', false), (20, '2024-05-13', true), (20, '2024-05-14', false), (20, '2024-05-15', false),
(20, '2024-05-16', true), (20, '2024-05-17', true), (20, '2024-05-18', false), (20, '2024-05-19', true), (20, '2024-05-20', true),
(20, '2024-05-21', false), (20, '2024-05-22', true), (20, '2024-05-23', false), (20, '2024-05-24', true), (20, '2024-05-25', false);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(21, '2024-04-01', true), (21, '2024-04-02', false), (21, '2024-04-03', true), (21, '2024-04-04', false), (21, '2024-04-05', true),
(21, '2024-04-06', false), (21, '2024-04-07', true), (21, '2024-04-08', false), (21, '2024-04-09', true), (21, '2024-04-10', false),
(21, '2024-04-11', true), (21, '2024-04-12', true), (21, '2024-04-13', true), (21, '2024-04-14', true), (21, '2024-04-15', true),
(21, '2024-04-16', true), (21, '2024-04-17', false), (21, '2024-04-18', true), (21, '2024-04-19', true), (21, '2024-04-20', false),
(21, '2024-04-21', false), (21, '2024-04-22', false), (21, '2024-04-23', true), (21, '2024-04-24', true), (21, '2024-04-25', true),
(21, '2024-04-26', true), (21, '2024-04-27', true), (21, '2024-04-28', false), (21, '2024-04-29', true), (21, '2024-04-30', true),
(21, '2024-05-01', false), (21, '2024-05-02', true), (21, '2024-05-03', false), (21, '2024-05-04', true), (21, '2024-05-05', true),
(21, '2024-05-06', true), (21, '2024-05-07', true), (21, '2024-05-08', false), (21, '2024-05-09', true), (21, '2024-05-10', false),
(21, '2024-05-11', true), (21, '2024-05-12', false), (21, '2024-05-13', true), (21, '2024-05-14', false), (21, '2024-05-15', false),
(21, '2024-05-16', true), (21, '2024-05-17', true), (21, '2024-05-18', false), (21, '2024-05-19', true), (21, '2024-05-20', false),
(21, '2024-05-21', false), (21, '2024-05-22', true), (21, '2024-05-23', false), (21, '2024-05-24', true), (21, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(22, '2024-04-01', true), (22, '2024-04-02', false), (22, '2024-04-03', true), (22, '2024-04-04', false), (22, '2024-04-05', true),
(22, '2024-04-06', true), (22, '2024-04-07', true), (22, '2024-04-08', false), (22, '2024-04-09', true), (22, '2024-04-10', false),
(22, '2024-04-11', false), (22, '2024-04-12', true), (22, '2024-04-13', false), (22, '2024-04-14', true), (22, '2024-04-15', true),
(22, '2024-04-16', false), (22, '2024-04-17', false), (22, '2024-04-18', true), (22, '2024-04-19', true), (22, '2024-04-20', false),
(22, '2024-04-21', false), (22, '2024-04-22', false), (22, '2024-04-23', true), (22, '2024-04-24', true), (22, '2024-04-25', false),
(22, '2024-04-26', true), (22, '2024-04-27', true), (22, '2024-04-28', false), (22, '2024-04-29', true), (22, '2024-04-30', true),
(22, '2024-05-01', false), (22, '2024-05-02', false), (22, '2024-05-03', false), (22, '2024-05-04', true), (22, '2024-05-05', true),
(22, '2024-05-06', true), (22, '2024-05-07', true), (22, '2024-05-08', false), (22, '2024-05-09', true), (22, '2024-05-10', false),
(22, '2024-05-11', true), (22, '2024-05-12', false), (22, '2024-05-13', false), (22, '2024-05-14', true), (22, '2024-05-15', false),
(22, '2024-05-16', true), (22, '2024-05-17', true), (22, '2024-05-18', false), (22, '2024-05-19', true), (22, '2024-05-20', true),
(22, '2024-05-21', false), (22, '2024-05-22', true), (22, '2024-05-23', false), (22, '2024-05-24', true), (22, '2024-05-25', true);

INSERT INTO Availability (RoomID, Date, IsAvailable) VALUES
(23, '2024-04-01', false), (23, '2024-04-02', false), (23, '2024-04-03', true), (23, '2024-04-04', false), (23, '2024-04-05', false),
(23, '2024-04-06', true), (23, '2024-04-07', true), (23, '2024-04-08', true), (23, '2024-04-09', false), (23, '2024-04-10', false),
(23, '2024-04-11', true), (23, '2024-04-12', true), (23, '2024-04-13', false), (23, '2024-04-14', true), (23, '2024-04-15', false),
(23, '2024-04-16', false), (23, '2024-04-17', false), (23, '2024-04-18', true), (23, '2024-04-19', true), (23, '2024-04-20', false),
(23, '2024-04-21', true), (23, '2024-04-22', false), (23, '2024-04-23', true), (23, '2024-04-24', true), (23, '2024-04-25', true),
(23, '2024-04-26', true), (23, '2024-04-27', true), (23, '2024-04-28', true), (23, '2024-04-29', true), (23, '2024-04-30', false),
(23, '2024-05-01', false), (23, '2024-05-02', true), (23, '2024-05-03', true), (23, '2024-05-04', true), (23, '2024-05-05', true),
(23, '2024-05-06', true), (23, '2024-05-07', true), (23, '2024-05-08', false), (23, '2024-05-09', true), (23, '2024-05-10', true),
(23, '2024-05-11', false), (23, '2024-05-12', true), (23, '2024-05-13', true), (23, '2024-05-14', true), (23, '2024-05-15', false),
(23, '2024-05-16', true), (23, '2024-05-17', true), (23, '2024-05-18', false), (23, '2024-05-19', true), (23, '2024-05-20', true),
(23, '2024-05-21', false), (23, '2024-05-22', true), (23, '2024-05-23', true), (23, '2024-05-24', true), (23, '2024-05-25', false);

