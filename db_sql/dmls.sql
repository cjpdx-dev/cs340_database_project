
-- ***************************************************************************************
-- Customers
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- INSERT Customer --
INSERT INTO Customers (first_name, last_name, date_of_birth, email_address)
VALUES (
		:input_first_name, 
		:input_last_name, 
		:input_date_of_birth, 
		:input_email_address
);

-- ____ SELECTS _______________________________________________________________________________

-- Select All Customers
SELECT * FROM Customers;

-- Select Customer By customer_id
SELECT * FROM Customers as cust
WHERE customer_id = :input_customer_id;

-- Select Customer by first_name
SELECT * FROM Customers as cust
WHERE Customers.first_name = :input_first_name;

-- Select Customer By Last Name
SELECT * FROM Customers as cust
WHERE Customers.last_name = :input_last_name;

-- Select Customer by First and Last Name
SELECT * FROM Customers as cust
WHERE 	Customers.last_name = :input_last_name AND 
		Customers.first_name = :input_first_name;

-- ____ UPDATES _______________________________________________________________________________

-- Update Customer Email Address by customer_id
UPDATE 	Customers 
SET 	email_address = :updated_email_address
WHERE	customer_id = :input_customer_id;

-- ____ DELETES _______________________________________________________________________________



-- ***************************************************************************************
-- Addresses 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- ____ SELECTS _______________________________________________________________________________

-- ____ UPDATES _______________________________________________________________________________

-- ____ DELETES _______________________________________________________________________________



-- ***************************************************************************************
-- CustomerAddresses 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- ____ SELECTS _______________________________________________________________________________

-- ____ UPDATES _______________________________________________________________________________

-- ____ DELETES _______________________________________________________________________________



-- ***************************************************************************************
-- PayMethods
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- ____ SELECTS _______________________________________________________________________________

-- ____ UPDATES _______________________________________________________________________________

-- ____ DELETES _______________________________________________________________________________



-- ***************************************************************************************
-- CustomerPayMethods 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- ____ SELECTS _______________________________________________________________________________

-- ____ UPDATES _______________________________________________________________________________

-- ____ DELETES _______________________________________________________________________________


-- ***************************************************************************************
-- Orders 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- Insert A New Order
INSERT INTO Orders (customer_id, when_created, when_processed, is_closed, when_closed)
VALUES	(
		:input_customer_id,
		:input_when_created,
		NULL,
		0,
		NULL
);

-- ____ SELECTS _______________________________________________________________________________

-- Select Order by Orders.order_id

SELECT * FROM Orders
WHERE 	order_id = :input_order_id;

-- Select All Orders by Customer ID with no order
SELECT * FROM Orders
WHERE 		customer_id = :input_customer_id;

-- Select All Orders by Customer ID ordered by most recent
SELECT * FROM Orders
WHERE 		customer_id = :input_customer_id
ORDER BY	Orders.when_created ASC;

-- Select Orders Based On Status
SELECT * FROM Orders
WHERE 	order_status = :selected_status

-- Selects the total price of the order (this will involve joins/subqueries)


-- ____ UPDATES _______________________________________________________________________________

-- Updates the order to be closed (is_closed is True)
UPDATE 	Orders 
SET 	is_closed = 1,
		status = :input_status
		when_closed = :input_datetime_closed

WHERE  	order_id = :input_order_id;

-- Updates the order to be reopened (is_closed if False)
-- Updates the order to be closed (is_closed is True)
UPDATE 	Orders 
SET 	is_closed = 0,
		status = :input_status
		when_closed = :input_datetime_closed

WHERE  	order_id = :input_order_id;

-- Updates the order's status
UPDATE  Orders
SET 	status = :input_status
WHERE   order_id = :input_order_id;

-- ____ DELETES _______________________________________________________________________________

-- No deleting Orders!

-- ***************************************************************************************
-- Products 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- Insert a new product

INSERT INTO Products
VALUES 	(
		name = :input_name,
		color = :input_color,
		weight_lbs = :input_lbs,
		volume_cubic_inches = :input_cubic_inches,
		in_stock_qty = :input_stock_qty,
		reorder_at_qty = :input_reorder_at_qty,
		is_discontinued = 0
);

-- ____ SELECTS _______________________________________________________________________________

-- Select all products
SELECT * FROM Products;

-- Select product by product_id
SELECT * FROM Products
WHERE 	product_id = :input_product_id;

-- Select all products with matching name
SELECT * FROM Products
WHERE 	product_name = :input_product_name;

-- ____ UPDATES _______________________________________________________________________________

-- Update Reorder At Qty
UPDATE 	Products
SET 	reorder_at_qty = :input_reorder_qty
WHERE 	product_id = :input_product_id;

-- Update In Stock Qty (manually)
UPDATE 	Products
SET 	in_stock_qty = :input_stock_qty
WHERE 	product_id = :input_product_id;

