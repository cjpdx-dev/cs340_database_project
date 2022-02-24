CREATE TABLE Products(	
    product_id int NOT NULL AUTO_INCREMENT,
    product_name varchar(45) NOT NULL,
    product_color varchar(45) NOT NULL,
    product_weight_lbs decimal(6,3) NOT NULL,
    product_stock_qty int NOT NULL,
    reorder_product_qty int NOT NULL,
    is_discontinued tinyint NOT NULL,
    PRIMARY KEY (order_id)
)