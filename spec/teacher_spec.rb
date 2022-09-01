require_relative '../teacher'

describe Teacher do
  context '#initialize' do
    it 'initializes with an empty array' do
      teacher = Teacher.new('Mohammad', 24, 'Math')
      expect(teacher.name).to eq('Mohammad')
    end
  end

  context '#can_use_service' do
    it 'returns true' do
      teacher = Teacher.new('Mohammad', 24, 'Math')
      expect(teacher.specialization).to eq('Math')
    end
  end
end
