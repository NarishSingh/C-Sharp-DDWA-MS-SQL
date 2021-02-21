USE MovieDb;
GO

-- INSERT QUERIES
-- Actors
INSERT INTO Actor(FirstName, LastName, BirthDate)
VALUES ('Bill', 'Murray', '9/21/1950'),
       ('Dan', 'Aykroyd', '7/1/1952'),
       ('John', 'Candy', '10/31/1950'),
       ('Steve', 'Martin', NULL),
       ('Sylvester', 'Stallone', NULL);

-- Directors
INSERT INTO Director(FirstName, LastName, BirthDate)
VALUES ('Ivan', 'Reitman', '10/24/1946'),
       ('Ted', 'Kotcheff', NULL);

-- Ratings
INSERT INTO Rating(RatingName)
VALUES ('G'),
       ('PG'),
       ('PG-13'),
       ('R');

-- Genres
INSERT INTO Genre(GenreName)
VALUES ('Action'),
       ('Comedy'),
       ('Drama'),
       ('Horror');

-- Movie
INSERT INTO Movie(Title, ReleaseDate, GenreId, DirectorId, RatingId)
VALUES ('Rambo: First Blood', '10/22/1982', 1, 2, 4),
       ('Planes, Trains, & Automobiles', '11/25/1987', 2, NULL, 4),
       ('Ghostbusters', NULL, 2, 1, 2),
       ('The Great Outdoors', '6/17/1988', 2, NULL, 2);

-- Cast Members
INSERT INTO CastMembers(Role, ActorId, MovieId)
VALUES ('John Rambo', 5, 1),
       ('Neil Page', 4, 2),
       ('Del Griffith', 3, 2),
       ('Dr. Peter Venkman', 1, 3),
       ('Dr. Raymond Stanz', 2, 3),
       ('Roman Craig', 2, 4),
       ('Chet Ripley', 3, 4);

-- --------------
-- UPDATE QUERIES
UPDATE Movie
SET Title       = 'Ghostbusters (1984)',
    ReleaseDate = '6/8/1984'
WHERE Title = 'Ghostbusters';

UPDATE Genre
SET GenreName = 'Action/Adventure'
WHERE GenreName = 'Action';

-- --------------
-- DELETE QUERIES
DELETE CastMembers
WHERE MovieId = 1;

DELETE Movie
WHERE Title = 'Rambo: First Blood';

-- --------------
-- ALTER QUERIES
ALTER TABLE Actor
    ADD DateOfDeath DATE NULL;
GO

UPDATE Actor
SET DateOfDeath = '3/4/1994'
WHERE ActorId = 3;

-- --------------
-- Checks
SELECT *
FROM Actor;
SELECT *
FROM Genre;
SELECT *
FROM Rating;
SELECT *
FROM Movie;
SELECT *
FROM CastMembers;
