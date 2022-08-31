require 'json'
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
    load_books_from_files
    load_people_from_files
    load_rentals_from_files
  end

  def create_book
    print 'Enter the book title :'
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

    @people << Teacher.new(name, age, specialization)
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
    parent_permission = parent_permission == 'y'

    @people << Student.new(name, age, classroom, parent_permission)
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
    return 'No rental exist for this person' unless @rentals.any?

    text = ''
    @rentals.each.with_index(1) do |rental, i|
      if rental.person.id.to_i == id.to_i
        text += "\n#{i}) Date: \"#{rental.date}\" Person: #{rental.person.name} Book: #{rental.book.title}"
      end
    end
    text
  end

  def save_data
    save_books
    save_people
    save_rental
  end

  def save_books
    File.write('./json_files/books.json', '')
    File.write('./json_files/books.json', "[\n", mode: 'a')
    @books.each_with_index do |book, i|
      b = { title: book.title, author: book.author, id: book.id }
      json = JSON.generate(b)
      File.write('./json_files/books.json', json, mode: 'a')
      File.write('./json_files/books.json', "\n", mode: 'a')
      i == @books.length - 1 ? '' : File.write('./json_files/books.json', ",\n", mode: 'a')
    end
    File.write('./json_files/books.json', "]\n", mode: 'a')
  end

  def save_people
    File.write('./json_files/people.json', '')
    File.write('./json_files/people.json', "[\n", mode: 'a')
    @people.each_with_index do |person, i|
      b = if person.instance_variable_defined?('@classroom')
            { type: person.type,
              id: person.id,
              age: person.age,
              name: person.name,
              classroom: person.classroom,
              parent_permission: person.parent_permission }
          else
            { type: person.type,
              id: person.id,
              age: person.age,
              name: person.name,
              specialization: person.specialization }
          end

      json = JSON.generate(b)
      File.write('./json_files/people.json', json, mode: 'a')
      File.write('./json_files/people.json', "\n", mode: 'a')
      i == @people.length - 1 ? '' : File.write('./json_files/people.json', ",\n", mode: 'a')
    end
    File.write('./json_files/people.json', ']', mode: 'a')
  end

  def save_rental
    File.write('./json_files/rentals.json', '')
    File.write('./json_files/rentals.json', "[\n", mode: 'a')
    @rentals.each_with_index do |rental, i|
      b = { date: rental.date, person: rental.person.id, book: rental.book.id }
      json = JSON.generate(b)
      File.write('./json_files/rentals.json', json, mode: 'a')
      File.write('./json_files/rentals.json', "\n", mode: 'a')
      i == @rentals.length - 1 ? '' : File.write('./json_files/rentals.json', ",\n", mode: 'a')
    end
    File.write('./json_files/rentals.json', ']', mode: 'a')
  end

  def load_books_from_files
    return unless File.exist?('./json_files/books.json')

    file_data = File.read('./json_files/books.json').split

    file_data.each do |item|
      next unless item[0] == '{'

      data = JSON.parse(item)
      id = data['id']
      title = data['title']
      author = data['author']
      @books << Book.new(title, author, id)
    end
  end

  def load_people_from_files
    return unless File.exist?('./json_files/people.json')

    file_data = File.read('./json_files/people.json').split

    file_data.each do |item|
      next unless item[0] == '{'

      data = JSON.parse(item)
      id = data['id']
      name = data['name']
      age = data['age']
      type = data['type']
      if type == 't'
        specialization = data['specialization']
        @people << Teacher.new(name, age, specialization, id)
      else
        classroom = data['classroom']
        parent_permission = data['parent_permission']
        @people << Student.new(name, age, classroom, parent_permission, id)
      end
    end
  end

  def load_rentals_from_files
    return unless File.exist?('./json_files/rentals.json')

    file_data = File.read('./json_files/rentals.json').split

    file_data.each do |item|
      next unless item[0] == '{'

      data = JSON.parse(item)
      date = data['date']      
      person = get_person_by_id(data['person'])      
      book = get_book_by_id(data['book'])

      @rentals << Rental.new(date, person, book)
    end
  end

  def get_book_by_id(id)
    result = ''
    @books.each do |item|
      item.id == id ? result = item : ''
    end
    result
  end

  def get_person_by_id(id)
    result = ''
    @people.each do |item|
      item.id == id ? result = item : ''
    end
    result
  end
end
