create table if not exists tracks (
id serial primary key,
name varchar(30) not null,
duration time not null);

create table if not exists artists (
id serial primary key,
name varchar(50) unique not null,
genre_id integer not null,
alboms_id integer not null);

create table if not exists genres (
id serial primary key,
name varchar unique not null,
artist_id integer references artists(id));

create table if not exists alboms (
id serial primary key references tracks(id),
name varchar(50) not null,
year_albom date not null,
artist_id integer not null references artists(id));

create table if not exists collections (
id serial primary key,
name varchar(30) unique not null,
year varchar(4) not null,
track_id integer not null references tracks(id),
albom_id integer not null references alboms(id));

alter table artists add foreign key(genre_id) references genres(id);

