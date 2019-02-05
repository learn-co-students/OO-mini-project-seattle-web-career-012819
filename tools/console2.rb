require_relative '../config/environment.rb'
#recipes Smores

  #ingredients------
  #graham cracker
  #chocolate
  #marshmellow

  grahamCracker = Ingredient.new("Graham Cracker")
  chocolate = Ingredient.new("Chocolate")
  marshmellow = Ingredient.new("Marshmellow")
  banana = Ingredient.new("Banana")

  smores = Recipe.new("S'mores")
  bananasmores = Recipe.new("Banana S'mores")

  smoresIngredient1 = RecipeIngredient.new(smores, grahamCracker)
  smoresIngredient2 = RecipeIngredient.new(smores, chocolate)
  smoresIngredient3 = RecipeIngredient.new(smores, marshmellow)

  banSmoreIngred1 = RecipeIngredient.new(bananasmores, grahamCracker)
  banSmoreIngred2 = RecipeIngredient.new(bananasmores, chocolate)
  banSmoreIngred3 = RecipeIngredient.new(bananasmores, marshmellow)
  banSmoreIngred4 = RecipeIngredient.new(bananasmores, banana)

  puts grahamCracker.name
  puts smores.name


  puts "Smores Ingredients!"
  puts smores.ingredients


#recipe Stir Fry
  veggies = Ingredient.new("Veggies")
  beef = Ingredient.new("Beef")

  stirFry = Recipe.new("Stir Fry")

  #stirFry1 = RecipeIngredient.new(stirFry, veggies)
  #stirFry2 = RecipeIngredient.new(stirFry, beef)
  stirFry.add_ingredient([veggies, beef])

  puts "Stir Fry Ingredients!"
  puts stirFry.ingredients

#test user
  jess = User.new("Jessica")
  chris = User.new("Chris")
  #puts jess.name

#test RecipeCard
  #jessSmorescard = RecipeCard.new(jess, smores, "10/02/1996", 8)
  #jessStircard = RecipeCard.new(jess, stirFry, "03/11/2014", 6)
  #chrisStircard = RecipeCard.new(chris, stirFry, "09/09/09", 9)

  jess.add_recipe_card(smores, "10/02/1996", 9)
  jess.add_recipe_card(stirFry, "08/11/2014", 8)
  jess.add_recipe_card(bananasmores, "06/02/1998", 7)
  chris.add_recipe_card(stirFry, "09/09/09", 9)
  #puts jesscard.rating

  puts "most_popular"
  puts Recipe.most_popular

  puts "users for recipe"
  puts stirFry.users


  #test Allergy
  #jessVeggieAllergen = Allergen.new(jess, veggies)
  jess.declare_allergen(veggies)

  puts "first allergy ingredient"
  puts Allergen.all.first.ingredient.name

  puts "stirfry allergens"
  puts stirFry.allergens

  puts "Jessica allergens"
  puts jess.allergens

  puts "Jessica top 3 recipe"
  jess.top_three_recipes.each do |recipe|
    puts "#{recipe.recipe.name} added #{recipe.rating}"
  end

  puts "jess most recent recipe"
  puts jess.most_recent_recipe.recipe.name
