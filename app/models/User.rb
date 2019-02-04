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
    RecipeCard.all.select {|card| card if card.user == self}
  end

  def recipes
    self.recipe_cards.map {|card| card.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergenslist
    Allergen.all.select {|allergen| allergen.user == self}
  end

  def allergens
    self.allergenslist.map {|allergen| allergen.ingredient}
  end

  def most_recent_recipe
    self.recipe_cards.max_by {|card| card.date}.recipe  #For real DateTime instances, use self.recipe_cards.sort! { |a,b|  DateTime.parse(a['date']) <=> DateTime.parse(b['date']) }
  end

  def top_three_recipes
    best = recipe_cards.sort {|card| card.rating}[-3..-1]
    best.map{|card| card.recipe.name}
  end

  def safe_recipes
    recipe_cards.map do |card|
      card.recipe unless card.recipe.allergens == true
    end
  end

end
