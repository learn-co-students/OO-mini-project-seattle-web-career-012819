require_relative '../config/environment.rb'

hamburger = Recipe.new("Hamburger")
bad_sandwich = Recipe.new("Bad_Sandwich)

beef = Ingredient.new("Beef")
wheat = Ingredient.new("Wheat")
lettuce = Ingredient.new("Lettuce")


puts hamburger.name
puts beef.name
puts

RecipeIngredient.new(hamburger, beef)
RecipeIngredient.new(hamburger, wheat)
RecipeIngredient.new(hamburger, lettuce)

pat = User.new("Pat")
terri = User.new("Terri")

RecipeCard.new(terri,hamburger)
RecipeCard.new(pat,hamburger,8)
RecipeCard.new(pat,bad_sandwich)

RecipeIngredient.new(bad_sandwich, lettuce)
RecipeIngredient.new(bad_sandwich, wheat)


puts RecipeIngredient.all
puts

hamburger.ingredients.each do |ingredient|
  puts ingredient.name
end

#binding.pry
