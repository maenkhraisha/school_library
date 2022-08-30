require './nameable'

# This is the main class of the application
class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
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
end
