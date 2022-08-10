require_relative 'spec_helper'

describe Book do
  before(:each) do
    @old_book = Book.new('04-09-2009', 'Amazon', 'good')
    @new_book = Book.new('04-09-2021', 'Wood Bridge', 'excellent')
    @bad_book = Book.new('04-09-2022', 'Google', 'bad')
  end

  context 'testing the book class' do
    it 'Should an instance of Book class' do
      expect(@old_book).to be_an_instance_of Book
    end

    it 'Should can_be_archieved equal to true' do
      expect(@old_book.can_be_archived?).to eq(true)
    end

    it 'Should can_be_archieved equal to false' do
      expect(@new_book.can_be_archived?).to eq(false)
    end

    it 'Should the publisher return Google' do
      expect(@bad_book.publisher).to eq('Google')
    end
  end
end
