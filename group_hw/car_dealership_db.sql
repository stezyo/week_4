CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR (100),
	last_name VARCHAR (100),
	cars_sold INTEGER
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR (100),
	last_name VARCHAR (100)
);
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	part_id VARCHAR(150),
	repair_cost NUMERIC(7,2),
	mechanic_id INTEGER,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR (100),
	last_name VARCHAR (100),
	address VARCHAR (100),
	billng_info VARCHAR (100),
	service_id INTEGER,
	FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	date_  DATE DEFAULT CURRENT_DATE,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE car(
	vin_number VARCHAR(17) PRIMARY KEY,
	make VARCHAR(20),
	model VARCHAR(20),
	year_ INTEGER,
	color VARCHAR(20),
	price NUMERIC(7,2),
	salesperson_id INTEGER,
	invoice_id INTEGER,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
	
);
