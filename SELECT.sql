/* Задание 2*/

SELECT track_name, duration -- Самый длинный трек.
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

SELECT track_name -- Треки, котиорые длиннее 3.5 минут.
FROM track
WHERE duration >= 210;

SELECT name  -- Все исполнители,чьё имя состоит из одного слова.
FROM musician
WHERE name NOT LIKE '% %';

SELECT compilation_name -- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
FROM compilation c 
WHERE c.release_year  BETWEEN 2018 AND 2020

-- Название треков, которые содержат слово «мой» или «my».
SELECT  track_name 
FROM (SELECT *, REGEXP_MATCHES(track_name,'((^my\W)|(\Wmy$)|(\Wmy\W))|((^мой\W)|(\Wмой$)|(\Wмой\W))','i')  from track  ) as t

/* Задание 3*/

SELECT genre_name, COUNT(musician_id) m_count -- Количество исполнителей в каждом жанре.
FROM musician_genre mg
LEFT JOIN genre g ON g.id = mg.genre_id
GROUP BY genre_name
ORDER BY m_count DESC;

SELECT COUNT(track.album_id) t_count  -- Количество треков, вошедших в альбомы 2019–2020 годов..
FROM track
LEFT JOIN album a ON a.id  = track.album_id 
WHERE a.release_date  BETWEEN '2019-01-01' AND '2020-12-31';

SELECT a.album_name, AVG(track.duration) avg_duration  -- Средняя продолжительность треков по каждому альбому.
FROM track
LEFT JOIN album a ON a.id  = track.album_id 
GROUP BY a.album_name 
ORDER BY a.album_name;

SELECT m.name  -- Все исполнители, которые не выпустили альбомы в 2020 году.
FROM musician_album ma
LEFT JOIN musician m ON m.id = ma.musician_id 
WHERE m.name IN(SELECT m.name
				FROM musician
				LEFT JOIN musician_album ma ON m.id  = ma.musician_id  
				LEFT JOIN album a ON a.id  = ma.album_id 
				WHERE a.release_date  > '2020-01-01' AND a.release_date <'2020-12-31');
				
SELECT c.compilation_name --названия сборников, в которых присутствует конкретный исполнитель (Порнофильмы)
FROM compilation c
LEFT JOIN track_compilation tc  ON tc.compilation_id  = c.id 
LEFT JOIN track t  ON t.id  = tc.track_id  
LEFT JOIN album a ON a.id  = t.id 
LEFT JOIN musician_album ma ON ma.album_id  = a.id
LEFT JOIN musician m ON a.id  = m.id 
where m.name = 'Порнофильмы'