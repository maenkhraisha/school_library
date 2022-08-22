
require './Person.rb'

class Student < Person
    def initialize(classroom)
        super(name = "Unknown" , parent_permission = true, age)
        @classroom = classroom
    end

    def play_hooky
        return "¯\(ツ)/¯"
    end
end