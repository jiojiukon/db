CREATE TABLE IF NOT EXISTS musician(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS genre(
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS musician_genre(
	musician_id INTEGER REFERENCES Musician(id),
	genre_id INTEGER REFERENCES Genre(id),
	CONSTRAINT mg PRIMARY KEY (musician_id, genre_id)
);


CREATE TABLE IF NOT EXISTS album(
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(50) NOT NULL UNIQUE,
	duration INTEGER NOT NULL CHECK (duration > 0),
	release_date DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS musician_album(
	musician_id INTEGER REFERENCES Musician(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT ma PRIMARY KEY (musician_id, album_id)
);


CREATE TABLE IF NOT EXISTS track(
	id SERIAL PRIMARY KEY,
	track_name VARCHAR(50) NOT NULL,
	duration INTEGER NOT NULL CHECK (duration > 0),
	album_id INTEGER REFERENCES Album(id)
);


CREATE TABLE IF NOT EXISTS compilation(
	id SERIAL PRIMARY KEY,
	compilation_name VARCHAR(50) NOT NULL,
	duration INTEGER NOT NULL,
	release_year INTEGER
);


CREATE TABLE IF NOT EXISTS track_compilation(
	track_id INTEGER REFERENCES Track(id),
	compilation_id INTEGER REFERENCES Compilation(id),
	CONSTRAINT tc PRIMARY KEY (track_id, compilation_id)
);
