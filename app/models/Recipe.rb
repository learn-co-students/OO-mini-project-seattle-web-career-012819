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
        count = Hash.new(0)
        most_count = 0
        most_recipe = nil
        RecipeCard.all.each do |card|
            count[card.recipe] += 1
            if count[card.recipe] > most_count
                most_recipe = card.recipe
            end
        end
        most_recipe
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
        Allergen.all.collect do |allergen|
            if ingredients.include? allergen.ingredient
                allergen.ingredient
            end
        end
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            @ingredients << ingredient
        end
    end
end