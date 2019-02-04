require_relative '../config/environment.rb'



u1 = User.new("Bob")
u2 = User.new("Billy")
u3 = User.new("Joe")
u4 = User.new("Sue")

r1 = Recipe.new("Soup")
r2 = Recipe.new("Sandwich")
r3 = Recipe.new("Pizza")
r4 = Recipe.new("Cake")

i1 = Ingredient.new("broth")
i2 = Ingredient.new("meat")
i3 = Ingredient.new("cheese")
i4 = Ingredient.new("flour")
i5 = Ingredient.new("eggs")

a1 = Allergy.new(i1,u1)
a2 = Allergy.new(i3,u1)
a3 = Allergy.new(i1,u2)

ri1 = RecipeIngredient.new(r1,i1)
ri2 = RecipeIngredient.new(r1,i2)
ri3 = RecipeIngredient.new(r3,i3)
ri4 = RecipeIngredient.new(r3,i4)
ri5 = RecipeIngredient.new(r4,i5)

rc1 = RecipeCard.new(u1,r1, "Jan 18", 5)
rc2 = RecipeCard.new(u1,r2, "Jan 1", 3)
rc3 = RecipeCard.new(u1,r3, "Feb 2", 1)
rc4 = RecipeCard.new(u1,r4, "Jan 1", 10)




binding.pry
