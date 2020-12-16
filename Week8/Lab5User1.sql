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