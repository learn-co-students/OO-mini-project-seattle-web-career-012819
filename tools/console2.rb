require_relative '../config/environment.rb'
#recipes Smores

  #ingredients------
  #graham cracker
  #chocolate
  #marshmellow

  grahamCracker = Ingredient.new("Graham Cracker")
  chocolate = Ingredient.new("Chocolate")
  marshmellow = Ingredient.new("Marshmellow")

  smores = Recipe.new("S'mores")

  smoresIngredient1 = RecipeIngredient.new(smores, grahamCracker)
  smoresIngredient2 = RecipeIngredient.new(smores, chocolate)
  smoresIngredient3 = RecipeIngredient.new(smores, marshmellow)

  puts grahamCracker.name
  puts smores.name


  puts "Smores Ingredients!"
  puts smores.ingredients

#test user
  jess = User.new("Jessica")
  puts jess.name

#test RecipeCard
  jesscard = RecipeCard.new(jess, smores, 8)
  puts jesscard.rating

  puts "most most_popular"
  puts Recipe.most_popular

  puts "users for recipe"
  puts smores.users


  #test Allergy
  veggies = Ingredient.new("Veggies")
  jessVeggieAllergen = Allergen.new(jess, veggies)
  puts "first allergy ingredient"
  puts Allergen.all.first.ingredient.name
