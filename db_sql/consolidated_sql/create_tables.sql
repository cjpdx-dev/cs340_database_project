
DROP TABLE IF EXISTS OrderItems;

DROP TABLE IF EXISTS ShipmentItems;

DROP TABLE IF EXISTS CustomerPayMethods;

DROP TABLE IF EXISTS CustomerAddresses;

DROP TABLE IF EXISTS ProductPrices;

DROP TABLE IF EXISTS Shipments;

DROP TABLE IF EXISTS Transactions;

DROP TABLE IF EXISTS PayMethods;

DROP TABLE IF EXISTS Addresses;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers 
(	
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    date_of_birth DATE NOT NULL,
    email_address VARCHAR(65)

) ENGINE = InnoDB;


CREATE TABLE Orders 
(
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    customer_id INT NOT NULL,
    when_created DATETIME NOT NULL,
    when_processed DATETIME,
    is_closed TINYINT NOT NULL,
    when_closed DATETIME,
    
    CONSTRAINT `Orders_fk_customer_id`
        FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;

CREATE TABLE Products 
(	
    product_id INT NOT NULL AUTO_INCREMENT,

    product_name VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    weight_lbs DECIMAL(6,3) NOT NULL,
    volume_cubic_inches DECIMAL(6,3) NOT NULL,
    in_stock_qty INT NOT NULL,
    reorder_at_qty INT NOT NULL,
    
    is_discontinued TINYINT NOT NULL,

    PRIMARY KEY (product_id)

) ENGINE = InnoDB;

-- --------------------------------------------------------------------------------------
-- CREATE ProductPrices
-- --------------------------------------------------------------------------------------
CREATE TABLE ProductPrices 
(
    price_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    product_id INT NOT NULL,
    price DECIMAL NOT NULL,
    date_active DATETIME NOT NULL,
    date_inactive DATETIME,
    
    CONSTRAINT `ProductPrice_fk_product_id`
        FOREIGN KEY (product_id) REFERENCES Products (product_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;


-- Needs CREATE PRODUCTS to work
CREATE TABLE OrderItems
(
    order_line_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    product_qty INT NOT NULL,

    CONSTRAINT `OrderItem_fk_order_id`
        FOREIGN KEY (order_id) REFERENCES Orders (order_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,

    CONSTRAINT `OrderItem_fk_product_id`
        FOREIGN KEY (product_id) REFERENCES Products (product_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;

-- --------------------------------------------------------------------------------------
-- CREATE Addresses
-- --------------------------------------------------------------------------------------
CREATE TABLE Addresses
(	
    address_id int NOT NULL AUTO_INCREMENT,

    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    address1 varchar(45) NOT NULL,
    address2 varchar(45) NOT NULL,
    city varchar(45) NOT NULL,
    `state` varchar(45) NOT NULL,
    zipcode varchar(45) NOT NULL,
    country varchar(45) NOT NULL,

    PRIMARY KEY (address_id)
) ENGINE = InnoDB;

-- Needs CREATE ADDRESSES to work
CREATE TABLE Shipments 
(
    shipment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    order_id INT NOT NULL,
    address_id INT NOT NULL,
    datetime_created DATETIME NOT NULL,
    tracking_number VARCHAR(45) NOT NULL,
    total_lbs DECIMAL NOT NULL,
    total_cubic_in DECIMAL NOT NULL,
    shipping_cost DECIMAL NOT NULL,
    datetime_ready DATETIME,
    datetime_shipped DATETIME,
    datetime_arrived DATETIME,

    CONSTRAINT `Shipment_fk_order_id`
        FOREIGN KEY (order_id) REFERENCES Orders (order_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,

    CONSTRAINT `Shipment_fk_address_id`
        FOREIGN KEY (address_id) REFERENCES Addresses (address_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;

-- --------------------------------------------------------------------------------------
-- CREATE ShipmentItems
-- --------------------------------------------------------------------------------------
CREATE TABLE ShipmentItems 
(
    shipment_line_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    shipment_id INT NOT NULL,
    product_id INT NOT NULL,
    item_qty INT NOT NULL,

    CONSTRAINT `ShipmentItem_fk_shipment_id`
        FOREIGN KEY (shipment_id) REFERENCES Shipments (shipment_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,

    CONSTRAINT `ShipmentItem_fk_product_id`
        FOREIGN KEY (product_id) REFERENCES Products (product_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;

-- --------------------------------------------------------------------------------------
-- CREATE PayMethods
-- --------------------------------------------------------------------------------------
CREATE TABLE PayMethods 
(
    pay_method_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    address_id INT NOT NULL,
    card_type VARCHAR(45) NOT NULL,
    last_four_digits INT NOT NULL,
    expiration_date DATE NOT NULL,

    CONSTRAINT `PayMethod_fk_address_id`
        FOREIGN KEY (address_id) REFERENCES Addresses (address_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;

-- --------------------------------------------------------------------------------------
-- CREATE Transactions
-- --------------------------------------------------------------------------------------
CREATE TABLE Transactions 
(
    transaction_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    pay_method_id INT NOT NULL,
    transaction_amount DECIMAL NOT NULL,
    datetime_charged DATETIME NOT NULL,
    confirmation_code VARCHAR(45) NOT NULL,
    check_sum VARCHAR(45) NOT NULL,
    datetime_success DATETIME NOT NULL,

    CONSTRAINT `Transaction_fk_order_id`
        FOREIGN KEY (order_id) REFERENCES Orders (order_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,

    CONSTRAINT `Transaction_fk_pay_method_id`
        FOREIGN KEY (pay_method_id) REFERENCES PayMethods (pay_method_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT

) ENGINE = InnoDB;
