#2
INSERT INTO airplanes(model, passengers_capacity, tank_capacity, cost)
SELECT concat(reverse(first_name), '797'),
       length(last_name) * 17,
       id * 790,
       length(first_name) * 50.6
FROM passengers
WHERE id <= 5;

#3

UPDATE flights
SET flights.airplane_id=flights.airplane_id + 1
WHERE departure_country = 22;


#4

DELETE flights
FROM flights
         LEFT JOIN flights_passengers fp on flights.id = fp.flight_id
WHERE fp.flight_id is NULL;


#5

SELECT id, model, passengers_capacity, tank_capacity, cost
from airplanes
WHERE cost <= 140
ORDER BY cost desc, id desc;

#6

SELECT flight_code, departure_country, airplane_id, departure
from flights
WHERE YEAR(departure) = 2022
ORDER BY airplane_id, flight_code
LIMIT 20;


#7

SELECT CONCAT(UCASE(LEFT(last_name, 2)), country_id) as flight_code,
       concat(first_name, ' ', last_name)            as full_name,
       country_id
from passengers
         LEFT JOIN flights_passengers fp on passengers.id = fp.passenger_id
WHERE fp.passenger_id is NULL
ORDER BY country_id;


#8

SELECT name, currency, COUNT(f.destination_country) as booked_tickets
from countries
         JOIN flights f on countries.id = f.destination_country
         JOIN flights_passengers fp on f.id = fp.flight_id
GROUP BY name
HAVING booked_tickets >= 20
ORDER BY booked_tickets desc;


#9

SELECT flight_code,
       departure,
       CASE
           WHEN (HOUR(departure) >= 5 AND HOUR(departure) < 12) THEN 'Morning'
           WHEN (HOUR(departure) >= 12 AND HOUR(departure) < 17) THEN 'Afternoon'
           WHEN (HOUR(departure) >= 17 AND HOUR(departure) < 21) THEN 'Evening'
           WHEN (HOUR(departure) >= 21 AND HOUR(departure) <= 24) THEN 'Night'
           WHEN (HOUR(departure) >= 0 AND HOUR(departure) < 5) THEN 'Night'
           END as day_part
FROM flights
ORDER BY flight_code desc;

#10

CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE flights_count INT;
    SET flights_count := (SELECT COUNT(c.id)
                          FROM countries as c
                                   JOIN flights f on c.id = f.departure_country

                          WHERE c.name = country
                          GROUP BY c.id);
    RETURN flights_count;
end

#11

CREATE PROCEDURE udp_delay_flight(code varchar(50))
BEGIN
    UPDATE flights
    SET has_delay=1
    WHERE flight_code = code;
    UPDATE flights
    SET departure= ADDTIME(departure, 3000)
    WHERE flight_code = code;
end



