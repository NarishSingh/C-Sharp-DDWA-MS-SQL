USE SGRoster;
GO

-- Will not work without manual settings for id insert
/*
SET IDENTITY_INSERT Apprentice ON;
INSERT INTO Apprentice(ApprenticeId, FirstName, LastName)
VALUES (1, 'Bill', 'Smith');
SET IDENTITY_INSERT Apprentice OFF;
 */

INSERT INTO Apprentice(FirstName, LastName)
VALUES ('Bill', 'Smith');

INSERT INTO Apprentice(FirstName, LastName)
VALUES ('Bob', 'Jones'),
       ('Brenda', 'Walters'),
       ('Shauna', 'Mullins');

SELECT *
FROM Apprentice;

-- Insert to fk
INSERT INTO Cohort(StartDate, [Subject], [Location])
VALUES ('1/9/2017', 'C#', 'Akron');

-- no cohort 2, will fail
-- INSERT INTO ApprenticeCohort(ApprenticeId, CohortId) 
-- VALUES (1,2);

INSERT INTO Cohort(StartDate, [Subject], [Location])
VALUES ('1/9/2017', 'Java', 'Akron');

INSERT INTO ApprenticeCohort(ApprenticeId, CohortId)
VALUES (1, 2), --Bill
       (3, 2), --Brenda
       (4, 1); --Shauna

SELECT *
FROM ApprenticeCohort;

-- Updating data
UPDATE ApprenticeCohort
SET CohortId = 1
WHERE ApprenticeId = 1;

-- update multiple
UPDATE ApprenticeCohort
SET CohortId = 1
WHERE ApprenticeId IN (3, 4);

-- Delete data
-- will fail due to fk constraint
DELETE
FROM Cohort
WHERE CohortId = 1;

DELETE
FROM Cohort
WHERE CohortId = 2;