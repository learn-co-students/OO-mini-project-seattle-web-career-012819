class Ingredient


  attr_accessor :name

  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def self.all
    @@all
  end

  def recipe_ingredients
    RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.ingredient == self}
  end

  def allergens
    Allergen.all.select { |allergen| allergen.ingredient == self }
  end

  def recipes
    self.recipe_ingredients.map { |recipe_ingredient| recipe_ingredient.recipe}
  end

  def users
    self.allergens.map { |allergen| allergen.user }
  end

  #Ingredient.most_common_allergen

  def self.most_common_allergen
    @@all.sort_by { |ingredient| ingredient.users.size}.reverse[0].name
  end

  #example
    #user_recipes = self.recipe_cards.sort_by{ |recipe_card| recipe_card.rating}.reverse
end
