require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    @class_name.downcase + 's'
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    if options[:foreign_key]
      @foreign_key = options[:foreign_key]
    else
      @foreign_key = (name.to_s + 'Id').underscore.to_sym
    end
    if options[:primary_key]
      @primary_key = options[:primary_key]
    else
      @primary_key = :id
    end
    if options[:class_name]
      @class_name = options[:class_name]
    else
      @class_name = name.to_s.singularize.camelcase
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    if options[:foreign_key]
      @foreign_key = options[:foreign_key]
    else
      @foreign_key = (self_class_name + 'Id').underscore.to_sym
    end
    if options[:primary_key]
      @primary_key = options[:primary_key]
    else
      @primary_key = :id
    end
    if options[:class_name]
      @class_name = options[:class_name]
    else
      @class_name = name.to_s.singularize.camelcase
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    opt = BelongsToOptions.new(name, options)
    self.assoc_options[name] = opt

    define_method(name) do
      # debugger
      return nil if self.send(opt.foreign_key).nil?
      query = DBConnection.execute(<<-SQL)
        select *
        from "#{opt.table_name}"
        where "#{opt.primary_key}" = "#{self.send(opt.foreign_key)}"
      SQL
      opt.model_class.new(query[0])
    end
  end

  def has_many(name, options = {})
    define_method(name) do
      self_class_name = self.class.to_s
      opt = HasManyOptions.new(name, self_class_name, options)
      result = []
      query = DBConnection.execute(<<-SQL)
        select *
        from "#{opt.table_name}"
        where "#{opt.foreign_key}" = "#{self.id}"
      SQL
      query.each { |arg| result << opt.model_class.new(arg) }
      result
    end
  end

  def assoc_options
    @hash ||= Hash.new
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end
# 
# class Cat < SQLObject
#   belongs_to :human, :foreign_key => :owner_id
#
#   finalize!
# end
