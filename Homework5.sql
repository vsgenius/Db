--количество исполнителей в каждом жанре;
select name, count(*) as count_artists from genres
left join artists_genre on genres.id = artists_genre.genreid
group by name;
--количество треков, вошедших в альбомы 2015-2018 годов;
select alboms.year_albom, count(tracks.id) from tracks
left join collections on tracks.id= collections.track_id
join alboms on tracks.id = alboms.id 
where year_albom between 2015 and 2018
group by alboms.year_albom;
--средняя продолжительность треков по каждому альбому;
select alboms.name, AVG(tracks.duration) as Avg_duration from tracks
left join collections on tracks.id= collections.track_id
join alboms on tracks.id = alboms.id 
group by alboms.name;
--все исполнители, которые не выпустили альбомы в 2018 году;
select artists.name from artists 
left join artistalbom ON artists.id = artistalbom.artist_id
left join alboms on alboms.id = artists.id
where artists.name not in (select artists.name from artists where year_albom in(2018))
group by artists.name;
--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select collections.name, artists,name from collections
left join alboms on collections.albom_id = alboms.id 
left join artistalbom on alboms.id = artistalbom.albom_id 
left join artists on artistalbom.id = artists.id 
where artists.name = 'Sting';
--название альбомов, в которых присутствуют исполнители более 1 жанра;
select collections.name, artists.name, count(artists_genre.artistid) from collections
right join alboms on collections.albom_id = alboms.id 
right join artistalbom on alboms.id = artistalbom.albom_id 
join artists on artistalbom.id = artists.id
left join artists_genre on artists.id = artists_genre.artistid
left join genres on artists_genre.artistid = genres.id 
group by collections.name, artists.name
having count(artists_genre.artistid)>1;
--наименование треков, которые не входят в сборники;
select tracks.name, collections.name from tracks
full join collections on tracks.id = collections.track_id 
where tracks.id is null or collections.track_id is null ;
--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select artists.name, tracks.name, tracks.duration from artists
left join artistalbom on artists.id = artistalbom.artist_id 
left join alboms on artistalbom.albom_id = alboms.id
left join collections on alboms.id = collections.albom_id
right join tracks on collections.track_id = tracks.id
group by artists.name, tracks.name, tracks.duration
having tracks.duration = (select min(duration ) from tracks);
--название альбомов, содержащих наименьшее количество треков.
select alboms.name, count(collections.track_id) as count_tracks from alboms
left join collections on alboms.id = collections.albom_id
group by alboms.name
having count(collections.track_id) = (select min(collections.track_id) from alboms left join collections on alboms.id = collections.albom_id);
