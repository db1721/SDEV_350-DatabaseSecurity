/*RESET
DROP table User1Data;
DROP table User2Data;
DROP ROLE R1DANBECK;
DROP USER U1DANBECK CASCADE;
DROP USER U2DANBECK CASCADE;
DROP PROFILE PDANBECK CASCADE;
*/

/*1. Create a unique Profile based on the following requirements:
a. Password complexity should meet requirements for Ora12 Verify function.
b. User may have up to 3 concurrent sessions.
c. User may have up to 4 consecutive failed attempts to log in before the account is locked.
d. User may wait up till 120 days before their password must be changed.
e. User account will be locked for 1 hours after the specified number of consecutive failed login attempts.
f. Default values for other Profile parameters is acceptable
g. You should name the Profile PFirstnameLastname where Lastname and Firstname are your First and Lastname*/
CREATE PROFILE PDanBeck LIMIT
	PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION
	SESSIONS_PER_USER 3
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME 120
	PASSWORD_LOCK_TIME 1/24;

/*2. Verify your Profile was successfully created by Creating and executing a SQL statement querying the appropriate Data Dictionary objects.*/
Select * from DBA_PROFILES where Profile = 'PDANBECK';

/*3. Create 2 users assign them to the Permanent Tablespace of Users with a Quota of 30M. Assign
the new users the Profile you established in Step 1 of this lab. Be sure to expire their passwords
upon creation.*/
CREATE USER U1DANBECK 
    IDENTIFIED BY dan_beck1
    DEFAULT TABLESPACE Users 
    QUOTA 30M ON Users  
    PROFILE PDanBeck
    PASSWORD EXPIRE;
	
CREATE USER U2DANBECK 
    IDENTIFIED BY dan_beck2
    DEFAULT TABLESPACE Users 
    QUOTA 30M ON Users  
    PROFILE PDanBeck
    PASSWORD EXPIRE;
	
/*4. Create a role allowing users assigned to be able to connect to the database and create tables.*/
CREATE ROLE R1DANBECK;
GRANT create table TO R1DANBECK;	

/*5. Create two tables in your (root/admin) schema. Name them User1Data and User2Data. The
tables should contain a primary key and 3 additional columns of your choice. Insert 3 records
into each table.*/
/*Create User1Data table */
create table User1Data(
OID int PRIMARY KEY,
PlayerName VARCHAR(50),
Team VARCHAR(25),
Position VARCHAR(25)
);

/*Create User2Data table */
create table User2Data(
DID int PRIMARY KEY,
PlayerName VARCHAR(50),
Team VARCHAR(25),
Position VARCHAR(25)
);

/*Insert 3 User1Data */
INSERT into User1Data
VALUES (1, 'Tom Brady', 'Buccaneers', 'QB');
INSERT into User1Data
VALUES (2, 'Alvin Kamara', 'Saints', 'RB');
INSERT into User1Data
VALUES (3, 'Davonte Adams', 'Packers', 'WR');

/*Insert 3 User2Data */
INSERT into User2Data
VALUES (1, 'Devon White', 'Buccaneers', 'LB');
INSERT into User2Data
VALUES (2, 'TJ Watt', 'Steelers', 'DE');
INSERT into User2Data
VALUES (3, 'Marlon Humphry', 'Ravens', 'CB');

/*6. Provide privileges for U1FirstnameLastname and U2FirstnameLastname to be able to connect to
the database and create tables. */
grant create session to U1DANBECK;
grant select, insert on User1Data to U1DANBECK;
grant create table to U1DANBECK;

grant create session to U2DANBECK;
grant select on User1Data to U2DANBECK;
grant select on User2Data to U2DANBECK;
grant create table to U2DANBECK;

/*Test U1DANBECK privileges
Reset:
DROP TABLE U1TABLE;*/
create table U1Table(
U1ID int PRIMARY KEY,
Company VARCHAR(50),
Tenure VARCHAR(25),
Position VARCHAR(25)
);
