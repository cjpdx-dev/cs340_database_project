-- INSERT INTO PAY METHODS
INSERT INTO PayMethods(address_id, card_type, last_four_digits, expiration_date)

SELECT address_id,
	"AMEX" AS card_type,
	"1234" AS last_four_digits,
	"2024-12-13" AS expiration_date

FROM Addresses
WHERE address_id = 1;

SELECT address_id,
	"VISA" AS card_type,
	"4321" AS last_four_digits,
	"2026-01-10" AS expiration_date

FROM Addresses
WHERE address_id = 2;