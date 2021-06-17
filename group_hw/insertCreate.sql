INSERT INTO salesperson(
	salesperson_id,
	first_name,
	last_name,
	cars_sold
) VALUES (
	1,
	'Blair',
	'Talley',
	23
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
) VALUES (
	0318,
	'Eleanor',
	'Yoon'
);

INSERT INTO service(
	service_id,
	part_id,
	repair_cost,
	mechanic_id
) VALUES (
	5000,
	200,
	500,
	0318	
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billng_info,
	service_id
) VALUES (
	1000,
	'Alex',
	'Tymczyszyn',
	'123 Real St. Millbrae, CA 94030',
	'1111 2222 3333 4444 123 09 21',
	5000
);

INSERT INTO invoice(
	invoice_id,
	customer_id
) VALUES (
	9000,
	1000
);

INSERT INTO car(
	vin_number,
	make,
	model,
	year_,
	color,
	price,
	salesperson_id,
	invoice_id
) VALUES (
	'987654321',
	'Tesla',
	'Model-X',
	2021,
	'Yellow',
	10900.00,
	1,
	9000
);

CREATE OR REPLACE FUNCTION insMechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(_mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insMechanic(402, 'Monica', 'Pak');

CREATE OR REPLACE FUNCTION insSalesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _cars_sold INTEGER)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO salesperson(salesperson_id, first_name, last_name, cars_sold)
	VALUES(_salesperson_id, _first_name, _last_name, _cars_sold);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insSalesperson(2, 'Allyse', 'Arucan', 58);

SELECT *
FROM salesperson
