# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    select name
    from countries
    where gdp > (select max(gdp) from countries where continent = 'Europe')
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    select countries.continent, countries.name, max_area.max
    from countries
    join (select continent, max(area) from countries group by continent) as max_area
      on countries.area = max_area.max

    -- select
    --   distinct continent,
    --   first_value(name) over(partition by continent order by area desc),
    --   first_value(area) over(partition by continent order by area desc)
    -- from countries;

  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    -- select countries.name, countries.continent, larger.max
    -- from countries
    -- join (select continent, max(population) from countries group by continent) as larger
    --   on countries.population = larger.max
    with countries_with_population_times as (
      select
        continent,
        name,
        population,
        lag(population) over(partition by continent order by population) next_p,
        population/(lag(population) over(partition by continent order by population)) as times
      from countries
    ), largest_countries_with_population_times as (
      select
        continent,
        first_value(name) over(partition by continent order by population desc) as country_name,
        first_value(times) over(partition by continent order by population desc) as population_times
        from countries_with_population_times
    )
    select distinct country_name, continent
    from largest_countries_with_population_times
    where population_times >= 3;
  SQL
end
