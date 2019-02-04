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
        Allergen.select do |allergen|
            allergen.user == self
        end
    end

    def top_three_recipes
    end

    def most_recent_recipe
    end
end