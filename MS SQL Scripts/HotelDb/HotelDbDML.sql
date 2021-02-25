USE HotelDb;
GO

-- Room Type
INSERT INTO RoomType(TypeName, BasePrice, ExtraPersonFee, MaxOccupancy, StandardOccupancy)
VALUES ('Single', 149.99, 0.00, 2, 2),
       ('Double', 174.99, 10.00, 2, 4),
       ('Suite', 399.99, 20.00, 3, 8);

-- Amenity
INSERT INTO Amenity(Name, Cost)
VALUES ('Refrigerator', 0.00),
       ('Microwave', 0.00),
       ('Oven', 0.00),
       ('Jacuzzi', 25.00);

-- Room
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

-- Room Amenity Bridge
INSERT INTO RoomAmenity(RoomNum, AmenityId)
VALUES (201, 1),
       (201, 4),
       (202, 2),
       (203, 1),
       (203, 4),
       (204, 2),
       (205, 1),
       (205, 2),
       (205, 4),
       (206, 1),
       (206, 2),
       (207, 1),
       (207, 2),
       (207, 4),
       (208, 1),
       (208, 2),
       (301, 1),
       (301, 4),
       (302, 2),
       (303, 1),
       (303, 4),
       (304, 2),
       (305, 1),
       (305, 2),
       (305, 4),
       (306, 1),
       (306, 2),
       (307, 1),
       (307, 2),
       (307, 4),
       (308, 1),
       (308, 2),
       (401, 1),
       (401, 2),
       (401, 3),
       (402, 1),
       (402, 2),
       (402, 3);

-- Address
INSERT INTO Address(Street, City, State, ZipCode)
VALUES ('555-555 Blvd', 'Nowhere', 'NY', '99999'),
       ('379 Old Shore Street', 'Council Bluffs', 'IA', '51501'),
       ('750 Wintergreen Dr.', 'Wasilla', 'AK', '99654'),
       ('9662 Foxrun Lane', 'Harlingen', 'TX', '78552'),
       ('9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096'),
       ('762 Wild Rose Street', 'Saginaw', 'MI', '48601'),
       ('7 Poplar Dr.', 'Arvada', 'CO', '80003'),
       ('70 Oakwood St.', 'Zion', 'IL', '60099'),
       ('7556 Arrowhead St.', 'Cumberland', 'RI', '02864'),
       ('77 West Surrey Street', 'Oswego', 'NY', '13126'),
       ('939 Linda Rd.', 'Burke', 'VA', '22015'),
       ('87 Queen St.', 'Drexel Hill', 'PA', '19026');

-- Guest
INSERT INTO Guest(FirstName, LastName, PhoneNum, AddressId)
VALUES ('Narish', 'Singh', '555-555-5555', 1),
       ('Mark', 'Simmer', '291-553-0508', 2),
       ('Bettyann', 'Seery', '478-277-9632', 3),
       ('Duane', 'Cullison', '308-494-0198', 4),
       ('Karie', 'Yang', '214-730-0298', 5),
       ('Aurore', 'Lipton', '377-507-0974', 6),
       ('Zachery', 'Luechtefeld', '814-485-2615', 7),
       ('Jeremiah', 'Pendergrass', '279-491-0960', 8),
       ('Walter', 'Holaway', '446-396-6785', 9),
       ('Wilfred', 'Vise', '834-727-1001', 10),
       ('Mariza', 'Tilton', '446-351-6860', 11),
       ('Joleen', 'Tison', '231-893-2755', 12);

-- Reservation
INSERT INTO Reservation(RoomNum, GuestId, AdultCount, ChildCount, CheckIn, CheckOut, Cost)
VALUES (308, 2, 1, 0, '02/02/2023', '02/04/2023', 299.98),
       (203, 3, 2, 1, '02/05/2023', '02/10/2023', 999.95),
       (305, 4, 2, 0, '02/22/2023', '02/24/2023', 349.98),
       (201, 5, 2, 2, '03/06/2023', '03/07/2023', 199.99),
       (307, 1, 1, 1, '03/17/2023', '03/20/2023', 524.97),
       (302, 6, 3, 0, '03/18/2023', '03/23/2023', 924.95),
       (202, 7, 2, 2, '03/29/2023', '03/31/2023', 349.98),
       (304, 8, 2, 0, '03/31/2023', '04/05/2023', 874.95),
       (301, 9, 1, 0, '04/09/2023', '04/13/2023', 799.96),
       (207, 10, 1, 1, '04/23/2023', '04/24/2023', 174.99),
       (401, 11, 2, 4, '05/30/2023', '06/02/2023', 1199.97),
       (206, 12, 2, 0, '06/10/2023', '06/14/2023', 599.96),
       (208, 12, 1, 0, '06/10/2023', '06/14/2023', 599.96),
       (304, 6, 3, 0, '06/17/2023', '06/18/2023', 184.99),
       (205, 1, 2, 0, '06/28/2023', '07/02/2023', 699.96),
       (204, 9, 3, 1, '07/13/2023', '07/14/2023', 184.99),
       (401, 10, 4, 2, '07/18/2023', '07/21/2023', 1259.97),
       (303, 3, 2, 1, '07/28/2023', '07/29/2023', 199.99),
       (305, 3, 1, 0, '08/30/2023', '09/01/2023', 349.98),
       (208, 2, 2, 0, '09/16/2023', '09/17/2023', 149.99),
       (203, 5, 2, 2, '09/13/2023', '09/15/2023', 399.98),
       (401, 4, 2, 2, '11/22/2023', '11/25/2023', 1199.97),
       (206, 2, 2, 0, '11/22/2023', '11/25/2023', 449.97),
       (301, 2, 2, 2, '11/22/2023', '11/25/2023', 599.97),
       (302, 11, 2, 0, '12/24/2023', '12/28/2023', 699.96);

-- Delete Jeremiah Pendergrass and all reservations
-- will lose ability to look up by name, save address id first
DECLARE @PendergrassAddressId INT
SELECT @PendergrassAddressId = AddressId
FROM Guest G
WHERE G.LastName = 'Pendergrass';

DELETE
FROM Reservation
WHERE GuestId IN (
    SELECT GuestId
    FROM Guest G
    WHERE G.LastName = 'Pendergrass'
);

DELETE
FROM Guest
WHERE LastName = 'Pendergrass';

DELETE
FROM Address
WHERE AddressId = @PendergrassAddressId;
GO

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
FROM Address;
SELECT *
FROM Reservation;