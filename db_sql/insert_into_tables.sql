-- INSERT Customers (tested and passed) --
INSERT INTO Customers(first_name, last_name, date_of_birth, email_address)
VALUES
	("Chris", "Jacobs", "1988-11-27", "jacobsc2@oregonstate.edu"),
	("Jane", "Johnson", "1992-12-28", "janejohnson@example.edu");

------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT Orders (tested and passed) --
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Orders(customer_id, when_created)
SELECT 	customer_id,
		"2022/02/23" AS when_created
FROM Customers
WHERE customer_id = '1';


INSERT INTO Orders(customer_id, when_created)
SELECT 	customer_id,
		"2022/02/22" AS when_created
FROM Customers
WHERE customer_id = '2'

------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO OrderItems (needs Products before testing)
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO OrderItems (order_id, product_id, product_qty)
SELECT 	order_id,
		product_id,
		1 AS product_qty

FROM  	Orders, Products
WHERE  	Orders.order_id = 1 AND
		Products.product_id = 1;


INSERT INTO OrderItems (order_id, product_id, product_qty)
SELECT 	order_id,
		product_id,
		1 AS product_qty

FROM  	Orders, Products
WHERE  	Orders.order_id = 1 AND
		Products.product_id = 2;


INSERT INTO OrderItems (order_id, product_id, product_qty)
SELECT 	order_id,
		product_id,
		2 AS product_qty

FROM  	Orders, Products
WHERE  	Orders.order_id = 2 AND
		Products.product_id = 1;

------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT Shipments (needs Addresses before testing)
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Shipments
			(
				order_id,
				address_id,
				datetime_created,
				tracking_number,
				total_lbs,
				total_cubic_in,
				shipping_cost
			)
SELECT 	order_id,
		address_id,
		"2022-2-3 01:01:01" AS datetime_created,
		"C1T687H85FWJ78PD" AS tracking_number,
		0 AS total_lbs,
		0 AS total_cubic_in,
		0.00 AS shipping_cost
FROM  	Orders, Addresses
WHERE  	Orders.order_id = 1 AND
		Addresses.address_id = 1;


INSERT INTO Shipments
			(
				order_id,
				address_id,
				datetime_created,
				tracking_number,
				total_lbs,
				total_cubic_in,
				shipping_cost
			)
SELECT 	order_id,
		address_id,
		"2022-2-23 01:01:01" AS datetime_created,
		"C1T687H85FWJ78PD" AS tracking_number,
		0 AS total_lbs,
		0 AS total_cubic_in,
		0.00 AS shipping_cost
FROM  	Orders, Addresses
WHERE  	Orders.order_id = 2 AND
		Addresses.address_id = 2;

------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO ShipmentItems  (needs Addresses before testing)
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO ShipmentItems (shipment_id, product_id, item_qty)
SELECT 	shipment_id,
		product_id,
		1 as item_qty

FROM  	Shipments, Products
WHERE  	Shipments.shipment_id = 1 AND
		Products.product_id = 1;


INSERT INTO ShipmentItems (shipment_id, product_id, item_qty)
SELECT 	shipment_id,
		product_id,
		1 as item_qty

FROM  	Shipments, Products
WHERE  	Shipments.shipment_id = 1 AND
		Products.product_id = 2;


INSERT INTO ShipmentItems (shipment_id, product_id, item_qty)
SELECT 	shipment_id,
		product_id,
		2 AS item_qty

FROM  	Shipments, Products
WHERE  	Shipments.shipment_id = 1 AND
		Products.product_id = 1;

------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO Transactions (needs PayMethods/Addresses before testing)
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Transactions 
			(
				order_id, 
				pay_method_id,
				transaction_amount,
				datetime_charged,
				confirmation_code,
				check_sum,
				datetime_success
			)
SELECT 	order_id,
		pay_method_id,
		32.98 AS transaction_amount,
		"2022-2-23 01:01:01" AS datetime_charged,
		"9816541897116582" AS confirmation_code,
		"JH18-2T56-KO29-83KJ" AS check_sum,
		"2022-2-23 01:01:01" AS datetime_success
FROM  	Orders, PayMethods
WHERE  	Orders.order_id = 1 AND
		PayMethods.pay_method_id = 1; 


INSERT INTO Transactions 
			(
				order_id, 
				pay_method_id,
				transaction_amount,
				datetime_charged,
				confirmation_code,
				check_sum,
				datetime_success
			)
SELECT 	order_id,
		pay_method_id,
		39.98 AS transaction_amount,
		"2022-2-23 01:01:01" AS datetime_charged,
		"9816541897116582" AS confirmation_code,
		"JH18-2T56-KO29-83KJ" AS check_sum,
		"2022-2-23 01:01:01" AS datetime_success

FROM  	Orders, PayMethods
WHERE  	Orders.order_id = 2 AND
		PayMethods.pay_method_id = 2; 

------------------------------------------------------------------------------------------------------------------------------------------------