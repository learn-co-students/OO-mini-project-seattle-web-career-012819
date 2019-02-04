require_relative '../config/environment.rb'

#users
seth = User.new("Seth")
tim = User.new("Tim")
steve = User.new("Steve")

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
seth.add_recipe_card(soup, 'feb', 1)
seth.add_recipe_card(salad, 'mar', 2)
seth.add_recipe_card(burger, 'jan', 4)
seth.add_recipe_card(padthai, 'dec', 3)

tim.add_recipe_card(soup, 'may', 4)
tim.add_recipe_card(salad, 'jul',  5)

steve.add_recipe_card(soup, 'aug', 5)

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
seth.declare_allergen(chicken)
seth.declare_allergen(peanut)
tim.declare_allergen(chicken)
tim.declare_allergen(peanut)



binding.pry
