require '../classroom_class.rb'

describe Classroom do 
    context "give no parameter" do
        it "did not return object" do
            classroon = Classroom.new
            expect(classroom).to eql nil
        end
    end
end