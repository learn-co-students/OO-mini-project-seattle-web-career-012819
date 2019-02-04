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

  def users
    RecipeCard.all.map {|card| card.user if card.recipe == self}.compact
  end

  def allergens
    allerlist = Allergen.ingredients.select do |ingredient|
      ingredient if self.ingredients.include?(ingredient)
    end
    allerlist.any? ? allerlist : "There are no allergens in the recipe for #{self.name}. You're ready to go!"
  end

  def ingredients
    RecipeIngredient.all.map {|ingredient| ingredient.ingredient if ingredient.recipe == self}.compact
  end

  def add_ingredients(arr)
    arr.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end

  def self.most_popular
    sortedlist = self.all.sort_by {|recipe| recipe.users.size}
    sortedlist.last
  end

end
