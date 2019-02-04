class RecipeCard
    attr_reader :user, :recipe
    @@all = []

    def initialize(user, recipe)
        @user = user
        @recipe = recipe
        @@all << self
    end

    def self.all
        @@all
    end
end