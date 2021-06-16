INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	dob,
	address,
	billing_info
) VALUES(
	1,
	'Eleanor',
	'Yoon',
	'03-21-2021',
	'123 Fake St. Downey, CA 90242',
	'1111 2222 3333 4444 5555 123 03/21'
);

INSERT INTO theater(
	theater_id,
	address,
	screens,
	phone_number
) VALUES (
	1,
	'321 Real St. Millbrae, CA 94030',
	'20',
	'562-123-4567'
);

INSERT INTO concessions(
	order_id,
	item,
	customer_id
) VALUES (
	5,
	'popcorn',
	1
);

INSERT INTO movie(
	title,
	director,
	cast_,
	rating
) VALUES (
	'The Dark Knight',
	'Christopher Nolan',
	'Christian Bale, Heath Ledger, Aaron Eckhart, Michael Caine, Maggie Gyllenhaal, Gary Oldman',
	'R'
);

INSERT INTO tickets(
	ticket_id,
	order_date,
	seat_num,
	movie_date,
	movie_showtime,
	ticket_cost,
	title,
	customer_id
) VALUES (
	100,
	'2021-06-15',
	'52',
	'2021-12-25',
	'1700',
	'18.99',
	'The Dark Knight',
	1
);
