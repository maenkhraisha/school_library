# frozen_string_literal: true

require './person_class'

# This is the teacher class inherit from person
class Teacher < Person
  def initialize(age, specialization, name, parent_permission)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
