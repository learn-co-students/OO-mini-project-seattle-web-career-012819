require 'date'

class RecipeCard
    attr_reader :user, :recipe, :rating, :date
    @@all = []

    # rating should be an integer between 1-10
    def initialize(user, recipe, rating)
        @user = user
        @recipe = recipe
        @rating = rating
        @date = DateTime.now
        @@all << self
    end

    def self.all
        @@all
    end
end