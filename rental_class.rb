# frozen_string_literal: true

# this class make the relashionship between person and books
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end
end
