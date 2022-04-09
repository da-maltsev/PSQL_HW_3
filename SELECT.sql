select title, date from albums where date between '2018-01-01' and '2018-12-31';
select title, time from tracks order by time desc limit 1;
select title from tracks where time >= 210;
select title from mixtapes where date between '2018-01-01' and '2020-12-31';	
select name from artists where name not like '% %';
select title from tracks where title ilike '%my%';