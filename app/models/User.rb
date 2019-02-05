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

  def recipes
    RecipeCard.all.collect do |card| #this iterates through the @@all in RecipeCard class
      if card.user == self #does this card = the user instance aka me/self
        card.recipe #then return the cards recipe
      end
    end
  end

##should accept a recipe instance as an argument, as well as a date and rating,
#and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe_instance, date, rating)
    new_recipe_card = RecipeCard.new(date, rating, self, recipe)
  end
  #should accept an ingredient instance as an argument,
  #and create a new allergen instance for this user and the given ingredient
  def declare_allergen(ingredient_instance)
    new_allergen = Allergen.new(self, ingredient_instance) #this creates a new instance of allergen
  end

  #allergens should return all of the ingredients this user is allergic to
  def allergens
    Allergen.all.collect do |a|
      if a.user == self
        a.ingredient
      end
    end
  end

#top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
    RecipeCard.all.select do |card|
      card.user == self
    end
    .sort_by(&:rating).reverse[0,3]
  end

  #most_recent_recipe should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    RecipeCard.all.select do |card|
      card.user == self
    end
    .sort_by(&:date).reverse[0] #sorting by the date and reversing the array to show first element
  end

end # end of class
