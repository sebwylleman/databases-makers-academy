require "albums_repository"
require "pg"

RSpec.describe AlbumsRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_albums_table
  end

  it "returns two albums" do
    repo = AlbumsRepository.new
    album = repo.all

    expect(album.length).to eq  2
    expect(album[0].title).to eq 'Abbey Road'
    expect(album[0].release_year).to eq '1969'
    expect(album[0].artist_id).to eq '1'
    expect(album[1].title).to eq 'Revolver'
    expect(album[1].release_year).to eq '1966'
    expect(album[1].artist_id).to eq '1'
  end
end