CREATE TABLE Customers(	
    customer_id int NOT NULL AUTO_INCREMENT,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    date_of_birth DATE NOT NULL,
    email_address varchar(65),
    PRIMARY KEY (customer_id)
)
