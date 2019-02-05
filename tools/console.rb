require_relative '../config/environment.rb'


#create users
sarah = User.new("sarah")
jonah = User.new("jonah")
brad = User.new("brad")

#create recipes
banana_bread = Recipe.new("banana bread")
chocolate_cake = Recipe.new("chocolate cake")
fruit_medly = Recipe.new("fruit medly")
scrambled_eggs = Recipe.new("scrambled eggs")

#create ingredients
bananas = Ingredient.new("bananas")
flour = Ingredient.new("flour")
chocolate = Ingredient.new("chocolate")
eggs = Ingredient.new("eggs")
milk = Ingredient.new("milk")

#create allergen joiners
Allergen.new(brad, chocolate)
Allergen.new(sarah, bananas)
Allergen.new(jonah, flour)
Allergen.new(brad, flour)
Allergen.new(jonah, chocolate)
Allergen.new(sarah, chocolate)

#create recipe card joiners
RecipeCard.new(brad, banana_bread, "052118", 5)
RecipeCard.new(sarah, fruit_medly, "048218", 2)
RecipeCard.new(jonah, chocolate_cake, "082792", 9)
RecipeCard.new(sarah, chocolate_cake, "018471", 6)
RecipeCard.new(brad, fruit_medly, "052118", 0)
RecipeCard.new(brad, chocolate_cake, "031118", 2)
RecipeCard.new(brad, scrambled_eggs, "072465", 9)

#create recipe ingredient joiners
RecipeIngredient.new(bananas, banana_bread)
RecipeIngredient.new(flour, banana_bread)
RecipeIngredient.new(chocolate, chocolate_cake)
RecipeIngredient.new(flour, chocolate_cake)
RecipeIngredient.new(bananas, fruit_medly)
RecipeIngredient.new(milk, scrambled_eggs)
RecipeIngredient.new(eggs, scrambled_eggs)


binding.pry


