require_relative 'albums'
require_relative 'database_connection'


class AlbumsRepository
  
  def all
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []
    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.artist_id = record['artist_id']
      album.title =  record['title']
      album.release_year = record['release_year']

      albums << album
    end
    albums
  end

end