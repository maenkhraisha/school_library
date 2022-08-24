# frozen_string_literal: true

require './Person_Class'

# This is the teacher class inherit from person
class Student < Person
  def initialize(age, classroom, name, parent_permission)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
