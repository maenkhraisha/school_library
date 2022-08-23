require './Person_Class'

# This is the teacher class inherit from person
class Teacher < Person
  def initialize(specialization, name, parent_permission, age)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
