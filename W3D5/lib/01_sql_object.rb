require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# require_relative '02_searchable'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # debugger
    if @columns.nil?
      result = DBConnection.execute2(<<-SQL)
        select * from "#{self.table_name}"
      SQL
      @columns = result[0].map(&:to_sym)
    end
    @columns
  end

  def self.finalize!
    if @columns.nil?
      self.columns
    end
    @columns.each do |column|
      define_method(column) do
        @attributes = Hash.new if @attributes.nil?
        @attributes[column]
      end
      # debugger
      define_method(column.to_s + "=") do |val|
        # instance_variable_set("@#{column.to_s}", val)
        # debugger
        if @attributes.nil?
          @attributes = Hash.new
        end
        @attributes[column] = val
      end
    end
  end

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

  def self.all
    results = []
    all = DBConnection.execute(<<-SQL)
      select * from "#{self.table_name}"
    SQL

    all.each do |arg|
      # debugger
      results << self.new(arg)
    end
    results
    # p results
  end

  def self.parse_all(results)
    arr = []
    results.each do |obj|
      arr << self.new(obj)
    end
    arr
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      select *
      from "#{self.table_name}"
      where id = ?
    SQL
    # p result
    result.empty? ? nil : self.new(result[0])
  end

  def initialize(params = {})
    columns = self.class.columns
    # debugger
    params.each do |key, val|
      raise "unknown attribute '#{key}'" unless columns.include?(key.to_sym)
      self.send(key.to_s + '=', val)
    end
  end

  def attributes
    # debugger
    @attributes || @attributes = Hash.new
    @attributes
  end

  def attribute_values
    @attributes.values
  end

  def insert
    column_names = self.class.columns.drop(1).map(&:to_s).join(', ')
    # debugger
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO #{self.class.table_name} (#{column_names})
      VALUES (?, ?)
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # column_name = self.class.columns.drop(1)
    # debugger
    value_change = self.class.columns.drop(1).map(&:to_s).join('= ?, ') + '= ?'
    # p value_change
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE #{self.class.table_name}
      SET #{value_change}
      WHERE id = ?
    SQL
  end

  def save
    if self.id
      # debugger
      update
    else
      # debugger
      insert
    end
  end

  # self.finalize!
end
