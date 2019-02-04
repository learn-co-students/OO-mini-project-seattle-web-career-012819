require_relative '../config/environment.rb'

bacon_wrapped_sausages = Recipe.new("bacon-wrapped sausages")
sausages = Ingredient.new("Lil' Smokey Sausages")
bacon = Ingredient.new("Bacon")
brown_sugar = Ingredient.new("Brown Sugar")

RecipeIngredient.new(bacon_wrapped_sausages, sausages)
RecipeIngredient.new(bacon_wrapped_sausages, bacon)
RecipeIngredient.new(bacon_wrapped_sausages, brown_sugar)

p bacon_wrapped_sausages.name
p sausages.name
p bacon.name
p brown_sugar.name

#binding.pry
