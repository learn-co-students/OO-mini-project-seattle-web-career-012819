class User
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select { |card| card.user == self }
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    self.recipes.sort_by { |card| card.rating }.reverse[0..2]
  end

  def most_recent_recipe
    self.recipes.sort_by { |card| card.date }.reverse[0]
  end

  def safe_recipes
    # @allen-woods: cleaned up the syntax in this function
    Recipe.all.select { |recipe| (recipe.allergens & self.allergens.map { |allergen| allergen.ingredient } ).empty? }
  end
end