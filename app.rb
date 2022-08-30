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

  def create_teacher
    print 'Enter the person name :'
    name = gets.chomp
    print 'Enter the person age :'
    age = gets.chomp
    print 'Enter the teacher specialization :'
    specialization = gets.chomp

    @people << Teacher.new(age, specialization, name)
    puts 'Teacher Created Successfully'
  end

  def create_student
    print 'Enter the person name :'
    name = gets.chomp
    print 'Enter the person age :'
    age = gets.chomp
    print 'Enter classroom name :'
    classroom = gets.chomp
    print 'Do you have parent permission? (yes/no) :'
    parent_permission = gets.chomp
    parent_permission = if parent_permission == 'yes'
                          true
                        else
                          false
                        end

    @people << Student.new(classroom, age, name, parent_permission)
    puts 'Student Created Successfully'
  end

  def list_people
    return 'No person added to the library' unless @people.any?

    text = ''
    @people.each.with_index(1) do |people, i|
      text += "\n#{i}) Name: \"#{people.name}\" ID: #{people.id} Age: #{people.age}"
    end
    text
  end

  def books_list
    puts list_books
    no = gets.chomp
    no = no.to_i
    @books[no - 1]
  end

  def person_list
    puts list_people
    no = gets.chomp
    no = no.to_i
    @people[no - 1]
  end

  def create_rental
    print 'Enter the date :'
    date = gets.chomp
    print 'Enter the person :'
    person = person_list
    print 'Enter the book :'
    book = books_list

    @rentals << Rental.new(date, person, book)
    puts 'Rental Created Successfully'
  end

  def list_rental_by_person(id)
    return 'No person added to the library' unless @rentals.any?

    text = ''
    @rentals.each.with_index(1) do |rental, i|
      if rental.person.id.to_i == id.to_i
        text += "\n#{i}) Date: \"#{rental.date}\" Person: #{rental.person.name}\" Book: #{rental.book.title}"
      end
    end
    text
  end
end
