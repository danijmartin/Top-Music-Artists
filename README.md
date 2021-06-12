# Top-Music-Artists

This repository contains our ETL process for creating a top music artists data base.  

### Extract:  
* Kaggle csv file: [Music artists popularity](https://www.kaggle.com/pieca111/music-artists-popularity)  
* Web scrape using Splinter: [Spotify](https://open.spotify.com/search)  
* Spotify API using Spotipy Python library: [Spotipy Documentation](https://spotipy.readthedocs.io/en/2.18.0/)  

## Transform:  
* CSV file: This file originally contained 1.4 million artists and 10 columns of information.  
	1. Unneeded columns were dropped.
	2. Rows were restricted to the Top 50 artists. (One note regarding this data-set: Data was compiled in 2019. It is possible the top 50 artists has changed.)  
	3. Artist name was stored as a separate array to assist with scraping.  
* Web Scrape: This scrape resulted in a spotify url containing spotify's artist id for each artist. ex. https://open.spotify.com/artist/4gzpq5DPGxSnKTe4SA8HAU  
	1. Turned list into Pandas Dataframe.  
	2. Split url string by "/".  
	3. Added spotify_id to cleaned CSV file.  
	4. Spotify id was stored as a separate array to assist with API call.  
* API Call: Utilized the "artist_top_tracks" call  
	1. This data set was cleaned in the extraction process as we only grabbed the variables needed.  
	2. The resulting list of dictionaries was converted into a Pandas Dataframe.
	3. Dataframe was saved as a CSV for later ease of access.  

## Load: Data was then loaded into a PostgreSQL database.
* PG admin was used to load data directly.
	1. Created Database using GUI.  
	2. Created two tables using Query Editor.  
	3. Uploaded two finished CSV files from Tranform processes.  
	4. Joined two tables to create one master table of top artists with their top songs.
	5. Exported master table as CSV for later ease of analysis.  