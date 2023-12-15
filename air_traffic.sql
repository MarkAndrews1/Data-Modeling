-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO countries (name)
VALUES ('United States'), ('United Kingdom'), ('Japan'), ('France'), ('UAE'), ('China'), ('Mexico'), ('Morocco'), ('Brazil'), ('Chile');

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name text NOT NULL,
  country_id INTEGER REFERENCES countries(id)
);

INSERT INTO cities (name, country_id)
VALUES ('Washington DC', 1), ('Tokyo', 3), ('Los Angeles', 1), ('Seattle', 1), ('Paris', 4),
       ('Dubai', 5), ('New York', 1), ('Cedar Rapids', 1), ('Charlotte', 1), ('Sao Paolo', 9),
       ('London', 2), ('Las Vegas', 1), ('Mexico City', 7), ('Casablanca', 8), ('Beijing', 6),
       ('Chicago', 1), ('New Orleans', 1), ('Santiago', 10);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO airlines (name)
VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'),
       ('Air China'), ('American Airlines'), ('Avianca Brasil');

-- Update the tickets table and insert data
CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  from_country INTEGER REFERENCES countries(id),
  to_city INTEGER REFERENCES cities(id),
  to_country INTEGER REFERENCES countries(id)
);

INSERT INTO tickets (
    first_name, last_name, seat, departure, arrival, airline_id,
    from_country, to_city, to_country
) VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 11, 3),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 12, 1),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 7, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 15, 4),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 14, 5),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 2, 1),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 1),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 7, 1, 1),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 9, 18, 9);
