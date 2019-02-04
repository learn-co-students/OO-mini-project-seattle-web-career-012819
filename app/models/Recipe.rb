require "pry"

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

    def self.most_popular
      #get array of names
      arr = RecipeCard.all.collect {|element| element.recipe.name}
      #get frequency of names
      freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      #get most frequent name
      recipe_name = arr.max_by { |v| freq[v] }
      #get recipe object with said name
      self.all.find {|element| element.name == recipe_name}
    end

    def users
        # iterate through all the cards and collect a list of
        # users that have a card with this recipe
        RecipeCard.all.collect do |card|
            if card.recipe == self
                card.user
            end
        end
    end

    def ingredients
        RecipeIngredient.all.collect do |ingredient|
            if ingredient.recipe == self
                ingredient.ingredient
            end
        end
    end

    def allergens
      known_allergens = []
      #get all RecipleIngredients associated with this recipe
      ri = RecipeIngredient.all.select {|element| element.recipe == self}
      #get individual ingredients
      ingreds = ri.collect {|element| element.ingredient}
      #get list of allergens
      als = Allergen.all.collect {|element| element.ingredient.name}

      #test ingredients against list of allergens
      ingreds.each do |ingredient|
        if als.include?(ingredient.name)
          known_allergens << ingredient.name
        end
      end
      known_allergens
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            @ingredients << ingredient
        end
    end
end
