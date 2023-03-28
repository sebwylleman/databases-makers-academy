TRUNCATE TABLE artists RESTART IDENTITY; 
TRUNCATE TABLE albums RESTART IDENTITY; 

INSERT INTO artists (name, genre) VALUES ('The Beatles', 'rock');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Abbey Road', 1969, 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Revolver', 1966, 1);
