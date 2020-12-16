/*RESET
DROP table Sales2019;
DROP table Projections2020;
DROP table Customers;
DROP ROLE R1AdminRole;
DROP USER Lab5_1DANBECK CASCADE;
DROP USER Lab5_2MICHAELSCOTT CASCADE;
DROP USER Lab5_3DWIGHTSCHRUTE CASCADE;
DROP PROFILE PAdminUsers CASCADE;
*/

/*Customers table
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

/*Sales2019 table
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

/*Projections2020 table
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

/*Create 3 Users, Profile and Role*/
CREATE PROFILE PAdminUsers LIMIT
	PASSWORD_VERIFY_FUNCTION ORA12C_VERIFY_FUNCTION
	SESSIONS_PER_USER 3
	FAILED_LOGIN_ATTEMPTS 4
	PASSWORD_LIFE_TIME 120
	PASSWORD_LOCK_TIME 1/24;

/*--------------DON'T LEAVE LIKE THIS-----------*/	
/*CREATE USER Lab5_1DANBECK 
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
    PASSWORD EXPIRE;*/

CREATE ROLE R1AdminRole;
GRANT create session TO R1AdminRole;

grant select, update, insert, delete, read on Customers to Lab5_1DANBECK;
grant select, update, insert, delete, read on Sales2019 to Lab5_1DANBECK;
grant select, update, insert, delete, read on Projections2020 to Lab5_1DANBECK;

grant select, update, insert, delete, read on Customers to Lab5_2MICHAELSCOTT;
grant select, update, insert, delete, read on Sales2019 to Lab5_2MICHAELSCOTT;
grant select, update, insert, delete, read on Projections2020 to Lab5_2MICHAELSCOTT;

grant select, update, insert, delete, read on Customers to Lab5_3DWIGHTSCHRUTE;
grant select, update, insert, delete, read on Sales2019 to Lab5_3DWIGHTSCHRUTE;
grant select, update, insert, delete, read on Projections2020 to Lab5_3DWIGHTSCHRUTE;

GRANT R1AdminRole to Lab5_1DANBECK;
GRANT R1AdminRole to Lab5_2MICHAELSCOTT;
GRANT R1AdminRole to Lab5_3DWIGHTSCHRUTE;



/*populate the tables with real-looking data*/
/*Customers */
INSERT into Customers
VALUES (1, 'Smith', 'John', 'jsmith@gmail.com', '410-987-5172');
INSERT into Customers
VALUES (2, 'Lee', 'Karen', 'klee@hotmail.com', '717-255-2689');
INSERT into Customers
VALUES (3, 'Thomas', 'Eric', 'ethomas@msn.com', '955-698-9245');

/*Sales2019 */
INSERT into Sales2019
VALUES (1, '22-FEB-2019', '2000', '562.33');
INSERT into Sales2019
VALUES (2, '27-MAR-2019', '6000', '1589.38');
INSERT into Sales2019
VALUES (3, '02-DEC-2019', '12000', '3498.73');

/*Projections */
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


/*General info
Database Passwords: !newpassword1!

Audit tracking used:


Follow the audit trail: show parameter audit_trail;
						desc dba_audit_trail;
	example table-->	AUDIT * ON STUDENTS;
	finsh audit-->		NO AUDIT Insert, Update on Students;
						select username, extended_timestamp, action_name, obj_name, sql_text from dba_audit_trail;
-------------------End of Program----------------/*




































