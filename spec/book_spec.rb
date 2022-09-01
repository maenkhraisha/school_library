require_relative '../book_class'

describe Book do
  context 'when a book is created' do
    it 'should have a title' do
      book = Book.new('Harry Potter', 'JK Rowling')
      expect(book.title).to eq('Harry Potter')
    end

    it 'should have an author' do
      book = Book.new('Harry Potter', 'JK Rowling')
      expect(book.author).to eq('JK Rowling')
    end
  end
end