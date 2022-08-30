class Options
  def initialize()
    @main_options =
      ['1 - List all books',
       '2 - List all people',
       '3 - Create a book',
       '4 - Create a person',
       '5 - Create a rental',
       '6 - List all rentals for a given person id',
       '7 - Exit']

    @second_options =
      ['1 - create teacher',
       '2 - create student']
  end

  def print_main_options
    puts "\n Please select a choise"
    @main_options.each do |item|
      puts item
    end
  end

  def print_second_options
    puts "\n Please select a choise"
    @second_options.each do |item|
      puts item
    end
  end
end
