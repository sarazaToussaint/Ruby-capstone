require './spec/spec_helper'
require './modules/preserve_data'

# rubocop:disable  Metrics/ClassLength
class App
  include PreserveData

  def initialize
    @books = []
    @authors = []
    @albums = []
    @games = []
    @genres = []
    @labels = []
    load_all_data
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options(input)
    case input
    when 1
      list_books
    when 2
      list_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      create_book
    when 8
      add_album
    when 9
      add_game
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def list_books
    @books.each do |book|
      puts "Publish_date: '#{book.publish_date}', Publisher: #{book.publisher}, State: #{book.cover_state}"
    end
  end

  def list_games
    @games.each do |game|
      puts "Publish_date: '#{game.publish_date}', Multiplayer: #{game.multiplayer}, Last played: #{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "First name: '#{author.first_name}', Last name: '#{author.last_name}'"
    end
  end

  def list_labels
    @labels.each do |label|
      puts " ID: '#{label.id}' - Title: '#{label.title}', Cover color: '#{label.color}'"
    end
  end

  def list_albums
    @albums.each do |album|
      puts "Published at: '#{album.publish_date}', Name: '#{album.name}', On Spotify: '#{album.on_spotify}'"
    end
  end

  def list_genres
    @genres.each do |genre|
      puts "ID: '#{genre.id}', Name: '#{genre.name}'"
    end
  end

  def create_book
    print 'Publish Date: [YYYY-MM-DD] '
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

  def add_game
    print 'Publish Date: [YYYY-MM-DD] '
    publish_date = gets.chomp

    print 'Multiplayer: Y/N '
    multiplayer = gets.chomp.capitalize.to_s
    case multiplayer
    when 'Y'
      multi = 'YES'
    when 'N'
      multi = 'NO'
    else
      puts 'Please add Y or N '
      multi = gets.chomp.capitalize.to_s
    end

    print 'Last Played at: [YYYY-MM-DD] '
    last_played_at = gets.chomp

    game = Game.new(publish_date, multi, last_played_at)
    @games.push(game)

    puts 'Game Created successfully'
    puts
  end

  def add_author
    print 'First name: '
    first_name = gets.chomp.capitalize.to_s

    print 'Last name: '
    last_name = gets.chomp.capitalize.to_s

    author = Author.new(first_name, last_name)
    @authors.push(author)

    puts 'Author Created successfully'
    puts
  end

  def add_label
    print 'Title: '
    title = gets.chomp.capitalize.to_s

    print 'Color: '
    color = gets.chomp.capitalize.to_s

    label = Label.new(title, color)
    @labels.push(label)

    puts 'Label Created successfully'
    puts
  end

  def add_album
    print 'Publish Date: [YYYY-MM-DD] '
    publish_date = gets.chomp

    print 'Name: '
    name = gets.chomp.capitalize.to_s

    print 'Is the album on spotfiy? (Y/N) '
    spotify = gets.chomp.upcase
    case spotify
    when 'Y'
      spotify = true
    when 'N'
      spotify = false
    else
      print 'Please enter Y for Yes or N for No: '
      spotify = gets.chomp.upcase
    end

    album = MusicAlbum.new(publish_date, name, on_spotify: spotify)
    @albums.push(album)

    puts 'Album Created successfully'
    puts
  end

  def add_genre
    print 'Name: '
    name = gets.chomp

    genre = Genre.new(name)
    @genres.push(genre)

    puts 'Genre Created successfully'
    puts
  end

  def save_all_data
    books = []
    games = []

    @books.each do |book|
      books.push({ publish_date: book.publish_date, publisher: book.publisher, state: book.cover_state })
    end
    save_data(books, 'books')

    @games.each do |game|
      games.push({ publish_date: game.publish_date, muliplayer: game.multiplayer, last_played: game.last_played_at })
    end
    save_data(games, 'games')
  end

  def load_all_data
    books = load_data('books')
    books.each do |book|
      @books.push(Book.new(book['publish_date'], book['publisher'], book['state']))
    end

    games = load_data('games')
    games.each do |game|
      @games.push(Game.new(game['publish_date'], game['muliplayer'], game['last_played']))
    end
  end
end
# rubocop:enable  Metrics/ClassLength
