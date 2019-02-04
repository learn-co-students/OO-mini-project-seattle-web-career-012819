class Recipe
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    # @allen-woods: cleaned up the syntax in this function
    recipe_hash = {}
    RecipeCard.all.map { |card| card.recipe }.each { |recipe| !recipe_hash[recipe] ? recipe_hash[recipe] = 1 : recipe_hash[recipe] += 1 }
    recipe_hash.keys.sort_by { |key| recipe_hash[key] }.last
  end

  def users
    RecipeCard.all.select { |recipe_card| recipe_card.recipe == self }.map { |card| card.user }
  end

  def ingredients
    RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }.map { |recipe| recipe.ingredient }
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end

  def allergens
    # @allen-woods: cleaned up the syntax in this function
    Allergen.all.map { |allergen| allergen.ingredient }.select { |allergen| self.ingreditions.include?(allergen) }.uniq
  end
end