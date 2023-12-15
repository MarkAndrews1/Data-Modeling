-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    galaxy_id INTEGER REFERENCES galaxies(id)
);

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    star_id INTEGER REFERENCES stars(id),
    galaxy_id INTEGER REFERENCES galaxies(id)
);

INSERT INTO galaxies (name) VALUES ('Milky Way');

INSERT INTO stars (name, galaxy_id) 
VALUES 
('The Sun', 1), 
('Proxima Centauri', 1), 
('Gliese 876', 1);

INSERT INTO moons (name) VALUES 
  ('The Moon'), ('Phobos'), ('Deimos'), ('Naiad'), ('Thalassa'), ('Despina'),
  ('Galatea'), ('Larissa'), ('S/2004 N 1'), ('Proteus'), ('Triton'), ('Nereid'),
  ('Halimede'), ('Sao'), ('Laomedeia'), ('Psamathe'), ('Neso');

INSERT INTO planets (name, orbital_period_in_years, star_id, galaxy_id) 
VALUES 
  ('Earth', 1.00, 1, 1), 
  ('Mars', 1.88, 1, 1), 
  ('Venus', 0.62, 1, 1), 
  ('Neptune', 164.8, 1, 1), 
  ('Proxima Centauri b', 0.03, 2, 1), 
  ('Gliese 876 b', 0.23, 3, 1);
