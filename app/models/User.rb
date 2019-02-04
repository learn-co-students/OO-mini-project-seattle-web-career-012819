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
        Allergen.all.collect do |allergen|
            if allergen.user == self
                allergen.ingredient
            end
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

    def safe_recipes
        safe = []
        self.recipes.each do |recipe|
            is_safe = true
            # check each ingredient to see if there are any allergies
            recipe.ingredients.each do |ingredient|
                if self.allergens.include? ingredient
                    is_safe = false
                end
            end

            if is_safe
                safe << recipe
            end
        end
        safe
    end
end