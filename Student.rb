require './person'

# This is the teacher class inherit from person
class Student < person
  def initialize(classroom)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
