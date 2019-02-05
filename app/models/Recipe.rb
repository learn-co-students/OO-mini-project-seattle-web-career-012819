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
    all_user = []
    RecipeCard.all.each do |recipecard|
      if recipecard.recipe == self
        all_user << recipecard.user.name
      end
    end
    all_user
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

  def allergens
    #recipe has ingredients, see if any ingredients are allergens
    allergens_array = []
    my_ingredients = ingredients
    Allergen.all.each do |allergen|
      if my_ingredients.include? allergen.ingredient.name
        allergens_array << allergen.ingredient.name
      end
    end
    allergens_array
  end

  def add_ingredient(ingredientList)
    #should take an array of ingredient instances as an argument,
    #and associate each of those ingredients with this recipe
    ingredientList.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end

  end
end
