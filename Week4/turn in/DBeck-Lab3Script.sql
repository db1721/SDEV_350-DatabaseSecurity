/*1. A unique Profile based on the following requirements:
a. Password complexity should meet requirements for Ora12 Verify function.
b. User may have up to 3 concurrent sessions.
c. User may have up to 4 consecutive failed attempts to log in before the account is locked.
d. User may wait up till 120 days before their password must be changed.
e. User account will be locked for 1 hours after the specified number of consecutive failed login attempts.*/
CREATE PROFILE PDanBeck LIMIT
	PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION
	SESSIONS_PER_USER 3
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME 120
	PASSWORD_LOCK_TIME 1/24;

/*2. Verification that profile was successfully created*/
Select * from DBA_PROFILES where Profile = 'PDANBECK';

/*3. The creation of two users assigned to the Permanent Tablespace of Users with a Quota of 30M. Assign
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
into each table.
A. Creation of User1Data table
B. Createion of User2Data table
C. Insert three entries into User1Data table
D. Insert three entries into User2Data table*/

/*5A. Create User1Data table */
create table User1Data(
OID int PRIMARY KEY,
PlayerName VARCHAR(50),
Team VARCHAR(25),
Position VARCHAR(25)
);

/*5B. Create User2Data table */
create table User2Data(
DID int PRIMARY KEY,
PlayerName VARCHAR(50),
Team VARCHAR(25),
Position VARCHAR(25)
);

/*5C. Insert 3 User1Data */
INSERT into User1Data
VALUES (1, 'Tom Brady', 'Buccaneers', 'QB');
INSERT into User1Data
VALUES (2, 'Alvin Kamara', 'Saints', 'RB');
INSERT into User1Data
VALUES (3, 'Davonte Adams', 'Packers', 'WR');

/*5D. Insert 3 User2Data */
INSERT into User2Data
VALUES (1, 'Devon White', 'Buccaneers', 'LB');
INSERT into User2Data
VALUES (2, 'TJ Watt', 'Steelers', 'DE');
INSERT into User2Data
VALUES (3, 'Marlon Humphry', 'Ravens', 'CB');

/*6. Provide privileges to created users to be able to connect to
the database and create tables. */
grant create session to U1DANBECK;
grant select, insert on User1Data to U1DANBECK;
grant create table to U1DANBECK;

grant create session to U2DANBECK;
grant select on User1Data to U2DANBECK;
grant select on User2Data to U2DANBECK;
grant create table to U2DANBECK;

