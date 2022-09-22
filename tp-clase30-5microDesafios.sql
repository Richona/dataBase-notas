-- microDesafio 1
select title, name
from series
inner join genres on series.genre_id = genre_id;

select episodes.title, actors.first_name, actors.last_name
from episodes
inner join actor_episode on actor_episode.episode_id = episodes.id
inner join actors on actors.id = actor_episode.actor_id;


-- microdesafio 2
select distinct actors.first_name, actors.last_name
from actors
inner join actor_movie on actors.id = actor_movie.actor_id
inner join movies on movies.id = actor_movie.movie_id
where movies.title like "%guerra%";


-- microdesafio 3
select title, ifnull(name, "No tiene genero") as genero
from movies
left join genres on movies.genre_id = genres.id;

-- microdesafio 4
select series.title, datediff(series.end_date, series.release_date) as duracion
from series;

-- microdesafio 5
select actors.first_name
from actors
where length(actors.first_name) > 6
order by actors.first_name;

select count(*) as total
from episodes;

select series.title, count(*) as temporadas
from series
inner join seasons on series.id = seasons.serie_id
group by series.title;

/* Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor
o igual a 3. */

SELECT count(*), movies.title, movies.genre_id, genres.name, genres.id 
FROM movies
INNER JOIN genres ON movies.genre_id = genres.id
group by genres.name
having count(*) >= 3;