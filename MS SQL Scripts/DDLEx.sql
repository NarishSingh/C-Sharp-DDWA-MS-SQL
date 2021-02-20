USE master;
GO

CREATE DATABASE MovieDb;
GO

USE MovieDb;
GO

/*
Genre 
GenreID - Primary Key, identity
GenreName - Required, extended character set, 30 length
 */
CREATE TABLE Genre
(
    GenreId   INT IDENTITY (1,1) PRIMARY KEY,
    GenreName NVARCHAR(30) NOT NULL
)
GO

/*
Director 
DirectorID - Primary Key, identity
FirstName - Required, extended character set, 30 length
LastName - Required, extended character set, 30 length
BirthDate - Not Required
 */
CREATE TABLE Director
(
    DirectorId INT IDENTITY (1,1) PRIMARY KEY,
    FirstName  NVARCHAR(30) NOT NULL,
    LastName   NVARCHAR(30) NOT NULL,
    BirthDate  DATE         NULL
)
GO

/*
Rating 
RatingID - Primary Key, identity
RatingName - Required, standard character set, 5 length
 */
CREATE TABLE Rating
(
    RatingId   INT IDENTITY (1,1) PRIMARY KEY,
    RatingName VARCHAR(5) NOT NULL
)
GO

/*
Actor 
ActorID - Primary Key, identity
FirstName - Required, extended character set, 30 length
LastName - Required, extended character set, 30 length
BirthDate - Not Required
 */
CREATE TABLE Actor
(
    ActorId   INT IDENTITY (1,1) PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL,
    LastName  NVARCHAR(30) NOT NULL,
    BirthDate DATE         NULL
)
GO

/*
Movie 
MovieID - Primary Key, identity
GenreID - Foreign Key, Genre Table, Required
DirectorID - Foreign Key, Director Table, Not Required
RatingID - Foreign Key, Rating Table, Not Required
Title - Required, extended character set, 128 length
Release Date - Not Required
 */
CREATE TABLE Movie
(
    MovieId     INT IDENTITY (1,1) PRIMARY KEY,
    Title       NVARCHAR(128) NOT NULL,
    ReleaseDate DATE          NULL,
    GenreId     INT           NOT NULL,
    DirectorId  INT           NULL,
    RatingId    INT           NULL,
    CONSTRAINT Fk_Genre_Movie FOREIGN KEY (GenreId)
        REFERENCES Genre (GenreId),
    CONSTRAINT Fk_Director_Movie FOREIGN KEY (DirectorId)
        REFERENCES Director (DirectorId),
    CONSTRAINT Fk_Rating_Movie FOREIGN KEY (RatingId)
        REFERENCES Rating (RatingId)
)
GO

/*
CastMembers 
CastMemberID - Primary Key, identity
ActorID - Foreign Key, Actor Table, Required
MovieID - Foreign Key, Movie Table, Required
Role - Required, extended character set, 50 length
 */
CREATE TABLE CastMembers
(
    CastMemberId INT IDENTITY (1,1) PRIMARY KEY,
    [Role]       NVARCHAR(50) NOT NULL,
    ActorId      INT          NOT NULL,
    MovieId      INT          NOT NULL,
    CONSTRAINT Fk_Actor_CastMember FOREIGN KEY (ActorId)
        REFERENCES Actor (ActorId),
    CONSTRAINT Fk_Movie_CastMember FOREIGN KEY (MovieId)
        REFERENCES Movie (MovieId)
)
GO
