require_relative '../config/environment.rb'

# Bacon- Wrapped Sausages
sausages = Ingredient.new("Lil' Smokey Sausages")
bacon = Ingredient.new("Bacon")
brown_sugar = Ingredient.new("Brown Sugar")

bacon_wrapped_sausages = Recipe.new("bacon-wrapped sausages")
RecipeIngredient.new(bacon_wrapped_sausages, sausages)
RecipeIngredient.new(bacon_wrapped_sausages, bacon)
RecipeIngredient.new(bacon_wrapped_sausages, brown_sugar)

# Peanut Butter Sandwich
peanut_butter = Ingredient.new("Peanute Butter")
bread = Ingredient.new("Whole Wheat Bread")

sandwich = Recipe.new("Peanut Butter Sandwich")
RecipeIngredient.new(sandwich, peanut_butter)
RecipeIngredient.new(sandwich, bread)

# Popcorn Balls
popcorn = Ingredient.new("Popcorn")
butter = Ingredient.new("Butter")
marshmallows = Ingredient.new("Marshmallows")

popcorn_balls = Recipe.new("Popcorn Balls")
RecipeIngredient.new(popcorn_balls, popcorn)
RecipeIngredient.new(popcorn_balls, butter)
RecipeIngredient.new(popcorn_balls, marshmallows)

# Chicken Wings
chicken_wings = Ingredient.new("Chicken Wings")
flour = Ingredient.new("Flour")
hot_sauce = Ingredient.new("Frank's Hot Sauce")

wings_recipe = Recipe.new("Chicken Wings")
RecipeIngredient.new(wings_recipe, chicken_wings)
RecipeIngredient.new(wings_recipe, flour)
RecipeIngredient.new(wings_recipe, hot_sauce)

# Users
steve = User.new("Steve")
RecipeCard.new(steve, bacon_wrapped_sausages, 9)
RecipeCard.new(steve, sandwich, 3)
RecipeCard.new(steve, popcorn_balls, 10)
RecipeCard.new(steve, wings_recipe, 8)

grandpa = User.new("Grandpa")
grandpa.declare_allergen(bread)
RecipeCard.new(grandpa, popcorn_balls, 7)
RecipeCard.new(grandpa, sandwich, 1)

# basic access tests
puts bacon_wrapped_sausages.name
puts sausages.name
puts bacon.name
puts brown_sugar.name
puts
puts "Grandpa is allergic to bread"
puts grandpa.name
puts grandpa.allergens.first.name
puts
puts "Steve's most recent recipe is the wings recipe"
puts steve.most_recent_recipe == wings_recipe
puts steve.most_recent_recipe.name
puts
puts "Steve has four recipes"
puts steve.recipes.length == 4
puts
steve.recipes.each do |recipe|
    puts "   Recipe: #{recipe.name}"
    puts "Allergens: #{recipe.allergens}"
end
puts
puts "Most popular recipe: #{Recipe.most_popular.name}"
puts "Most common allergen: #{Ingredient.most_common_allergen.name}"
puts
puts "Grandpa's safe recipes should not include a sandwich"
grandpa.safe_recipes.each do |recipe|
    puts recipe.name
end

#binding.pry
