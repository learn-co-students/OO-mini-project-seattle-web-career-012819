require_relative '../config/environment.rb'

i1 = Ingredient.new("Pineapple")
i2 = Ingredient.new("Onion")
i3 = Ingredient.new("Pepperoni")
i4 = Ingredient.new("Black Olives")
i5 = Ingredient.new("Lettuce") #this creates a new ingredient instance that takes in...
#
 r1 = Recipe.new("taco")
 r2 = Recipe.new("PB & J")
 r3 = Recipe.new("pizza") #this creates a new recipe instance that takes in...
#
u1 = User.new("Sharon")
u2 = User.new("Maggie")
u3 = User.new("Jake") #this creates a new user instance that takes in...

a1 = Allergen.new(u2, i3)
a2 = Allergen.new(u1, i1)
a3 = Allergen.new(u3, i2)
a4 = Allergen.new(u2, i2)
a5 = Allergen.new(u2, i2) #this creates a new allergen instance that takes in...

rc1 = RecipeCard.new(5, u1, r1)
rc2 = RecipeCard.new(1, u1, r2)
rc3 = RecipeCard.new(2, u1, r3) #this creates a new recipecard instance that takes in...
rc4 = RecipeCard.new(3, u2, r3)
rc5 = RecipeCard.new(2, u3, r3)
# ri1 = RecipeIngredient.new(r1, i1) #this creates a new RecipeIngredient instance that takes in...


binding.pry
