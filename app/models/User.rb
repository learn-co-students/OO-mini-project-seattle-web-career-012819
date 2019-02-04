class User
  attr_reader :name, :allergens
  @@all =[]
  def initialize(name)
    @name = name
    @allergens = []
    @@all << self
  end

  def recipe_cards
    user_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    self.recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    @allergens << Allergen.new(ingredient)
  end

  def top_three_recipes
    ranked_recipes_cards = self.recipe_cards.sort_by { |recipe_card| recipe_card.rating }
    ranked_recipes_cards.reverse!
    ranked_recipes_cards.slice(0..2)
    ranked_recipes_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def most_recent_recipe
    most_recent_recipe_card = self.recipe_cards.max_by do |recipe_card|
      recipe_card.date
    end
    most_recent_recipe_card.recipe
  end

  def self.all
    @@all
  end
end #end of class
