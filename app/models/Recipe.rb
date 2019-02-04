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
    end

    def ingredients
    end

    def allergens
        @ingredients.select do |ingredient|
            ingredient.is_allergen
        end
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            @ingredients << ingredient
        end
    end
end