class Options
  def initialize()
    @options = ['1 - List all books',
                '2 - List all people',
                '3 - Create a book',
                '4 - Create a person',
                '5 - Create a rental',
                '6 - List all rentals for a given person id',
                '7 - Exit']
  end

  def print_options
    puts "\n Please select a choise"
    @options.each do |item|
      puts item
    end
  end
end
