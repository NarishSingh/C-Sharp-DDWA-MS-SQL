USE master;
GO

DROP DATABASE IF EXISTS HotelDb;
GO

CREATE DATABASE HotelDb;
GO

USE HotelDb;
GO

-- ROOM DATA
CREATE TABLE RoomType
(
    RoomTypeId        INT IDENTITY (1,1) PRIMARY KEY,
    TypeName          VARCHAR(6)    NOT NULL,
    BasePrice         DECIMAL(5, 2) NOT NULL,
    ExtraPersonFee    DECIMAL(4, 2) NOT NULL,
    MaxOccupancy      INT           NOT NULL,
    StandardOccupancy INT           NULL
);

CREATE TABLE Amenity
(
    AmenityId INT IDENTITY (1,1) PRIMARY KEY,
    Name      VARCHAR(20)   NOT NULL,
    Cost      DECIMAL(4, 2) NOT NULL
);

CREATE TABLE Room
(
    RoomNum       INT PRIMARY KEY,
    AdaAccessible BIT DEFAULT (0) NOT NULL, --  bit == bool
    RoomTypeId    INT             NOT NULL,
    CONSTRAINT Fk_RoomType_Room FOREIGN KEY (RoomTypeId)
        REFERENCES RoomType (RoomTypeId)
);

-- Room-Amenity Bridge
CREATE TABLE RoomAmenity
(
    AmenityId INT NOT NULL,
    RoomNum   INT NOT NULL,
    CONSTRAINT Pk_RoomAmenity PRIMARY KEY (AmenityId, RoomNum),
    CONSTRAINT Fk_Amenity_RoomAmenity FOREIGN KEY (AmenityId)
        REFERENCES Amenity (AmenityId),
    CONSTRAINT Fk_Room_RoomAmenity FOREIGN KEY (RoomNum)
        REFERENCES Room (RoomNum)
);

-- GUEST DATA
CREATE TABLE Address
(
    AddressId INT IDENTITY (1,1) PRIMARY KEY,
    Street   VARCHAR(50) NOT NULL,
    City      VARCHAR(50) NOT NULL,
    State     CHAR(2)     NOT NULL,
    ZipCode   CHAR(5)     NOT NULL
);

CREATE TABLE Guest
(
    GuestId   INT IDENTITY (1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName  VARCHAR(50) NOT NULL,
    PhoneNum  CHAR(12)    NOT NULL,
    AddressId INT         NOT NULL,
    CONSTRAINT Fk_Address_Guest FOREIGN KEY (AddressId)
        REFERENCES Address (AddressId)
);

-- RESERVATION DATA
CREATE TABLE Reservation
(
    ReservationId INT IDENTITY (1,1) PRIMARY KEY,
    CheckIn       DATE          NOT NULL,
    CheckOut      DATE          NOT NULL,
    AdultCount    INT           NOT NULL,
    ChildCount    INT           NOT NULL,
    Cost          DECIMAL(6, 2) NOT NULL,
    GuestId       INT           NOT NULL,
    RoomNum       INT           NOT NULL,
    CONSTRAINT Fk_Guest_Reservation FOREIGN KEY (GuestId)
        REFERENCES Guest (GuestId),
    CONSTRAINT Fk_Room_Reservation FOREIGN KEY (RoomNum)
        REFERENCES Room (RoomNum)
);