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

  def self.most_popular
    tally = Hash.new(0)
    most_count = 0
    most_thing = nil
    RecipeCard.all.each do |card|
      tally[card.recipe] += 1
      if tally[card.recipe] > most_count
        most_thing = card.recipe
      end
    end
    most_thing
    #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  end

  def users
    RecipeCard.all.collect do |recipecard|
      if recipecard.recipe == self
        card.user
      end
    end
    #should return the user instances who have recipe cards with this recipe
  end

  def ingredients
    RecipeIngredient.all.collect do |recipe_ingredient|
      if recipe_ingredient.recipe == self
        recipe_ingredient.ingredient
      end
    end
    #should return all of the ingredients in this recipe
  end

  def allergens
    Allergen.all.collect do |allergen|
      if ingredients.include? allergen.ingredient
        allergen.ingredient
      end
    end
    #should return all of the ingredients in this recipe that are allergens
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each.do |ingredient|
      @ingredients << ingredient
    end
  end
    #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
end
