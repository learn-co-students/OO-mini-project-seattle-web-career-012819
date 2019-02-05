class User

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
    RecipeCard.all.select { |recipe_card| recipe_card.user == self}
  end

  def allergens
    Allergen.all.select { |allergen| allergen.user == self }
  end

  def recipes
    self.recipe_cards.map { |recipe_card| recipe_card.recipe }
  end

  def ingredients
    self.allergens.map { |recipe_card| recipe_card.ingredient}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  #declare_allergen should accept an ingredient instance as an argument,
  #and create a new allergen instance for this user and the given ingredient

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  #User#allergens should return all of the ingredients this user is allergic to
  #User#top_three_recipes should return the top three highest rated recipes for this user.

  def top_three_recipes
    user_recipes = self.recipe_cards.sort_by{ |recipe_card| recipe_card.rating}.last(3)
    #user_recipes = user_recipes[0..2]
    user_recipes.map { |recipe_card| recipe_card.recipe.name}
  end

  #most_recent_recipe should return
  #the recipe most recently added to the user's cookbook.

  def most_recent_recipe
    self.recipe_cards.last.recipe.name
  end


end



