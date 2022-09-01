require_relative '../person'

describe Person do
  context 'when a person is created' do
    it 'should have a name' do
      person = Person.new('John', 20)
      expect(person.name).to eq('John')
    end

    it 'should have an age' do
      person = Person.new('John', 20)
      expect(person.age).to eq(20)
    end

    it 'should have an id' do
      person = Person.new('John', 20)
      expect(person.id).to be_an(Integer)
    end
  end
end
