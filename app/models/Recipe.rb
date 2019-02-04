class Recipe
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredients
    all_ingredients = []
    RecipeIngredient.all.each do |recingred|
      if (recingred.recipe == self)
        all_ingredients << recingred.ingredient.name
      end
    end
    all_ingredients
  end

  def users

  end

  def self.most_popular
    numEachRecipe = Hash.new(0)
    RecipeCard.all.each do |card|
      if numEachRecipe.include? card.recipe.name
        numEachRecipe[card.recipe.name] +=1
      else
        numEachRecipe[card.recipe.name] = 1
      end
    end

    numEachRecipe.key(numEachRecipe.values.max)
  end
end
