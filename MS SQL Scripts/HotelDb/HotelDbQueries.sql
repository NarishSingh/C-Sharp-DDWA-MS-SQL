USE HotelDb;
GO

-- 1
-- Write a query that returns a list of reservations that end in July 2023, including the name of the guest, 
-- the room number(s), and the reservation dates.
SELECT G.FirstName + ' ' + G.LastName AS GuestName,
       R.RoomNum,
       R.CheckIn,
       R.CheckOut
FROM Reservation R
         JOIN Guest G ON R.GuestId = G.GuestId
WHERE R.CheckOut BETWEEN '07/01/2023' AND '07/31/2023';
-- 4 ROWS

-- -------------------------------
-- 2
-- Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, 
-- the room number, and the dates of the reservation.
DECLARE @JacuzziId SMALLINT
SELECT @JacuzziId = A.AmenityId
FROM Amenity A
WHERE A.Name = 'Jacuzzi';

SELECT G.FirstName + ' ' + G.LastName AS GuestName, Res.RoomNum, Res.CheckIn, Res.CheckOut
FROM Reservation Res
         JOIN Guest G ON G.GuestId = Res.GuestId
         JOIN Room RO ON Res.RoomNum = RO.RoomNum
         JOIN RoomAmenity RA ON RO.RoomNum = RA.RoomNum
WHERE RA.AmenityId = @JacuzziId;
-- 11 ROWS

-- -------------------------------
-- 3
-- Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) 
-- reserved, the starting date of the reservation, and how many people were included in the reservation. 
-- (Choose a guest's name from the existing data.)
SELECT G.FirstName + ' ' + G.LastName   AS GuestName,
       R.RoomNum,
       R.CheckIn,
       SUM(R.AdultCount + R.ChildCount) AS TotalGuests
FROM Guest G
         JOIN Reservation R ON G.GuestId = R.GuestId
WHERE G.FirstName = 'Narish'
GROUP BY G.FirstName, G.LastName, R.RoomNum, R.CheckIn;
-- 2 ROWS for Narish

-- -------------------------------
-- 4
-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results 
-- should include all rooms, whether or not there is a reservation associated with the room.

SELECT RO.RoomNum, RE.ReservationId, RE.Cost
FROM ROOM RO
         LEFT JOIN Reservation RE ON RO.RoomNum = RE.RoomNum
ORDER BY RO.RoomNum;
-- 26 ROWS

-- -------------------------------
-- 5
-- Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date 
-- in April 2023.
SELECT RO.RoomNum,
       SUM(RES.AdultCount + RES.ChildCount) AS TotalGuest,
       RES.CheckIn,
       RES.CheckOut
FROM Reservation RES
         JOIN Room RO ON RES.RoomNum = RO.RoomNum
GROUP BY RO.RoomNum, RES.CheckIn, RES.CheckOut
HAVING SUM(RES.AdultCount + RES.ChildCount) >= 3
   AND (
        RES.CheckIn BETWEEN '04/01/2023' AND '04/30/2023'
        OR RES.CheckOut BETWEEN '04/01/2023' AND '04/30/2023'
    );
-- 0 ROWS

-- -------------------------------
-- 6
-- Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with 
-- the guest with the most reservations and then by the guest's last name.
SELECT G.FirstName,
       G.LastName,
       COUNT(R.ReservationId) AS TotalReservations
FROM Guest G
         JOIN Reservation R ON G.GuestId = R.GuestId
GROUP BY G.FirstName, G.LastName
ORDER BY TotalReservations DESC, G.LastName;
-- 11 ROWS

-- -------------------------------
-- 7
-- Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a 
-- phone number from the existing data.)
SELECT G.FirstName + ' ' + G.LastName                        AS GuestName,
       CONCAT_WS(', ', A.Street, A.City, A.State, A.ZipCode) AS GuestAddress,
       G.PhoneNum
FROM Guest G
         JOIN Address A ON G.AddressId = A.AddressId
WHERE G.PhoneNum = '555-555-5555';
-- 1 ROW FOR 555-555-5555