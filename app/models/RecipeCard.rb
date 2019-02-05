class RecipeCard
  attr_accessor :user, :recipe, :rating, :date

  @@all = []

  def initialize(user, recipe, rating)
    @user = user
    @recipe = recipe
    @rating = rating
    @date = Time.now.to_s[0..9]
    @@all << self
  end

  def self.all
    @@all
  end

end
