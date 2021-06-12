-- Create a new table

CREATE TABLE pop_song(
	artist VARCHAR(75) NOT NULL,
	name VARCHAR(75) NOT NULL,
	popularity int

);

CREATE TABLE updated_artists(
	artist_mb VARCHAR(75) NOT NULL PRIMARY KEY,
	country_mb VARCHAR(75) NOT NULL,
	listeners_lastfm DECIMAL,
	spotify_id VARCHAR(50)

);


SELECT * FROM pop_song;
SELECT * FROM updated_artists;

ALTER TABLE pop_song ADD PRIMARY KEY(
	artist
)

CREATE TABLE artist_complete AS
SELECT * FROM pop_song JOIN updated_artists
ON (pop_song.artist = updated_artists.artist_mb);
ALTER TABLE artist_complete 
ADD PRIMARY KEY (artist),
DROP COLUMN artist_mb;

SELECT * FROM artist_complete;