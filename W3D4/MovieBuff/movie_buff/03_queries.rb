def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where(actors: { name: those_actors } )
    .group(:id)
    .having('count(movies.id) = ?', those_actors.length)

end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .group('movies.yr/10*10')
    .order('avg(movies.score) DESC')
    .limit(1)
    .pluck('movies.yr/10*10').first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  movie_list = Movie.joins(:actors).where('name = ?', name)

  Actor
    .joins(:movies)
    .where.not(name: name)
    .where(movies: {id: movie_list} )
    .distinct.pluck(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:movies)
    .where('movies.id is null')
    .pluck(:name).length
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  search_name = "%" + whazzername.delete(' ').chars.join('%') + '%'

  Movie.joins(:actors).where("lower(actors.name) like '#{search_name}'")
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor
    .select(:id, :name, '(max(yr) - min(yr)) as career')
    .joins(:movies)
    .group(:id)
    .order('career desc')
    .order('name')
    .limit(3)
end
