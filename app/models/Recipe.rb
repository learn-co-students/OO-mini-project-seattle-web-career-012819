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


  #users should return the user instances who have recipe cards with this recipe
  def users
    User.all.select do |user|
      user.recipe == self
    end
  end

  #ingredients should return all of the ingredients in this recipe
  def ingredients
    RecipeIngredient.all.select do |i|
      i.recipe == self
    end.map do |x| x.ingredient end
  end

  #allergens should return all of the ingredients in this recipe that are allergens
  def allergens
    self.ingredients.select do |ingredient|
      binding.pry
  end
end

#add_ingredients should take an array of ingredient instances as an argument,
#and associate each of those ingredients with this recipe
  def add_ingredients(ingredients)
    ingredients.each do |item|
      RecipeIngredient.new(self, item)
    end
  end

  def recipe_cards
    RecipeCard.all.select do |card|
      card.recipe == self
    end
  end
  #.most_popular should return the recipe instance with the highest number of users
  #(the recipe that has the most recipe cards)
  def self.most_popular
    tally = Hash.new(0)
    most_count = 0
    most_thing = nil
    RecipeCard.all.each do |card|
      tally[card.recipe] += 1
      if tally[card.recipe] > most_count
      most_count = tally[card.recipe]
      most_thing = card.recipe
    end
  end
    most_thing
end




end # end of class
