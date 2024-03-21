USE HotelDB;

INSERT INTO Rooms (ThemeName, BedType, Date, IsAvailable, Price) VALUES
('Safari Adventure', 'one double bed', '2024-04-01', true, 150.00),
('Safari Adventure', 'two double beds', '2024-04-01', true, 150.00),
('Safari Adventure', 'two single beds', '2024-04-01', true, 150.00),


('Ocean Bliss', 'two double beds', '2024-04-01', true, 180.00),
('Ocean Bliss', 'two single beds', '2024-04-01', true, 180.00),

('Mountain Retreat', 'one double bed', '2024-04-01', true, 130.00),

('Urban Modern', 'one double bed', '2024-04-01', true, 160.00),

('Tropical Paradise', 'two double beds', '2024-04-01', true, 155.00),


('Disney Land', 'one double bed', '2024-04-01', true, 166.00),
('Disney Land', 'two double beds', '2024-04-01', true, 166.00),
('Disney Land', 'two single beds', '2024-04-01', true, 166.00),


('Futuristic', 'two double beds', '2024-04-01', true, 177.00),
('Vintage', 'one double bed','2024-04-01', true, 145.00),

('Royal Suite', 'one double bed', '2024-04-01', true, 250.00),
('Royal Suite', 'two double beds', '2024-04-01', true, 250.00),


('Space Odyssey', 'one double bed', '2024-04-01', true, 190.00),
('Art Deco', 'two double beds', '2024-04-01', true, 1350.00),

('Taylor Swift', 'one double bed', '2024-04-01', true, 280.00),
('Taylor Swift', 'two double beds', '2024-04-01', true, 280.00),
('Taylor Swift', 'two single beds', '2024-04-01', true, 280.00),

('Jungle Bungalow', 'one double bed', '2024-04-01', true, 153.00);

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
    r.ThemeName,
    r.BedType,
    ra.Date,
    ra.IsAvailable,
    r.Price
FROM Rooms r
CROSS JOIN random_availability ra
WHERE ra.Date > '2024-04-01' AND ra.Date <= '2024-05-31';
