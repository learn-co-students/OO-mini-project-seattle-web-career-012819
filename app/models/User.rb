class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select{|recipe_card| recipe_card.user == self}
  end

  def recipe
    self.recipe_cards.collect {|recipe_card| recipe_card.recipe}
  end

  def recipe_ingredients
    self.recipe.collect {|recipe| recipe.recipe_ingredients}
  end

  def ingredients
  
  end

  def add_recipe(name,date,rating)
    x = Recipe.new(name)
    RecipeCard.new(self,x,date,rating)
  end

  def add_recipe_card(recipe,date,rating)
    RecipeCard.new(self,recipe,date,rating)
  end

  def declare_allergen(ingredient)
    Allergy.new(ingredient, self)
  end

  def top_three_recipes
    top_three = self.recipe_cards.sort_by {|obj| obj.rating}
    top_three.last(3)
  end

  def most_recent_recipe
    most_recent = recipe.pop
    most_recent
  end

  def safe_recipes
    #return all recipes that do not contain ingredients that the user is allergic to
  end

end
