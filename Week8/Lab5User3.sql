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
	