require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    # debugger
    arr = []
    search_keys = params.keys.join(' = ? AND ') + ' = ?'
    search_values = params.values
    results = DBConnection.execute(<<-SQL, *search_values)
      select *
      from #{self.table_name}
      where #{search_keys}
    SQL
    # debugger
    results.each{ |result| arr << self.new(result) } unless results.empty?
    arr
  end
end

class SQLObject
  extend Searchable
  def self.table_name=(table_name)
    # debugger
    # instance_variable_set("@#{table_name}", table_name)
    @table_name = table_name
  end

  def self.table_name
    # result = instance_variable_get("@#{table_name}")
    @table_name || self.to_s.tableize
    # result.nil? ? table_name : result
  end

  # Mixin Searchable here...
end
