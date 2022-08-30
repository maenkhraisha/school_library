require './nameable'

# This is the main class of the application
class Person < Nameable
  attr_reader :id, :parent_permission, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
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
