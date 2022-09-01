require './rental_class'
require './book_class'
require './student'

describe Classroom do 
    context "giveen parameter" do
        it "should have book" do
            book = Book.new("ATOMIC HABITS","James Clear",1)
            student = Student.new("Mohammad",24,"class A",true,1)
            rent = Rental.new("5/5/2022",student, book)
            expect(rent.date).to eql "5/5/2022"
        end
    end
end