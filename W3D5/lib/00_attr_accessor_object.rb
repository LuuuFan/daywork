require 'active_support'
require 'byebug'

class AttrAccessorObject
  # def initialize
  #
  # end
  def method_missing(name, *args)
    AttrAccessorObject.my_attr_accessor(name)
  end

  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
        # debugger
        self.instance_variable_get("@#{name.to_s}")
      end
      define_method("#{name}=") do |val|
        self.instance_variable_set("@#{name.to_s}", val)
      end
    end
  end
end
