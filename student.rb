require './person'

# This is the teacher class inherit from person
class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name)
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