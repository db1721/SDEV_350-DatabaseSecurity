/*Creation of Customers table
 CustomerID - Not Null, Integer, Primary Key. The ID of the customer
 CustomerLastName – Not Null, varchar2(40), Lastname of the customer
 CustomerFirstName – Not Null, varchar2(40). Firstname of the customer
 CustomerEmail – Not Null, varchar2(80). Email address of the customer
 CustomerPhone – varchar2(12), Phone number of the customer.
 CustomerCellPhone - varchar2(12), Cell Phone number of the customer
*/
create table Customers(
CustomerID int PRIMARY KEY,
CustomerLastName VARCHAR2(40),
CustomerFirstName VARCHAR2(40),
CustomerEmail VARCHAR2(80),
CustomerPhone VARCHAR2(12)
);

/*Creation of Sales2019 table
 CustomerID – Not Null, Integer, References Customers. The ID of the customer.
 TransactionDate – Not Null, Date, Composite Primary Key with CustomerID. The date and time of the sale.
 SalesAmount – not null, number(10,2). The amount of the sale.
 ProfitAmount - not null, number(10,2). The amount of profit for this sale.
*/
create table Sales2019(
CustomerID int,
CONSTRAINT FK_SID FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID),
TransactionDate DATE DEFAULT (sysdate),
SalesAmount NUMBER(10,2),
ProfitAmount NUMBER(10,2),
PRIMARY KEY (CustomerID, TransactionDate)
);

/*Creation of Projections2020 table
 CustomerID – Not Null, Integer, References Customers. The ID of the customer.
 QuarterlyPurchaseAmount – Not Null, number(10,2). Projected Quarterly purchases for this customer.
 QuarterlyProfitAmount – not null, number(10,2). The projected quarterly Profit from purchases from this customer
 Confidence – not null, number (4,2). The confidence (range 0.00 – 1.00) of this projection. Higher numbers indicate more confidence
*/
create table Projections2020(
CustomerID int,
CONSTRAINT FK_PID FOREIGN KEY (CustomerID) 
	REFERENCES Customers(CustomerID),
QuarterlyPurchaseAmount NUMBER(10,2),
QuarterlyProfitAmount NUMBER(10,2),
Confidence NUMBER(4,2)
);

/*Create Profile for users to be assigned to*/
CREATE PROFILE PAdminUsers LIMIT
	PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION
	SESSIONS_PER_USER 3
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME 120
	PASSWORD_LOCK_TIME 1/24;

/*Create 3 users*/
CREATE USER Lab5_1DANBECK 
    IDENTIFIED BY password1$
    DEFAULT TABLESPACE Users 
    QUOTA 30M ON Users  
    PROFILE PAdminUsers
    PASSWORD EXPIRE;
	
CREATE USER Lab5_2MICHAELSCOTT 
    IDENTIFIED BY password1$
    DEFAULT TABLESPACE Users 
    QUOTA 30M ON Users  
    PROFILE PAdminUsers
    PASSWORD EXPIRE;
	
CREATE USER Lab5_3DWIGHTSCHRUTE 
    IDENTIFIED BY password1$
    DEFAULT TABLESPACE Users 
    QUOTA 30M ON Users  
    PROFILE PAdminUsers
    PASSWORD EXPIRE;

/*Create of role that allows users to make changes to the database*/
CREATE ROLE R1AdminRole;
GRANT create session TO R1AdminRole;

/*Granting of privelages that allows users to make changes to the database*/
grant select, update, insert, delete, read on Customers to Lab5_1DANBECK;
grant select, update, insert, delete, read on Sales2019 to Lab5_1DANBECK;
grant select, update, insert, delete, read on Projections2020 to Lab5_1DANBECK;

grant select, update, insert, delete, read on Customers to Lab5_2MICHAELSCOTT;
grant select, update, insert, delete, read on Sales2019 to Lab5_2MICHAELSCOTT;
grant select, update, insert, delete, read on Projections2020 to Lab5_2MICHAELSCOTT;

grant select, update, insert, delete, read on Customers to Lab5_3DWIGHTSCHRUTE;
grant select, update, insert, delete, read on Sales2019 to Lab5_3DWIGHTSCHRUTE;
grant select, update, insert, delete, read on Projections2020 to Lab5_3DWIGHTSCHRUTE;

/*Create of role that allows users to make changes to the database*/
GRANT R1AdminRole to Lab5_1DANBECK;
GRANT R1AdminRole to Lab5_2MICHAELSCOTT;
GRANT R1AdminRole to Lab5_3DWIGHTSCHRUTE;



/*Populate the Customer table with Customers*/
INSERT into Customers
VALUES (1, 'Smith', 'John', 'jsmith@gmail.com', '410-987-5172');
INSERT into Customers
VALUES (2, 'Lee', 'Karen', 'klee@hotmail.com', '717-255-2689');
INSERT into Customers
VALUES (3, 'Thomas', 'Eric', 'ethomas@msn.com', '955-698-9245');

