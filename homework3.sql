create table if not exists genres (
id serial primary key,
name varchar unique not null);

create table if not exists artists (
id integer primary key,
name varchar(30) unique not null);

create table if not exists artists_genre(
id serial primary key,
artistId integer not null references artists(Id),
genreId integer not null references genres(id));

create table if not exists alboms (
id serial primary key,
name varchar(50) not null,
year_albom integer not null);

create table if not exists ArtistAlbom(
id serial primary key,
artist_id integer references artists(id),
albom_id integer references alboms(id));

create table if not exists collections (
id serial primary key,
name varchar(30) unique not null,
year_collection integer not null,


create table if not exists tracks (
id integer primary key,
name varchar(40) not null,
duration numeric not null),
collection_id integer not null references collections(id),
albom_id integer not null references alboms(id);