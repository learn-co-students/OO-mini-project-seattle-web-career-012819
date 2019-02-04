class RecipeCard
  attr_accessor :rating
  attr_reader :user, :recipe, :date
  @@all = []

  def initialize(user, recipe, date, rating)
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
