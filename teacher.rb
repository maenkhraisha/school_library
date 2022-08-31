require './person'

# This is the teacher class inherit from person
class Teacher < Person
  attr_accessor :age, :specialization, :name
  attr_reader :type

  def initialize(name, age, specialization, id = 0)
    super(name, age, id)
    @type = 't'
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
