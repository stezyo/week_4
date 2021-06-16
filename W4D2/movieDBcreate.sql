CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	dob VARCHAR(15),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	address VARCHAR(150),
	screens VARCHAR(10),
	phone_number VARCHAR(100)
);

CREATE TABLE concessions(
	order_id SERIAL PRIMARY KEY,
	item VARCHAR(100) NOT NULL,
	customer_id SERIAL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE movie(
	title VARCHAR(100) PRIMARY KEY,
	director VARCHAR(100),
	cast_ VARCHAR(200),
	rating VARCHAR(10),
	theater_id SERIAL NOT NULL,
	FOREIGN KEY(theater_id) REFERENCES theater(theater_id)
);

CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	seat_num VARCHAR(100),
	movie_date DATE,
	movie_showtime VARCHAR(100),
	ticket_cost NUMERIC(8,2),
	title VARCHAR(100),
	customer_id SERIAL NOT NULL,
	FOREIGN KEY(title) REFERENCES movie(title),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
