/* clear all
drop table ClassEnrollments;
drop table Engineers;
drop table Faculty;
drop table Classes;
drop view JoinView;
*/

/*Create Engineers table */
create table Engineers(
EID int PRIMARY KEY,
LastName VARCHAR(50),
FirstName VARCHAR(50),
Email VARCHAR(50),
Graddate VARCHAR(15)
);

/*Create faculty table */
create table Faculty(
FID int PRIMARY KEY,
LastName VARCHAR(50),
FirstName VARCHAR(50),
Email VARCHAR(50),
Hiredate VARCHAR(15)
);

/*Create classes table */
create table Classes(
CID int PRIMARY KEY,
Subject VARCHAR(10),
Catalognbr VARCHAR(10),
Title VARCHAR(50)
);

/*create ClassEnrollments table */
create table ClassEnrollments(
EnID int PRIMARY KEY,
CID int,
FID int,
EID int,
CONSTRAINT FK_CID FOREIGN KEY (CID)
    REFERENCES Classes(CID),
CONSTRAINT FK_FID FOREIGN KEY (FID)
    REFERENCES Faculty(FID),
CONSTRAINT FK_EID FOREIGN KEY (EID)
    REFERENCES Engineers(EID)
);

/*Insert 15 Engineers */
INSERT into Engineers
VALUES (1, 'Brady', 'Tom', 'tbrady@nfl.com', '06/15/2020');
INSERT into Engineers
VALUES (2, 'Jackson', 'Lamar', 'ljackson@nfl.com', '02/25/2020');
INSERT into Engineers
VALUES (3, 'Burrow', 'Joe', 'jburrow@nfl.com', '02/29/2010');
INSERT into Engineers
VALUES (4, 'Mayfield', 'Baker', 'bmayfeild@nfl.com', '09/25/2020');
INSERT into Engineers
VALUES (5, 'Prescott', 'Dak', 'dprescott@nfl.com', '02/05/2020');
INSERT into Engineers
VALUES (6, 'Brees', 'Drew', 'dbreses@nfl.com', '12/25/2020');
INSERT into Engineers
VALUES (7, 'Newton', 'Cam', 'cnewton@nfl.com', '10/26/2020');
INSERT into Engineers
VALUES (8, 'Winston', 'Jameis', 'jwinston@nfl.com', '02/18/2020');
INSERT into Engineers
VALUES (9, 'Bridgewater', 'Teddy', 'tbridgewater@nfl.com', '09/05/2020');
INSERT into Engineers
VALUES (10, 'Maholmes', 'Patrick', 'pmaholmes@nfl.com', '07/29/2020');
INSERT into Engineers
VALUES (11, 'Smith', 'Alex', 'asmith@nfl.com', '09/25/2020');
INSERT into Engineers
VALUES (12, 'Darnold', 'Sam', 'sdarnold@nfl.com', '06/28/2020');
INSERT into Engineers
VALUES (13, 'Lock', 'Drew', 'dlock@nfl.com', '02/03/2020');
INSERT into Engineers
VALUES (14, 'Wilson', 'Russell', 'rwilson@nfl.com', '11/15/2020');
INSERT into Engineers
VALUES (15, 'Jones', 'Daniel', 'djones@nfl.com', '09/25/2020');

/*Insert 3 Faculty */
INSERT into Faculty
VALUES (1, 'Arians', 'Bruce', 'barians@nfl.com', '09/15/2020');
INSERT into Faculty
VALUES (2, 'Harbaugh', 'John', 'jharbaugh@nfl.com', '12/05/2020');
INSERT into Faculty
VALUES (3, 'Peyton', 'Sean', 'speyton@nfl.com', '09/30/2020');

/*Insert 3 Classes */
INSERT into Classes
VALUES (1, 'BST-OFF', 'BO-0001', 'Best Offense');
INSERT into Classes
VALUES (2, 'BST-DEF', 'BD-0002', 'Best Defense');
INSERT into Classes
VALUES (3, 'BST-SPT', 'ST-0003', 'Best Special Teams');

/*Insert 15 ClassEnrollments */
INSERT into ClassEnrollments
VALUES(1, 1, 1, 1);
INSERT into ClassEnrollments
VALUES(2, 3, 3, 2);
INSERT into ClassEnrollments
VALUES(3, 2, 3, 3);
INSERT into ClassEnrollments
VALUES(4, 3, 3, 4);
INSERT into ClassEnrollments
VALUES(5, 3, 2, 5);
INSERT into ClassEnrollments
VALUES(6, 3, 1, 6);
INSERT into ClassEnrollments
VALUES(7, 2, 1, 7);
INSERT into ClassEnrollments
VALUES(8, 1, 2, 8);
INSERT into ClassEnrollments
VALUES(9, 3, 1, 9);
INSERT into ClassEnrollments
VALUES(10, 2, 3, 10);
INSERT into ClassEnrollments
VALUES(11, 3, 3, 11);
INSERT into ClassEnrollments
VALUES(12, 3, 1, 12);
INSERT into ClassEnrollments
VALUES(13, 1, 1, 13);
INSERT into ClassEnrollments
VALUES(14, 2, 1, 14);
INSERT into ClassEnrollments
VALUES(15, 2, 2, 15);

/*Select all items from Classes table */
SELECT * FROM Classes
ORDER BY CID DESC;

/*Select all items from Faculty table */
SELECT * FROM Faculty
ORDER BY FID DESC;

/*Select all items from ClassEnrollments table */
SELECT * FROM ClassEnrollments
ORDER BY EID DESC;

/*Update the Lastname of one faculty in the Faculty table to be “Friendship” */
UPDATE Faculty
SET LastName = 'Friendship'
WHERE FID = 1;

/*Update the Firstname of one engineer in the Engineers table to be “Amadeus” */
UPDATE Engineers
SET FirstName = 'Amadeus'
WHERE EID = 7;

/*Update the Subject of one class in the Classes table to be “IOT Cyber” */
UPDATE Classes
SET Subject = 'IOT Cyber'
WHERE CID = 3;

/*statement that will Delete the ClassEnrollments record with the lowest EnID */
DELETE FROM ClassEnrollments WHERE EnID IN (select min(EnID) from ClassEnrollments);

/*View statement that joins multple tables */
CREATE VIEW JoinView AS
SELECT 
    e.lastname, e.firstname
FROM 
    Engineers e
INNER JOIN classenrollments ce ON
    ce.enid = e.eid;
	
SELECT * FROM JoinView;

