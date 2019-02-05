class RecipeCard

  attr_reader :user, :recipe, :rating, :date
  @@all = []

  def initialize(user, recipe, date, num)
    @user = user
    @recipe = recipe
    @rating = num
    @date = date

    @@all << self
  end

  def self.all
    @@all
  end


end
