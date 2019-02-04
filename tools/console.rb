require_relative '../config/environment.rb'

bob = User.new("Bob")
steve = User.new("Steve")
john = User.new("John")

deviled_eggs = Recipe.new("Deviled Eggs")
blt = Recipe.new("BLT")
toast = Recipe.new("Toast")
macaroni = Recipe.new("Macaroni")

card1 = RecipeCard.new(deviled_eggs, bob, Time.now, 5)
card2 = RecipeCard.new(blt, bob, Time.now, 3)
card3 = RecipeCard.new(toast, bob, Time.now, 2)
card4 = RecipeCard.new(macaroni, bob, Time.now, 5)
card5 = RecipeCard.new(blt, bob, Time.now, 4)

i1 = Ingredient.new("Paprika")
i2 = Ingredient.new("Egg")
i3 = Ingredient.new("Mustard")
i4 = Ingredient.new("Peanuts")
ri1 = RecipeIngredient.new(deviled_eggs, i1)
r12 = RecipeIngredient.new(deviled_eggs, i2)

b = Ingredient.new("Bacon")
l = Ingredient.new("Lettuce")
t = Ingredient.new("Tomato")

a2 = Allergen.new(i2, steve)
a3 = Allergen.new(i4, john)

binding.pry
