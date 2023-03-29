require "recipe_repo"
require "pg"

RSpec.describe RecipeRepo do

  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipes_table
  end

  it "returns a list of all recipes" do
    repo = RecipeRepo.new
    recipes = repo.all

    expect(recipes.length).to eq 4
    expect(recipes.first.names).to eq 'Spaghetti Bolognese'
    expect(recipes.first.cooking_time).to eq '45' # this might not work, perhaps change to int
    expect(recipes.first.id).to eq '1'
    expect(recipes.first.rating).to eq '5'


    expect(recipes.length).to eq 4
    expect(recipes.last.names).to eq 'Grilled Salmon'
    expect(recipes.last.cooking_time).to eq '25' # this might not work, perhaps change to int
    expect(recipes.last.id).to eq '4'
    expect(recipes.first.rating).to eq '5'

  end

  it "returns a single recipe value from the first row" do
    repo = RecipeRepo.new
    recipes = repo.find('1')

    expect(recipes.names).to eq 'Spaghetti Bolognese'
    expect(recipes.cooking_time).to eq '45'
    expect(recipes.rating).to eq '5'

  end

end