require './person'
require './book_class'
require './rental_class'
require './student'
require './teacher'
require './classroom_class'
require './capitalize_decorator'

class App
  def initialize
    puts 'School Library Application'
    @people = []
    @books = []
    @rentals = []
  end

  def create_book
    print 'Enter the book name :'
    title = gets.chomp
    print 'Enter the author name :'
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book Created Successfully'
  end

  def list_books
    return 'No books added to the library' unless @books.any?

    text = ''
    @books.each.with_index(1) do |book, i|
      text += "\n#{i}) Title: \"#{book.title}\" Author: #{book.author}"
    end
    text
  end

  def create_person
    print 'Enter the person name :'
    name = gets.chomp
    print 'Enter the person age :'
    age = gets.chomp

    @people << Person.new(age, name)
    puts 'Person Created Successfully'
  end

  def list_people
    return 'No person added to the library' unless @people.any?

    text = ''
    @people.each.with_index(1) do |people, i|
      text += "\n#{i}) Name: \"#{people.name}\" Age: #{people.age}"
    end
    text
  end

  def get_book
    puts list_books
    no = gets.chomp
    no = no.to_i
    @books[no - 1]
  end

  def get_person
    puts list_people
    no = gets.chomp
    no = no.to_i
    @people[no - 1]
  end

  def create_rental
    print 'Enter the date :'
    date = gets.chomp
    print 'Enter the person :'
    person = get_person
    print 'Enter the book :'
    book = get_book

    @rentals << Rental.new(date, person, book)
    puts 'Rental Created Successfully'
  end

  def list_rental_by_person
    return 'No person added to the library' unless @rentals.any?

    text = ''
    @rentals.each.with_index(1) do |rental, i|
      text += "\n#{i}) Date: \"#{rental.date}\" Person: #{rental.person.name}\" Book: #{rental.book.title}"
    end
    text
  end
end