/*Populate the Sales2019 table with Sales*/
INSERT into Sales2019
VALUES (1, '22-FEB-2019', '2000', '562.33');
INSERT into Sales2019
VALUES (2, '27-MAR-2019', '6000', '1589.38');
INSERT into Sales2019
VALUES (3, '02-DEC-2019', '12000', '3498.73');

/*Populate the Projections2020 table with Projections*/
INSERT into Projections2020
VALUES (1, '2500', '589.36', '.38');
INSERT into Projections2020
VALUES (2, '8000', '2563.95', '.86');
INSERT into Projections2020
VALUES (3, '14000', '4269.99', '.69');

/*Audit statements that allow for auditing trail of each table*/
audit ALTER, GRANT, INSERT, UPDATE, DELETE, SELECT on ADMIN.CUSTOMERS;
audit ALTER, GRANT, INSERT, UPDATE, DELETE, SELECT on ADMIN.Projections2020;
audit ALTER, GRANT, INSERT, UPDATE, DELETE, SELECT on ADMIN.Sales2019;

/*10 transactions completed, logged in as Lab5_1DANBECK*/
INSERT into ADMIN.customers
VALUES(4, 'Evans', 'Mary', 'mevans@gmail.com', '823-452-0593');

DELETE FROM ADMIN.Sales2019 
	WHERE ProfitAmount > '500';

INSERT into ADMIN.Sales2019
VALUES (1, '22-OCT-2019', '4000', '599.33');

INSERT into ADMIN.Sales2019
VALUES (2, '02-MAR-2019', '6500', '1789.38');

INSERT into ADMIN.Sales2019
VALUES (3, '02-DEC-2019', '21000', '4998.73');

SELECT * FROM ADMIN.Projections2020;

UPDATE Admin.Customers
	SET CustomerPhone = '484-898-9321'
	WHERE CustomerID = '1';
	
SELECT MIN(ProfitAmount)
	FROM ADMIN.Sales2019;
	
SELECT *
	FROM ADMIN.Projections2020
	ORDER BY QuarterlyProfitAmount ASC;
	
UPDATE Admin.Sales2019
	SET ProfitAmount = '785.23'
	WHERE CustomerID = '1';
	
/*10 transactions completed, logged in as Lab5_2MICHAELSCOTT*/
INSERT into ADMIN.customers
VALUES(5, 'Sanders', 'Kelly', 'ksanders@gmail.com', '213-233-9217');

INSERT into ADMIN.customers
VALUES(6, 'Gregg', 'Shaun', 'sgregg@gmail.com', '559-989-6321');

INSERT into ADMIN.Sales2019
VALUES (4, '22-MAY-2019', '2500', '90.23');

INSERT into ADMIN.Sales2019
VALUES (5, '12-JUN-2019', '8500', '1989.68');

INSERT into ADMIN.Sales2019
VALUES (6, '26-SEP-2019', '9000', '1998.79');

UPDATE ADMIN.Customers
	SET CustomerPhone = '798-934-5871'
	WHERE CustomerID = '2';
	
SELECT MAX(ProfitAmount)
	FROM ADMIN.Sales2019;
	
SELECT *
	FROM ADMIN.Projections2020
	ORDER BY QuarterlyProfitAmount DESC;
	
SELECT AVG(SalesAmount)
	FROM ADMIN.Sales2019;
	
SELECT SUM(SalesAmount)
	FROM ADMIN.Sales2019;
	
/*10 transactions completed, logged in as Lab5_3DWIGHTSCHRUTE*/
INSERT into ADMIN.customers
VALUES(7, 'Sanders', 'Kelly', 'ksanders@gmail.com', '213-233-9217');

INSERT into ADMIN.customers
VALUES(8, 'Gregg', 'Shaun', 'sgregg@gmail.com', '559-989-6321');

INSERT into ADMIN.Sales2019
VALUES (7, '16-FEB-2019', '2699', '190.75');

INSERT into ADMIN.Sales2019
VALUES (8, '19-JAN-2019', '7500', '1722.68');

INSERT into ADMIN.Projections2020
VALUES (4, '5600', '1591.76', '.51');

INSERT into ADMIN.Projections2020
VALUES (5, '19000', '7962.95', '.88');

UPDATE ADMIN.Customers
	SET CustomerPhone = '773-965-8420'
	WHERE CustomerID = '3';
	
SELECT MAX(QuarterlyPurchaseAmount)
	FROM ADMIN.Projections2020;
	
SELECT *
	FROM ADMIN.Projections2020
	ORDER BY Confidence ASC;
	
SELECT AVG(Confidence)
	FROM ADMIN.Projections2020;

/*Shows the audit trail*/
select username, extended_timestamp, action_name, obj_name, sql_text from dba_audit_trail;
/*-------------------End of Program----------------/*




































