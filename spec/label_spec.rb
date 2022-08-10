require_relative 'spec_helper'

describe Label do
  before(:each) do
    @old_book = Book.new('04-09-2009', 'Amazon', 'good')
    @new_book = Book.new('04-09-2021', 'Wood Bridge', 'excellent')
    @bad_book = Book.new('04-09-2022', 'Google', 'bad')
    @label = Label.new('Science fiction', 'White')
  end

  context 'testing the Label class' do
    it 'Should an instance of Label class' do
      expect(@label).to be_an_instance_of Label
    end

    it 'Check title of the label ' do
      expect(@label.title).to eq('Science fiction')
    end

    it 'Check title of the label' do
      expect(@label.color).to eq('White')
    end

    it 'Check labels items' do
      @label.add_item(@old_book)
      @label.add_item(@new_book)
      @label.add_item(@bad_book)
      expect(@label.items.length).to eq(3)
    end
  end
end
