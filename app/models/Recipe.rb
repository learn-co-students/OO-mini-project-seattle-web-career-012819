class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select { |recipe_card| recipe_card.recipe == self}
  end

  def users
    self.recipe_cards.map { |recipe_card| recipe_card.user }
  end

  def ingredients
    self.recipe_ingredients.map { |recipe_ingredient| recipe_ingredient.ingredient}
  end

  def recipe_ingredients
    RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
  end

  def self.most_popular
     @@all.sort_by { |recipe| recipe.users.length}.last
     #@@all.last
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each { |ingredient| RecipeIngredient.new(ingredient, self) }
  end



end