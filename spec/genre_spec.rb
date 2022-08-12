require_relative 'spec_helper'

describe Genre do
  before(:each) do
    @music_album = MusicAlbum.new('03-05-2020', 'Afro Congo', on_spotify: true)
    @music_album2 = MusicAlbum.new('24-04-2011', 'Acts Of God', on_spotify: true)
    @genre = Genre.new('Afro')
  end

  context 'Testing the Genre class' do
    it 'Should an instance of Label class' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'Check name of the genre ' do
      expect(@genre.name).to eq('Afro')
    end

    it 'Check genre items' do
      @genre.add_item(@music_album)
      @genre.add_item(@music_album2)
      expect(@genre.items.length).to eq(2)
    end
  end
end
