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

  jess = User.new("Jessica")
  puts jess.name

  jesscard = RecipeCard.new(jess, smores, 8)
  puts jesscard.rating

  puts Recipe.most_popular
  
