class Recipe
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
    RecipeCard.all.select{|recipe_card| recipe_card.recipe == self}
  end

  def users
    self.recipe_cards.collect {|recipe_card| recipe_card.user}
  end

  def recipe_ingredients
    RecipeIngredient.all.select {|recipe_ingredient| recipe_ingredient.recipe == self}
  end

  def ingredients
    self.recipe_ingredients.collect {|recipe_ingredient| recipe_ingredient.ingredient}
  end

  def allergy_ingredients
    Allergy.all.collect {|allergy_object| allergy_object.ingredient}
  end

  def allergen
    allergies = []
    self.allergy_ingredients.each do |ingredient|
      if self.ingredients.include? (ingredient)
        allergies << ingredient
      end
    end
    return allergies.uniq
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(ingredient,self)
    end
  end

  def self.most_popular
    count = 0
    array = []
    @@all.each do |recipe|
      if recipe.users.count > count
        count = recipe.users.count
        array << recipe
      end
    end
    array.pop
  end

end
