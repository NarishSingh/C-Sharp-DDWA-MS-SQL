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

-- alterations
-- start by altering to take out the constraints
ALTER TABLE Apprentice
    DROP CONSTRAINT FK__Apprentic__Cohor__267ABA7A
GO

ALTER TABLE Apprentice
    DROP COLUMN CohortId
GO

-- Drop the whole table
DROP TABLE Apprentice
GO

-- we need a many to many bridge table
-- create the bridge
-- make 2 pk's before the 2 fk's
CREATE TABLE ApprenticeCohort
(
    ApprenticeId INT NOT NULL,
    CohortId     INT NOT NULL,
    CONSTRAINT Pk_ApprenticeCohort
        PRIMARY KEY (ApprenticeId, CohortId),
    CONSTRAINT Fk_Cohort_ApprenticeCohort
        FOREIGN KEY (CohortId)
            REFERENCES Cohort (CohortId),
    CONSTRAINT Fk_Apprentice_ApprenticeCohort
        FOREIGN KEY (ApprenticeId)
            REFERENCES Apprentice (ApprenticeId)
)
GO

-- more alterations
-- add col to apprentice
ALTER TABLE Apprentice
    ADD DateOfBirth DATE NOT NULL;
GO

-- alter its type and nullability
ALTER TABLE Apprentice
    ALTER COLUMN DateOfBirth DATETIME2 NULL
GO

-- drop the whole thing
DROP DATABASE SGRoster
GO