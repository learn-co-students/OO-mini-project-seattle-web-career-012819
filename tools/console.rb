require_relative '../config/environment.rb'

#users
josh = User.new("Josh")
arturo = User.new("Arturo")
letian = User.new("LeTian")

#ingredients
beef = Ingredient.new("beef") #specialburger, soup
carrot = Ingredient.new("carrot")#soup, salad
celery = Ingredient.new("celery")#soup
onion = Ingredient.new("onion")#specialburger, soup, chicken alfredo
chicken = Ingredient.new("chicken")#padthai
thousandisland = Ingredient.new("Thousand Island Dressing")
peanut = Ingredient.new("Peanut")
lettuce = Ingredient.new("lettuce")

#recipes
soup = Recipe.new("Beef Stew")
burger = Recipe.new("Special Burger")
padthai = Recipe.new("Pad Thai")
salad = Recipe.new("Salad")


#card creation
josh.add_recipe_card(soup, 'feb', 1)
josh.add_recipe_card(salad, 'mar', 2)
josh.add_recipe_card(burger, 'jan', 4)
josh.add_recipe_card(padthai, 'dec', 3)

arturo.add_recipe_card(soup, 'may', 4)
arturo.add_recipe_card(salad, 'jul',  5)

letian.add_recipe_card(soup, 'aug', 5)

#specialburger
RecipeIngredient.new(beef, burger)
RecipeIngredient.new(onion, burger)
RecipeIngredient.new(thousandisland, burger)

#soup
RecipeIngredient.new(beef, soup)
RecipeIngredient.new(carrot, soup)
RecipeIngredient.new(celery, soup)

#salad
RecipeIngredient.new(lettuce, salad)
RecipeIngredient.new(carrot, salad)

#padthai
RecipeIngredient.new(peanut, padthai)
RecipeIngredient.new(chicken, padthai)
RecipeIngredient.new(onion, padthai)

#Allergies
josh.declare_allergen(chicken)
josh.declare_allergen(peanut)
arturo.declare_allergen(chicken)
arturo.declare_allergen(peanut)



binding.pry
