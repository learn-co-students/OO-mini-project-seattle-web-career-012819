require_relative '../config/environment.rb'

u1 = User.new
u2 = User.new
u3 = User.new

i1 = Ingredient.new
i2 = Ingredient.new
i3 = Ingredient.new

r1 = Recipe.new
r2 = Recipe.new
r3 = Recipe.new

ri1 = RecipeIngredient.new(i1, r1)
ri2 = RecipeIngredient.new(i2, r2)
ri3 = RecipeIngredient.new(i3, r3)

rc1 = RecipeCard.new(u1, r1, 5)
rc2 = RecipeCard.new(u2, r2, 4)
rc3 = RecipeCard.new(u3, r3, 4)

a1 = Allergy.new(u1, i2)

binding.pry
