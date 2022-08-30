require './person'

# This is the teacher class inherit from person
class Teacher < Person
  attr_accessor :age, :specialization, :name, :parent_permission

  def initialize(age, specialization, name, parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
