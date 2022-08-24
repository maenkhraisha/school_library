# frozen_string_literal: true

require './nameable_class'

# This is the main class of the application
class Person < Nameable
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def correct_name
    @name
  end

  def of_age?
    @age > 18
  end

  def can_use_services?
    @age > 18 || @parent_permission == true
  end
end

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# capitalizedPerson.correct_name

# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
#   capitalizedTrimmedPerson.correct_name
