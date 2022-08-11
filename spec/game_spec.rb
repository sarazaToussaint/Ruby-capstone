require_relative 'spec_helper'

describe Game do
  before(:each) do
    @fifa = Game.new('02-04-2011', 'yes', '05-03-2019')
    @nba = Game.new('20-11-2020', 'no', '20-07-2022')
  end

  context 'testing the game class' do
    it 'Should an instance of Game class' do
      expect(@fifa).to be_an_instance_of Game
    end

    it 'Should can_be_archieved equal to true' do
      expect(@fifa.can_be_archived?).to eq(true)
    end

    it 'Should can_be_archieved equal to false' do
      expect(@nba.can_be_archived?).to eq(false)
    end
  end
end
