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

  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    first_entry = result[0]
    recipe = Recipe.new
    recipe.names = first_entry['names']
    recipe.cooking_time = first_entry['cooking_time']
    recipe.rating = first_entry['rating']

    return recipe
  end
end
