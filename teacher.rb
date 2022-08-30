require './person'

# This is the teacher class inherit from person
class Teacher < Person
  attr_accessor :age, :specialization, :name

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
