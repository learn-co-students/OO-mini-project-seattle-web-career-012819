class RecipeCard

  attr_reader :user, :recipe, :rating
  @@all = []

  def initialize(user, recipe, num)
    @user = user
    @recipe = recipe
    @rating = num

    @@all << self
  end

  def self.all
    @@all
  end


end
