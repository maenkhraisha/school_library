require './person'
require './book_class'
require './rental_class'
require './student'
require './teacher'
require './classroom_class'
require './capitalize_decorator'
require './trimmer_decorator'

puts "\nRelationships Students & Classroom:"

maen = Student.new('Class 1', 18, 'Maen')
jamal = Student.new('Class 1', 21, 'jamal')
mohammad = Student.new('Class 2', 22, 'mohammad')

class1 = Classroom.new('Class 1')
class2 = Classroom.new('Class 2')

puts "\n\n#{class1.label} details:"
puts "\nInitial #{class1.label} students count: #{class1.students.count}"
class1.add_student(maen)
class1.add_student(jamal)
puts "\nAfter #{maen.name} and #{jamal.name} adding Students - count: #{class1.students.count}"
puts "\nMaen is in class: #{maen.classroom.label}"
puts "\n#{class1.label} last student added is: #{class1.students.last.name}"
puts "\n#{class1.students.last.name} age is: #{class1.students.last.age}"
puts "\nList of students in #{class1.label}"
student_list = class1.students.map(&:name)
p student_list

puts "\n\n#{class2.label} details:"
puts "\nInitial #{class2.label} students count: #{class2.students.count}"
class2.add_student(mohammad)
puts "\nAfter adding #{mohammad.name} Students - count: #{class2.students.count}"
puts "\n#{mohammad.name} is in - #{mohammad.classroom.label}"
puts "\nList of students in #{class2.label}"
student_list = class2.students.map(&:name)
p student_list

puts "\n\nRelationships Person, Book & Rentals:"
person1 = Person.new(18, 'Maen', parent_permission: false)
person2 = Person.new(27, 'Jamal', parent_permission: true)

book1 = Book.new('Nuclear Family', 'Joseph Han')
book2 = Book.new('The Angel of Rome', 'Jess Walter')

puts "\nInitital Total rentals of #{book1.title} = #{book1.rentals.count}"
puts "\nInitital Total rentals of #{book2.title} = #{book2.rentals.count}"
Rental.new('24-08-2022', person1, book1)
Rental.new('21-07-2022', person2, book1)
Rental.new('21-07-2022', person1, book2)

puts "\n#{person1.name} has rented total books = #{person1.rentals.count}"
puts "\n#{person2.name} has rented total books = #{person2.rentals.count}"

puts "\n#{person1.name} rented book list:"
rental_details = ''
person1.rentals.each_with_index do |rental, i|
  rental_details += "\n#{i + 1} => #{rental.date}: #{rental.book.title}
  by #{rental.book.author}"
end
puts rental_details

rental_details = ''
puts "\n#{person2.name} rented book list:"
person2.rentals.each_with_index do |rental, i|
  rental_details += "\n#{i + 1} => #{rental.date}: #{rental.book.title} by #{rental.book.author}"
end
puts rental_details

puts "\nFinally Total rentals of #{book1.title} = #{book1.rentals.count}"
puts "\nFinally Total rentals of #{book2.title} = #{book2.rentals.count}"
