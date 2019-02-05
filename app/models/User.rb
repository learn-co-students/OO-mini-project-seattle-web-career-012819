class User

  @@all = []

  def self.all
    @@all
  end

  def recipecards
    RecipeCard.all.select {|recipecard| recipecard.user == self}
  end

  def recipes
    recipecards.map {|recipecard| recipecard.recipe}
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(self, recipe, rating)
  end

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergies
    array = Allergy.all.select {|allergy| allergy.user == self}
    array.map {|allergy| allergy.ingredient}
  end

  def top_three_recipes
    array = recipecards.sort_by {|recipecard| recipecard.rating}
    array = array.map {|recipecard| recipecard.recipe}
    array.last(3)
  end

  def most_recent_recipe
    array = recipecards.sort_by {|recipecard| recipecard.date}
    array = array.map {|recipecard| recipecard.recipe}
    array.last
  end

  def safe_recipes
    array = RecipeIngredient.all.select do |recipeingredient|
      allergies.select do |allergy|
        recipeingredient.ingredient != allergy
      end
    end
    binding.pry
    array.map {|recipeingredient| recipeingredient.recipe}.uniq
  end

end
