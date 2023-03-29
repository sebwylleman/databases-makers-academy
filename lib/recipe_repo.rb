require_relative "database_connection"
require_relative "recipe"

class RecipeRepo

  def all
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    recipes = []
    result_set.each do |row|
      recipe = Recipe.new
      recipe.id = row['id']
      recipe.names = row['names']
      recipe.cooking_time = row['cooking_time']
      recipe.rating = row['rating']
      recipes << recipe
    end
    return recipes
  end



end
