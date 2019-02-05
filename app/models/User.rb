]class User

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
    #should return all of the user instances
  end

  def recipes
    results = []
    RecipeCard.all.select do |recipecard|
      if recipecard.user == self
        results << recipecard.recipe
      end
    end
    results

    #should return all of the recipes this user has recipe cards for
  end

  def add_recipe_card(recipe)
    RecipeCard.new(self,recipe)
    #should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  end

  def declare_allergen(ingredient)
    allergen = Allergen.new(self,ingredient)
    #should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  end

  def allergens
    Allergen.all.collect do |allergen|
      if allergen.user == self
        allergen.ingredient
      end
    end
    #should return all of the ingredients this user is allergic to

  end

  def top_three_recipes
    self.recipes.sort_by(:rating).last(3)

    #should return the top three highest rated recipes for this user.
  end 

  def most_recent_recipe
    most_recent = nil
    RecipeCard.all.each do |card|
     if card.user == self
        if most_recent == nil
          most_recent = card
        elsif card.date > most_recent.date
          most_recent = card
        end
      end
    end
    return most_recent.recipe

    #should return the recipe most recently added to the user's cookbook.
  end

  #def safe_recipes
  #  safe = []
   # self.recipes.each do |recipe|
    #  is_safe = true
     # recipe.ingredients.each do |ingredient|
      #  if self.allergens.include? ingredient
       #   is_safe = false
        #end
      #end

      #if is_safe
      #  safe << recipe
      #end
    #end
    #safe
  #end

end
