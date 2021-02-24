USE HotelDb;
GO

INSERT INTO RoomType(TypeName, BasePrice, ExtraPersonFee, MaxOccupancy, StandardOccupancy)
VALUES ('Single', 149.99, 0.00, 2, 2),
       ('Double', 174.99, 10.00, 2, 4),
       ('Suite', 399.99, 20.00, 3, 8);


INSERT INTO Amenity(Name, Cost)
VALUES ('Refrigerator', 0.00),
       ('Microwave', 0.00),
       ('Oven', 0.00),
       ('Jacuzzi', 25.00);

-- true = 1, false = 0
INSERT INTO Room(RoomNum, AdaAccessible, RoomTypeId)
VALUES (201, 0, 2),
       (202, 1, 2),
       (203, 0, 2),
       (204, 1, 2),
       -- 2nd fl singles
       (205, 0, 1),
       (206, 1, 1),
       (207, 0, 1),
       (208, 1, 1),
       -- 3rd fl doubles
       (301, 0, 2),
       (302, 1, 2),
       (303, 0, 2),
       (304, 1, 2),
       --3rd fl singles
       (305, 0, 1),
       (306, 1, 1),
       (307, 0, 1),
       (308, 1, 1),
       -- suites
       (401, 1, 3),
       (402, 1, 3);

INSERT INTO RoomAmenity(RoomNum, AmenityId) 
VALUES 


--  view data
SELECT *
FROM RoomType;
SELECT *
FROM Amenity;
SELECT *
FROM Room
ORDER BY RoomNum;
SELECT *
FROM RoomAmenity
ORDER BY RoomNum;

SELECT *
FROM Guest;
SELECT *
FROM GuestAddress;
SELECT *
FROM Reservation;