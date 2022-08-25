# frozen_string_literal: true

require './person_class'

# This is the teacher class inherit from person
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
