require_relative 'spec_helper'

describe Music_Album do
  context 'Music_Album class' do
    before :each do
      @album = Music_Album.new( '03-05-2020', 'Afro Congo', on_spotify: true)
      @second_album = Music_Album.new('24-09-2020', 'Acts Of God', on_spotify: false)
    end

    it 'should be an instance of Music Album class: ' do
      expect(@album).to be_instance_of Music_Album
    end

    it 'should display correct name' do
      expect(@album.name).to eq('Afro Congo')
    end

    it 'should not archive if not older than 10 years' do
      expect(@album.can_be_archived?).to eq(false)
    end

    it 'should not archive if not older than 10 years' do
      expect(@second_album.can_be_archived?).to eq(false)
    end
  end
end