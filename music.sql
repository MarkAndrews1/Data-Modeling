-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  producers TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  artists TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER REFERENCES albums(id)
);

INSERT INTO albums
  (title, release_date, producers)
VALUES
  ('Middle of Nowhere', '1997-04-15', 'Dust Brothers, Stephen Lironi'),
  ('A Night at the Opera', '1975-10-31', 'Roy Thomas Baker'),
  ('Daydream', '1995-11-14', 'Walter Afanasieff'),
  ('A Star Is Born', '2018-09-27', 'Benjamin Rice'),
  ('Silver Side Up', '2001-08-21', 'Rick Parashar'),
  ('The Blueprint 3', '2009-10-20', 'Al Shux'),
  ('Prism', '2013-12-17', 'Max Martin, Cirkut'),
  ('Hands All Over', '2011-06-21', 'Shellback, Benny Blanco'),
  ('Let Go', '2002-05-14', 'The Matrix'),
  ('The Writing''s on the Wall', '1999-11-07', 'Darkchild');

INSERT INTO songs
  (title, artists, duration_in_seconds, album_id)
VALUES
  ('MMMBop', 'Hanson', 238, 1),
  ('Bohemian Rhapsody', 'Queen', 355, 2),
  ('One Sweet Day', 'Mariah Cary Boyz II Men', 282, 3),
  ('Shallow', 'Lady Gaga Bradley Cooper', 216, 4),
  ('How You Remind Me', 'Nickelback', 223, 5),
  ('New York State of Mind', 'Jay Z, Alicia Keys', 276, 6),
  ('Dark Horse', 'Katy Perry, Juicy J', 215, 7),
  ('Moves Like Jagger', 'Maroon 5, Christina Aguilera', 201, 8),
  ('Complicated', 'Avril Lavigne', 244, 9),
  ('Say My Name', 'Destiny''s Child', 240, 10);