-- Decrease In Stock Qty by Input Value (if in stock is greater than zero)
UPDATE 	Products
SET 	in_stock_qty = in_stock_qty - :input_sub_value
WHERE 	product_id = :input_product_id AND
		in_stock_qty > 0;

-- Increase In Stock Qty by Input Value
UPDATE 	Products
SET 	in_stock_qty = in_stock_qty + :input_sub_value
WHERE 	product_id = :input_product_id;

-- Update Product Discontinued Status
UPDATE 	Products
SET  	is_discontinued = :input_is_discontinued
WHERE  	product_id = :input_product_id;

-- ____ DELETES _______________________________________________________________________________

-- No deleting products!


-- ***************************************************************************************
-- ProductPrices 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- Insert a new active price for a product

INSERT INTO ProductPrices VALUES (

	product_id 		= :input_product_id,
	price 			= :input_price,
	date_active 	= :input_date_active,
	date_inactive 	= NULL
);	

-- ____ SELECTS _______________________________________________________________________________

SELECT * FROM ProductPrices;



-- ____ UPDATES _______________________________________________________________________________

UPDATE  ProductPrices
SET  	date_inactive = :input_date_inactive,
WHERE   EXISTS (SELECT * FROM ProductPrices 
					WHERE product_id = :input_product_id 
					AND )

)


-- ____ DELETES _______________________________________________________________________________

-- No deleting product prices!


-- ***************************************************************************************
-- OrderItems
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

INSERT INTO OrderItems VALUES (
	order_id 	= :input_order_id,
	product_id 	= :input_product_id
);

-- ____ SELECTS _______________________________________________________________________________

-- Select all order items associated with an OrderID
SELECT * FROM OrderItems
WHERE order_id = :input_order_id;

-- ____ UPDATES _______________________________________________________________________________

-- No updates

-- ____ DELETES _______________________________________________________________________________

-- No deletes

-- ***************************************************************************************
-- Shipments 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________


-- Insert an new/empty shipment.
INSERT INTO Shipments VALUES (
	address_id 			= :input_address_id,
	order_id 			= :input_order_id, 
	datetime_created 	= :input_datetime_created,
	tracking_number		= :input_tracking_number,
	total_lbs           = 0.0,
	total_cubic_in  	= 0.0,
	shipping_cost       = 0.0,
	datetime_ready   	= NULL,
	datetime_shipped  	= NULL,
	datetime_arrived  	= NULL
);

-- ____ SELECTS _______________________________________________________________________________

-- Select all shipments
SELECT * FROM Shipments;

-- Select shipments by shipment_id
SELECT * FROM Shipments
WHERE shipment_id = :input_shipment_id;

-- Select shipments by address_id
SELECT * FROM Shipments
WHERE address_id = :input_address_id;

-- Select shipments by order_id
SELECT * FROM Shipments
WHERE order_id = :input_order_id;

-- ____ UPDATES _______________________________________________________________________________

-- Manually set shipment total pounds
UPDATE 	Shipments
SET  	total_lbs 	= :input_total_lbs
WHERE  	shipment_id = :input_shipment_id;

-- Increase shipment total pounds by input value
UPDATE 	Shipments
SET   	total_lbs 	= total_lbs + :input_increase_by
WHERE  	shipment_id = :input_shipment_id;

-- Manually set shipment total pounds
UPDATE 	Shipments
SET  	total_cubic_in 	= :input_total_cubic_inches
WHERE  	shipment_id 	= :input_shipment_id;

-- Increase shipment total pounds by input value
UPDATE 	Shipments
SET   	total_cubic_in 	= total_lbs + :cubic_in_increase_by
WHERE  	shipment_id 	= :input_shipment_id;

-- DELETE



-- ____ DELETES _______________________________________________________________________________



-- ***************************************************************************************
-- ShipmentItems
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

-- ____ SELECTS  _______________________________________________________________________________

-- ____ UPDATES  _______________________________________________________________________________

-- ____ DELETES  _______________________________________________________________________________



-- ***************************************************************************************
-- Transactions 
-- ***************************************************************************************

-- ____ INSERTS _______________________________________________________________________________

INSERT INTO Transactions VALUES
	(
		order_id 			= :input_order_id,
		pay_method_id 		= :input_pay_method_id,
		transaction_amount 	= :input_transaction_amount,
		datetime_charged 	= :input_datetime_charged,
		confirmation_code 	= :input_confirm_code,
		checksum 			= :input_checksum,
		datetime_success 	= :input_datetime_success
);

-- ____ SELECTS _______________________________________________________________________________

SELECT * FROM Transactions;

SELECT * FROM Transactions
WHERE transaction_id = :input_transaction_id;

SELECT * FROM Transactions
WHERE order_id = :input_order_id;

SELECT * FROM Transactions
WHERE pay_method_id = :input_pay_method_id;

-- ____ UPDATES _______________________________________________________________________________

-- No updates allowed!

-- ____ DELETES _______________________________________________________________________________

-- No deletes allowed!

