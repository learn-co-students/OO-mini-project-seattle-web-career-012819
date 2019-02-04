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

    def most_popular
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
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            @ingredients << ingredient
        end
    end
end