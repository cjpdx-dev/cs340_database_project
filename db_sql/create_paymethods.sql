CREATE TABLE PayMethods(	
    pay_method_id int NOT NULL AUTO_INCREMENT,
    address_id int NOT NULL AUTO_INCREMENT,
    card_type varchar(45) NOT NULL,
    last_four_digits int NOT NULL,
    expiration_date DATE NOT NULL,
    PRIMARY KEY (pay_method_id),
    FOREIGN KEY (address_id)
)