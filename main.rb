require './app'

class Run
  def initialize
    @run = App.new
  end

  def menu
    choices = ['1 - List all Books',
               '2 - List all Music Albums',
               '3 - List all Games',
               '4 - List all Genres',
               '5 - List all labels',
               '6 - List all Authors',
               '7 - Add a book',
               '8 - Add a music album',
               '9 - Add a game',
               '10 - Exit']

    choices.each { |choice| puts choice.to_s }
  end

  def start_app
    puts 'Welcome to the "Catalog of my things" App!'
    puts "\n"
    puts 'Please choose an option by entering a number: '

    loop do
      menu
      user_choose = gets.chomp.to_i

      if user_choose == 10
        # @run.save_data
        exit
      else
        @run.options(user_choose)
      end
    end
    puts 'Thank you for using the app!'
  end
end

def main
  app = Run.new
  app.start_app
end

main
