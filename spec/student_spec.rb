require_relative '../student'

describe Student do
  context '#initialize' do
    it 'initializes with an empty array' do
      student = Student.new('Mohammad', 24, 'class A', true, 1)
      expect(student.name).to eq('Mohammad')
    end
  end

  context '#play_hooky' do
    it "returns '¯\(ツ)/¯'" do
      student = Student.new('Mohammad', 24, 'class A', true, 1)
      expect(student.play_hooky).to eq("¯\(ツ)/¯")
    end
  end

  context '#can_use_services?' do
    it 'returns true' do
      student = Student.new('Mohammad', 24, 'class A', true, 1)
      expect(student.can_use_services?).to be true
    end
  end
end
