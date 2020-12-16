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