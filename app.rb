require './spec/spec_helper'

class App
  def initialize
    @books = []
    @authors = []
    @albums = []
    @games = []
    @genres = []
    @labels = []
  end

  def run
    create_book
    list_books
  end

  def list_books
    @books.each do |book|
      puts "Publish_date: '#{book.publish_date}', Publisher: #{book.publisher}, State: #{book.cover_state}"
    end
  end

  def create_book
    print 'Publish Date: [DD-MM-YYYY]'
    publish_date = gets.chomp

    print 'Publisher: '
    publisher = gets.chomp.capitalize.to_s

    print 'State: '
    state = gets.chomp.to_s

    book = Book.new(publish_date, publisher, state)
    @books.push(book)
    puts 'Book Created successfully'
    puts
  end
end
