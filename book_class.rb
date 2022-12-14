# This class for book
class Book
  attr_reader :rentals, :id
  attr_accessor :title, :author

  def initialize(title, author, id = 0)
    @id = if id.zero?
            Random.rand(1..1000)
          else
            id
          end
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
