class Recipe

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def users
    array = RecipeCard.all.select {|recipecard| recipecard.recipe == self}
    array.map {|recipecard| recipecard.user}
  end

  def ingredients
    array = RecipeIngredient.all.select {|recipeingredient| recipeingredient.recipe == self}
    array.map {|recipeingredient| recipeingredient.ingredient}
  end

  def allergies
    array = Allergy.all.select do |allergy|
      ingredients.each do |ingredient|
        allergy.ingredient == ingredient
      end
    end
    array.map {|allergy| allergy.ingredient}
  end

  def add_ingredients(ingredients)
    ingredients.each {|ingredient| RecipeIngredient.new(ingredient, self)}
  end

  def self.most_popular
    array = self.all.sort_by {|recipe| recipe.users.size}
    array.last
  end

end
