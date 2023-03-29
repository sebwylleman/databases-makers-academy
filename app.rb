require_relative 'lib/database_connection'
require 'tty-table'  #to format as a table
require_relative 'lib/recipe_repo'

DatabaseConnection.connect('recipes_directory')

sql = 'SELECT * FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

# Create a table with headers
headers = ['ID', 'Name', 'Cooking Time', 'Rating']

# Create an array of rows using the result set
rows = result.map do |record|
  [record['id'], record['names'], record['cooking_time'], record['rating']]
end

# Create the table with headers and rows
table = TTY::Table.new(headers, rows)

# Render the table and print it
puts table.render(:ascii)


puts "Indivdual value for first recipe: "
repo = RecipeRepo.new

entry = repo.find(1)
puts "recipe: #{entry.names}"
puts "cooking time: #{entry.cooking_time}"
puts "rating: #{entry.rating}"

