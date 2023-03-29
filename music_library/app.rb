# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/albums_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

album_repository = AlbumsRepository.new

# album_repository.all.each do |album|
#   p album
# end

entry = album_repository.find(1)
puts entry.title
puts entry.release_year