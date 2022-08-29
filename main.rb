require './app'
require './options'

# rubocop:disable Metrics/CyclomaticComplexity

def main
  user_input = nil
  app = App.new

  option = Options.new

  while user_input != 7
    option.print_options
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
      puts 'Enter person ID to show his rental :'
      id = gets.chomp
      puts app.list_rental_by_person(id)
    when '7'
      return
    else
      puts 'Wrong input'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
main
