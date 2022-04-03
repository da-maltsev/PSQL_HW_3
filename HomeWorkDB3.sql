create table if not exists Genres(
ID serial primary key,
Title varchar(40) not null
);
create table if not exists Artists(
ID serial primary key,
Name varchar(40) not null
);
create table if not exists Albums(
ID serial primary key,
Title varchar(40) not null,
Date date
);
create table if not exists Tracks(
ID serial primary key,
Title varchar(40) not null,
Time integer not null,
ID_album int references Albums(ID)
);
create table if not exists MixTapes(
ID serial primary key,
Title varchar(40) not null,
Date date
);
create table if not exists ArtistsGenres(
artist_id integer references Artists(ID),
genre_id integer references Genres(ID),
constraint ArtistGenresPK primary key (artist_id, genre_id)
);
create table if not exists ArtistsAlbums(
artist_id integer references Artists(ID),
album_id integer references Albums(ID),
constraint ArtistAlbumsPK primary key (artist_id, album_id)
);
create table if not exists TracksMixTapes(
track_id integer references Tracks(ID),
mixtape_id integer references MixTapes(ID),
constraint TracksMixTapesPK primary key (track_id, mixtape_id)
);