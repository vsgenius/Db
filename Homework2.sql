create table if not exists genres (
id serial primary key,
name varchar unique not null);
create table if not exists artists (
id serial primary key,
name varchar(50) unique not null,
genre_id integer not null references genres(id));
create table if not exists alboms (
id serial primary key,
name varchar(50) not null,
year_albom date not null,
artist_id integer not null references artists(id));
create table if not exists tracks (
id serial primary key,
name varchar(30) not null,
duration time not null,
albom_id integer not null references alboms(id));
