CREATE TABLE PayMethods(	
    pay_method_id int NOT NULL AUTO_INCREMENT,
    address_id int NOT NULL AUTO_INCREMENT,
    card_type varchar(45) NOT NULL,
    last_four_digits int NOT NULL,
    expiration_date DATE NOT NULL,
    PRIMARY KEY (pay_method_id),
    FOREIGN KEY (address_id)
)

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