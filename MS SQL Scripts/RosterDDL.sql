USE master;
GO

CREATE DATABASE SGRoster;
GO

USE SGRoster;
GO

CREATE TABLE Cohort
(
    CohortId   INT IDENTITY (1,1) PRIMARY KEY,
    StartDate  DATE        NOT NULL,
    [Subject]  VARCHAR(30) NOT NULL,
    [Location] VARCHAR(30) NOT NULL
)
GO

CREATE TABLE Apprentice
(
    ApprenticeId INT IDENTITY (1,1) PRIMARY KEY,
    FirstName    VARCHAR(30) NOT NULL,
    LastName     VARCHAR(30) NOT NULL,
    CohortId     INT FOREIGN KEY
        REFERENCES Cohort (CohortId)
)
GO
