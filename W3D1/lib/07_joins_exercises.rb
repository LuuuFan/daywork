# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    actors.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    actors.name = 'Harrison Ford'
    AND
    castings.ord != 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
  SELECT
    title, name
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    yr = 1962
    AND
    castings.ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT yr, count
    FROM (
      SELECT yr, count(*)
      FROM (
        SELECT *
        FROM actors
        JOIN castings
          ON actors.id = castings.actor_id
        JOIN movies
          ON movie_id = movies.id
        WHERE actors.name = 'John Travolta'
      ) AS John_movies
      GROUP BY yr
    ) AS movies_yr
    WHERE count >= 2
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT title, name
    FROM movies
    JOIN castings
      ON movies.id = castings.movie_id
    JOIN actors
      ON  actor_id = actors.id
    WHERE movies.id IN
    (
      SELECT movie_id
      FROM actors
      JOIN castings
        ON actors.id = castings.actor_id
      JOIN movies
        ON movie_id = movies.id
      WHERE actors.name = 'Julie Andrews'
    )
    AND
      castings.ord = 1

  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    SELECT name
    FROM (
      SELECT name, count(*)
      FROM actors
      JOIN castings
        ON actor_id = actors.id
      WHERE castings.ord = 1
      GROUP BY name
    ) AS lead_count
    WHERE count >= 15
    ORDER BY name ASC
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    SELECT title, count
    FROM
    (SELECT title, count(*)
      FROM movies
      JOIN castings
        ON movie_id = movies.id
      WHERE yr = 1978
      GROUP BY title
    ) as actors_count
    ORDER BY count DESC, title ASC
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    SELECT name
    FROM actors
    JOIN castings
      ON castings.actor_id = actors.id
    JOIN (
      SELECT DISTINCT movie_id
      FROM actors
      JOIN castings
        ON actors.id = actor_id
      JOIN movies
        ON movie_id = movies.id
      WHERE name = 'Art Garfunkel') AS art_movie
        ON art_movie.movie_id = castings.movie_id
      WHERE name != 'Art Garfunkel'
  SQL
end
