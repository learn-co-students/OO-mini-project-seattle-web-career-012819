class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    user_recipes = []
    RecipeCard.all.each do |recipecard|
      if recipecard.user == self
        user_recipes << recipecard.recipe.name
      end
    end
    user_recipes
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    allergy_array = []
    Allergen.all.each do |allergy|
      if allergy.user == self
        allergy_array << allergy.ingredient.name
      end
    end
    allergy_array
  end

  def top_three_recipes()
    my_recipes = []
    RecipeCard.all.each do |recipecard|
      if recipecard.user == self
        my_recipes << recipecard
      end
    end
    sorted_recipes = my_recipes.sort_by {|recipe| recipe.rating}

    (sorted_recipes[0, 3]).reverse
  end

  def most_recent_recipe()
    my_recipes = recipes
    #insert sort by date
  end

end
