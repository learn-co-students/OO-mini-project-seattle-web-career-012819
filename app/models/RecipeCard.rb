class RecipeCard
    attr_reader :user, :recipe, :date, :rating
    @@all = []

    def initialize(user, recipe, date="Feb 04", rating = "3")
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating
        @@all << self
    end

    def self.all
        @@all
    end
end
