require './Person.rb'

class Teacher < Person
    def initialize(specialization)
        super(name = "Unknown" , parent_permission = true, age)
        @specialization = specialization
    end

    def can_use_services?
        return true
    end
end

