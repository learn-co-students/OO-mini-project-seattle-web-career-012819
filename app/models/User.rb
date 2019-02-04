require "pry"

class User
    attr_reader :name
    @@all = []

    def initialize(name)
        @name=name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        (RecipeCard.all.collect do |card|
            if card.user == self
                card.recipe
            end
        end).compact
    end

    def add_recipe_card(recipe)
        RecipeCard.new(self, recipe)
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self
        end
    end

    def detect_allergen(ingredient)
      al = allergens.collect {|element| element.ingredient}
      al.include?(ingredient)
    end

    def is_safe?(recipe)
      !recipe.ingredients.compact.collect {|element| self.detect_allergen(element)}.include?(true)
    end

    def safe_recipes
      saf_reps = []

      Recipe.all.each do |recipe|
        if self.is_safe?(recipe) == true
          saf_reps << recipe
        end
      end
      binding.pry
      saf_reps
    end

    def top_three_recipes
      top3 = []
      arr = RecipeCard.all.collect{|obj| obj}.sort_by {|element| element.rating}


      top3 << arr[0]
      top3 << arr[1]
      top3 << arr[2]
      top3
    end

    # Recipes are added to the end of the array in the order they're
    # created. The last recipe in the array will be the most recent.
    def most_recent_recipe
        recipes.last
    end
end
