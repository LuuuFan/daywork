require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options
  # select houses.* from humans join houses on human.house_id = houses.id where humans.id = ?

  #(:home, :human, :house)
  def has_one_through(name, through_name, source_name)
    define_method(name) do
      #Cat.assoc_options[:human] = #<BelongsToOptions:0x0055797c470540 @class_name="Human", @foreign_key=:owner_id, @primary_key=:id>
      opt = self.class.assoc_options[through_name]

      #Human.assoc_options[:house] = #<BelongsToOptions:0xxxxxxxxxxxx @class_name="House", @foreign_key=:house_id, @primary_key=:id>
      through_opt = opt.model_class.assoc_options[source_name]

      #select houses.* from humans join houses on humans.house_id = houses.id where humans.id= ?
      query = DBConnection.execute(<<-SQL)
        select "#{through_opt.table_name}".*
        from "#{opt.table_name}"
        join "#{through_opt.table_name}"
        on "#{opt.table_name}"."#{through_opt.foreign_key}" = "#{through_opt.table_name}"."#{through_opt.primary_key}"
        where "#{opt.table_name}"."#{opt.primary_key}" = "#{self.send(opt.foreign_key)}"
      SQL

      through_opt.model_class.new(query[0])
    end
  end
end
