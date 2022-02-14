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

create table if not exists tracks (
id integer primary key,
name varchar(40) not null,
duration numeric not null);

create table if not exists collections (
id serial primary key,
name varchar(30) unique not null,
year_collection varchar(4) not null,
track_id integer not null references tracks(id),
albom_id integer not null references alboms(id));

insert into artists(id,name) values (1,'Sting');
insert into artists(id,name) values (2,'Madonna');
insert into artists(id,name) values (3,'Michael Jackson');
insert into artists(id,name) values (4,'Zivert');
insert into artists(id,name) values (5,'Rihanna');
insert into artists(id,name) values (6,'Земфира');
insert into artists(id,name) values (7,'Дима Билан');
insert into artists(id,name) values (8,'Федор Шаляпин');

insert into genres(id,name) values (1,'рок');
insert into genres(id,name) values (2,'поп');
insert into genres(id,name) values (3,'джаз');
insert into genres(id,name) values (4,'шансон');
insert into genres(id,name) values (5,'блюз');

insert into artists_genre(artistid,genreid) values (1,1);
insert into artists_genre(artistid,genreid) values (2,2);
insert into artists_genre(artistid,genreid) values (1,5);
insert into artists_genre(artistid,genreid) values (3,2);
insert into artists_genre(artistid,genreid) values (4,2);
insert into artists_genre(artistid,genreid) values (5,2);
insert into artists_genre(artistid,genreid) values (5,3);
insert into artists_genre(artistid,genreid) values (6,3);
insert into artists_genre(artistid,genreid) values (6,1);
insert into artists_genre(artistid,genreid) values (7,2);
insert into artists_genre(artistid,genreid) values (8,4);

insert into alboms(name,year_albom) values ('Albom1',1991);
insert into alboms(name,year_albom) values ('Albom2',1991);
insert into alboms(name,year_albom) values ('Albom3',1995);
insert into alboms(name,year_albom) values ('Albom4',1999);
insert into alboms(name,year_albom) values ('Albom5',1999);
insert into alboms(name,year_albom) values ('Albom6',2010);
insert into alboms(name,year_albom) values ('Albom7',2015);
insert into alboms(name,year_albom) values ('Albom8',2018);

insert into ArtistAlbom(artist_id ,albom_id) values (1,1);
insert into ArtistAlbom(artist_id ,albom_id) values (1,2);
insert into ArtistAlbom(artist_id ,albom_id) values (3,3);
insert into ArtistAlbom(artist_id ,albom_id) values (3,4);
insert into ArtistAlbom(artist_id ,albom_id) values (4,3);
insert into ArtistAlbom(artist_id ,albom_id) values (5,5);
insert into ArtistAlbom(artist_id ,albom_id) values (6,6);
insert into ArtistAlbom(artist_id ,albom_id) values (7,8);
insert into ArtistAlbom(artist_id ,albom_id) values (8,7);
insert into ArtistAlbom(artist_id ,albom_id) values (8,6);


insert into tracks(id,name,duration) values (1,'MyTrack1',3.40);
insert into tracks(id,name,duration) values (2,'Track2',1.40);
insert into tracks(id,name,duration) values (3,'MyTrack2_1',2.40);
insert into tracks(id,name,duration) values (4,'Track2',4.45);
insert into tracks(id,name,duration) values (5,'MyTrack1',2.35);
insert into tracks(id,name,duration) values (6,'Track6',2.20);
insert into tracks(id,name,duration) values (7,'Track11',5.40);
insert into tracks(id,name,duration) values (8,'MyTrack12',6.40);
insert into tracks(id,name,duration) values (9,'Track1',3.40);
insert into tracks(id,name,duration) values (10,'Track5',3.10);
insert into tracks(id,name,duration) values (11,'Track7',2.50);
insert into tracks(id,name,duration) values (12,'MyTrack9',3.40);
insert into tracks(id,name,duration) values (13,'Track15',2.40);
insert into tracks(id,name,duration) values (14,'Track14',1.40);
insert into tracks(id,name,duration) values (15,'Track10',5.40);

insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection1',2001,5,8);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection2',1993,9,1);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection3',1993,2,2);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection4',1997,3,3);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection5',2001,1,4);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection6',2003,4,5);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection7',2011,6,7);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection8',2013,7,6);
insert into collections (name, year_collection, track_id, albom_id) 
values ('Collection9',2018,8,1);


