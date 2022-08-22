require './person'

# This is the teacher class inherit from person
class Teacher < person
  def initialize(specialization)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

