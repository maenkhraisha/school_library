class Book
    attr_accessor :title
    attr_accessor :author

    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end

    def add_rental(rent)
        @rentals.push(rent)
        rent.book = self
    end
end