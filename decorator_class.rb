require './nameable_class'

class Decorator < Nameable
    def initialize(nameable)
        @nameable = nameable
        super()
    end

    def correct_name
        @nameable.correct_name
    end

end