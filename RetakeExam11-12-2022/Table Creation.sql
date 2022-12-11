CREATE table countries
(
    id            int primary key auto_increment,
    `name`        varchar(30) not null unique,
    `description` text,
    currency      varchar(5)  not null
);

create table airplanes
(
    id                 int primary key auto_increment,
    model              varchar(50)    not null unique,
    passengers_capacity int            not null,
    tank_capacity      DECIMAL(19, 2) not null,
    cost               DECIMAL(19, 2) not null
);

create table passengers
(
    id         int primary key auto_increment,
    first_name varchar(30) not null,
    last_name  varchar(30) not null,
    country_id int         not null,
    constraint fk_country_id
        FOREIGN KEY (country_id) REFERENCES countries (id)
);


create table flights
(
    id                  int primary key auto_increment,
    flight_code         varchar(30) not null unique,
    departure_country   int         not null,
    destination_country int         not null,
    airplane_id         int         not null,
    has_delay           tinyint(1),
    departure           datetime,
    CONSTRAINT fk_departure_id
        FOREIGN KEY (departure_country) REFERENCES countries (id),
    CONSTRAINT fk_destination_id
        FOREIGN KEY (destination_country) REFERENCES countries (id),
    CONSTRAINT fk_airplane_id
        FOREIGN KEY (airplane_id) REFERENCES airplanes (id)
);

create table flights_passengers
(
    flight_id int,
    passenger_id int,
    KEY pk_flight_passenger (flight_id, passenger_id),
    CONSTRAINT fk_flight_id
        FOREIGN KEY (flight_id) REFERENCES flights (id),
    CONSTRAINT fk_passenger_id
        FOREIGN KEY (passenger_id) REFERENCES passengers (id)
);