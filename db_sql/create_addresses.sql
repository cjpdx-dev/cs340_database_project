CREATE TABLE Addresses(	
    address_id int NOT NULL AUTO_INCREMENT,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    address1 varchar(45) NOT NULL,
    address2 varchar(45) NOT NULL,
    address_city varchar(45) NOT NULL,
    address_state varchar(45) NOT NULL,
    address_zipcode varchar(45) NOT NULL,
    address_country varchar(45) NOT NULL,
    PRIMARY KEY (address_id)
)