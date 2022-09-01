require './classroom_class'

describe Classroom do
  context 'giveen parameter' do
    it 'should have name' do
      class_one = Classroom.new('class A')
      expect(class_one.label).to eql 'class A'
    end
  end
end
