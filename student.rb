require './person'

# This is the teacher class inherit from person
class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom

  def initialize(name, age, classroom, parent_permission)
    super(name, age)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def can_use_services?
    @age > 18 || @parent_permission == true
  end
end
