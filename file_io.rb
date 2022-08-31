module File_Operation
  def save_books(books)
    File.write('./json_files/books.json', '')
    File.write('./json_files/books.json', "[\n", mode: 'a')
    books.each_with_index do |book, i|
      b = { title: book.title, author: book.author, id: book.id }
      json = JSON.generate(b)
      File.write('./json_files/books.json', json, mode: 'a')
      File.write('./json_files/books.json', "\n", mode: 'a')
      i == books.length - 1 ? '' : File.write('./json_files/books.json', ",\n", mode: 'a')
    end
    File.write('./json_files/books.json', "]\n", mode: 'a')
  end

  def save_people(people)
    File.write('./json_files/people.json', '')
    File.write('./json_files/people.json', "[\n", mode: 'a')
    people.each_with_index do |person, i|
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
      i == people.length - 1 ? '' : File.write('./json_files/people.json', ",\n", mode: 'a')
    end
    File.write('./json_files/people.json', ']', mode: 'a')
  end

  def save_rental(rentals)
    File.write('./json_files/rentals.json', '')
    File.write('./json_files/rentals.json', "[\n", mode: 'a')
    rentals.each_with_index do |rental, i|
      b = { date: rental.date, person: rental.person.id, book: rental.book.id }
      json = JSON.generate(b)
      File.write('./json_files/rentals.json', json, mode: 'a')
      File.write('./json_files/rentals.json', "\n", mode: 'a')
      i == rentals.length - 1 ? '' : File.write('./json_files/rentals.json', ",\n", mode: 'a')
    end
    File.write('./json_files/rentals.json', ']', mode: 'a')
  end

  def load_books_from_files
    books = []
    return unless File.exist?('./json_files/books.json')

    file_data = File.read('./json_files/books.json').split

    file_data.each do |item|
      next unless item[0] == '{'

      data = JSON.parse(item)
      id = data['id']
      title = data['title']
      author = data['author']
      books << Book.new(title, author, id)
    end
    books
  end

  def load_people_from_files
    people = []
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
        people << Teacher.new(name, age, specialization, id)
      else
        classroom = data['classroom']
        parent_permission = data['parent_permission']
        people << Student.new(name, age, classroom, parent_permission, id)
      end
    end
    people
  end

  def load_rentals_from_files(people, books)
    rentals = []
    return unless File.exist?('./json_files/rentals.json')

    file_data = File.read('./json_files/rentals.json').split

    file_data.each do |item|
      next unless item[0] == '{'

      data = JSON.parse(item)
      date = data['date']
      person = get_person_by_id(data['person'], people)
      book = get_book_by_id(data['book'], books)

      rentals << Rental.new(date, person, book)
    end
    rentals
  end

  def get_book_by_id(id, books)
    result = ''
    books.each do |item|
      item.id == id ? result = item : ''
    end
    result
  end

  def get_person_by_id(id, people)
    result = ''
    people.each do |item|
      item.id == id ? result = item : ''
    end
    result
  end
end
