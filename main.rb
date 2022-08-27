require './app'

def options
  puts "\n\nselect option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a book'
  puts '4 - Create a person'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end
# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
def main
  user_input = nil
  app = App.new

  while user_input != 7
    options
    user_input = gets.chomp

    case user_input
    when '1'
      puts app.list_books
    when '2'
      puts app.list_people
    when '3'
      app.create_book
    when '4'
      app.create_person
    when '5'
      app.create_rental
    when '6'
      puts app.list_rental_by_person
    when '7'
      return
    else
      puts 'Wrong input'
    end
  end
end

main
