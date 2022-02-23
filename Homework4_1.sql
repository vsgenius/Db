insert into artists(id,name) 
values 
	(1,'Sting'),
	(2,'Madonna'),
	(3,'Michael Jackson'),
	(4,'Zivert'),
	(5,'Rihanna'),
	(6,'Земфира'),
	(7,'Дима Билан'),
	(8,'Федор Шаляпин');

insert into genres(id,name) 
values 
	(1,'рок'),
	(2,'поп'),
	(3,'джаз'),
	(4,'шансон'),
	(5,'блюз');

insert into artists_genre(artistid,genreid) 
values 
	(1,1),
	(2,2),
	(1,5),
	(3,2),
	(4,2),
	(5,2),
	(5,3),
	(6,3),
	(6,1),
	(7,2),
	(8,4);

insert into alboms(name,year_albom) 
values 
	('Albom1',1991),
	('Albom2',1991),
	('Albom3',1995),
	('Albom4',1999),
	('Albom5',2018),
	('Albom6',2010),
	('Albom7',2015),
	('Albom8',2018);

insert into ArtistAlbom(artist_id ,albom_id) 
values 
	(1,1),
	(1,2),
	(3,3),
	(3,4),
	(4,3),
	(5,5),
	(6,6),
	(7,8),
	(8,7),
	(8,6);


insert into tracks(id,name,duration,albom_id) 
values 
	(1,'MyTrack1',3.40,1),
	(2,'Track2',1.40,2),
	(3,'MyTrack2_1',2.40,3),
	(4,'Track2',4.45,5),
	(5,'MyTrack1',2.35,8),
	(6,'Track6',2.20,7),
	(7,'Track11',5.40,6),
	(8,'MyTrack12',6.40,1),
	(9,'Track1',3.40,2),
	(10,'Track5',3.10,3),
	(11,'Track7',2.50,5),
	(12,'MyTrack9',3.40,7),
	(13,'Track15',2.40,1),
	(14,'Track14',1.40,2),
	(15,'Track10',5.40,3);

insert into collections (name, year_collection) 
values 
	('Collection1',2001),
	('Collection2',2019),
	('Collection3',1993),
	('Collection4',1997),
	('Collection5',2001),
	('Collection6',2003),
	('Collection7',2011),
	('Collection8',2013),
	('Collection9',2018);

insert into collection_track(collection_id,track_id)
values 
	(5,8),
	(9,1),
	(2,2),
	(3,3),
	(1,4),
	(4,5),
	(6,7),
	(7,6),
	(8,1);



