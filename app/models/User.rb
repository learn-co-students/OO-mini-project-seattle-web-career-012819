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
        results = []
        RecipeCard.all.each do |card|
            if card.user == self
                results << card.recipe
            end
        end
        results
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
        self.recipes.sort_by(:rating).last(3)
    end

    # sort the recipes by their date so the most
    # recent is the last in the array
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
    end
end