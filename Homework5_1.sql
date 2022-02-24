--количество исполнителей в каждом жанре;
select name, count(*) as count_artists from genres
left join artists_genre on genres.id = artists_genre.genreid
group by name;
--количество треков, вошедших в альбомы 2015-2018 годов;
select alboms.year_albom, count(tracks.id) from tracks
join alboms on tracks.id = alboms.id 
where year_albom between 2015 and 2018
group by alboms.year_albom;
--средняя продолжительность треков по каждому альбому;
select alboms.name, AVG(tracks.duration) as Avg_duration from tracks
left join collection_track on tracks.id= collection_track.track_id
join alboms on tracks.id = alboms.id 
group by alboms.name;
--все исполнители, которые не выпустили альбомы в 2018 году;
select DISTINCT artists.name from artists 
join artistalbom ON artists.id = artistalbom.artist_id
left join alboms on alboms.id = artists.id
where artists.name not in (select artists.name from artists where alboms.year_albom in(2018));
--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select collections.name from collections
left join collection_track on collections.id = collection_track.collection_id 
left join tracks on collection_track.collection_id  = tracks.id 
left join alboms on tracks.albom_id = alboms.id 
left join artistalbom on alboms.id = artistalbom.albom_id 
left join artists on artistalbom.artist_id = artists.id
where artists.name = 'Sting';
--название альбомов, в которых присутствуют исполнители более 1 жанра;
select artists.name, count(artists_genre.artistid) as Count_ganre from alboms 
right join artistalbom on alboms.id = artistalbom.albom_id 
join artists on artistalbom.id = artists.id
left join artists_genre on artists.id = artists_genre.artistid
left join genres on artists_genre.artistid = genres.id 
group by alboms.name, artists.name
having count(artists_genre.artistid)>1;
--наименование треков, которые не входят в сборники;
select tracks.name, collections.name from tracks
left join collection_track on tracks.id = collection_track.track_id 
full join collections on collection_track.collection_id  = collections.id
where tracks.id is null or collection_track.track_id is null ;
--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select artists.name, tracks.name, tracks.duration from artists
left join artistalbom on artists.id = artistalbom.artist_id 
left join alboms on artistalbom.albom_id = alboms.id
right join tracks on alboms.id = tracks.albom_id
group by artists.name, tracks.name, tracks.duration
having tracks.duration = (select min(duration ) from tracks);
--название альбомов, содержащих наименьшее количество треков.
select alboms.name, count(tracks.id) from tracks 
left join alboms on tracks.albom_id  = alboms.id
group by alboms.name
having count(tracks.id) = (select count(tracks.id) from tracks 
left join alboms on tracks.albom_id  = alboms.id 
group by alboms.name
order by count(tracks.id)
limit 1);
