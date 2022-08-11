require_relative 'spec_helper'

describe Author do
  before(:each) do
    @author1 = Author.new('EA', 'Sports')
    @fifa = Game.new('02-04-2011', 'yes', '05-03-2019')
    @nba = Game.new('20-11-2020', 'no', '20-07-2022')
  end

  context 'Testing the Author class' do
    it 'Should an instance of Author class' do
      expect(@author1).to be_an_instance_of Author
    end

    it 'Check first name of the author ' do
      expect(@author1.first_name).to eq('EA')
    end

    it 'Check last name of the author ' do
      expect(@author1.last_name).to eq('Sports')
    end

    it 'Check author items' do
      @author1.add_item(@fifa)
      @author1.add_item(@nba)
      expect(@author1.items.size).to eq(2)
    end
  end
end
