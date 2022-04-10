--1
select title, count(artist_id) from genres join artistsgenres on genres.id = artistsgenres.genre_id group by (genres.title);
--2
select count(*) from tracks join albums on tracks.id_album = albums.id where albums.date between '2019-01-01' and '2020-12-31';
--3
select albums.title, avg(tracks.time) from albums join tracks on albums.id = tracks.id_album  group by (albums.title);
--4
select name from artists a join artistsalbums on a.id = artistsalbums.artist_id 
join albums on artistsalbums.album_id = albums.id where albums.date not between '2020-01-01' and '2020-12-31';
--5
select m.title from mixtapes m join tracksmixtapes t on m.id = t.mixtape_id join tracks t2 on t.track_id = t2.id 
join albums a on t2.id_album = a.id join artistsalbums a2 on a.id = a2.album_id 
join artists a3 on a2.artist_id = a3.id where a3.name = 'Kirkorov';
--6
select distinct a.title from albums a join artistsalbums a2 on a.id = a2.album_id 
join artists a3 on a2.artist_id = a3.id join artistsgenres a4 on a3.id = a4.artist_id
where (select count(a4.artist_id) from artistsgenres a4) > 1;
--7
select title from tracks t left join tracksmixtapes t2 ON t.id = t2.track_id where t2.track_id is null;
--8
select distinct name from artists a join artistsalbums a2 on a.id = a2.artist_id join albums a3 on a2.album_id = a3.id
join tracks t on a3.id = t.id_album where t.time = (select min(time) from tracks);
--9
select distinct a.title from albums a join tracks t on a.id = t.id_album where t.id_album in 
(select id_album from tracks group by id_album 
having count(id) = (select count(id) from tracks group by id_album order by count limit 1));