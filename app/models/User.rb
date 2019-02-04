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
        RecipeCard.all.collect do |card|
            if card.user == self
                card.recipe
            end
        end
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

    def top_three_recipes
    end

    # Recipes are added to the end of the array in the order they're
    # created. The last recipe in the array will be the most recent.
    def most_recent_recipe
        recipes.last
    end
end