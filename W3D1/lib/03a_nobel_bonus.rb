# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    -- SELECT physics_nobels.yr
    -- FROM (
    --   SELECT DISTINCT yr
    --   FROM nobels
    --   WHERE subject = 'Physics'
    -- ) AS physics_nobels
    -- LEFT OUTER JOIN (
    --   SELECT DISTINCT yr
    --   FROM nobels WHERE subject = 'Chemistry'
    -- ) AS chemistry_nobels
    --   ON physics_nobels.yr = chemistry_nobels.yr
    -- WHERE chemistry_nobels.yr IS NULL
    select
      yr
    from nobels
    group by yr
    having sum(
      case
        when subject = 'Physics' then 1
        when subject = 'Chemistry' then 100
        else 0
      end
    ) between 1 and 99
  SQL
end
