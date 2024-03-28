USE HotelDB;

INSERT INTO Rooms (TypeID, ThemeName, BedType, Date, IsAvailable, Price) VALUES
('SAod', 'Safari Adventure', 'one double bed', '2024-04-01', true, 150.00),
('SAtd', 'Safari Adventure', 'two double beds', '2024-04-01', true, 150.00),
('SAts', 'Safari Adventure', 'two single beds', '2024-04-01', true, 150.00),

('OBtd', 'Ocean Bliss', 'two double beds', '2024-04-01', true, 180.00),
('OBts', 'Ocean Bliss', 'two single beds', '2024-04-01', true, 180.00),

('MRod', 'Mountain Retreat', 'one double bed', '2024-04-01', true, 130.00),

('UMod', 'Urban Modern', 'one double bed', '2024-04-01', true, 160.00),

('TPtd', 'Tropical Paradise', 'two double beds', '2024-04-01', true, 155.00),

('DLod', 'Disney Land', 'one double bed', '2024-04-01', true, 166.00),
('DLtd', 'Disney Land', 'two double beds', '2024-04-01', true, 166.00),
('DLts', 'Disney Land', 'two single beds', '2024-04-01', true, 166.00),

('RSod', 'Royal Suite', 'one double bed', '2024-04-01', true, 250.00),
('RStd', 'Royal Suite', 'two double beds', '2024-04-01', true, 250.00),

('SOod', 'Space Odyssey', 'one double bed', '2024-04-01', true, 190.00),

('ADts', 'Art Deco', 'two single beds', '2024-04-01', true, 1350.00),

('TSod', 'Taylor Swift', 'one double bed', '2024-04-01', true, 280.00),
('TStd', 'Taylor Swift', 'two double beds', '2024-04-01', true, 280.00),
('TSts', 'Taylor Swift', 'two single beds', '2024-04-01', true, 280.00),

('JBod', 'Jungle Bungalow', 'one double bed', '2024-04-01', true, 153.00);

-- Generate random availability (true or false)
WITH random_availability AS (
    SELECT
        DATE '2024-04-01' + SEQUENCE.DAY AS Date,
        CASE ROUND(RANDOM())::INT
            WHEN 0 THEN false
            ELSE true
        END AS IsAvailable
    FROM GENERATE_SERIES(0, 60) AS SEQUENCE(DAY)
)

-- Insert rows for each date with random availability
INSERT INTO Rooms (ThemeName, BedType, Date, IsAvailable, Price)
SELECT
    r.TypeID,
    r.ThemeName,
    r.BedType,
    ra.Date,
    ra.IsAvailable,
    r.Price
FROM Rooms r
CROSS JOIN random_availability ra
WHERE ra.Date > '2024-04-01' AND ra.Date <= '2024-05-31';