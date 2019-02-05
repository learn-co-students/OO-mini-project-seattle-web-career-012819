require 'date'
class RecipeCard
  attr_accessor :date, :rating, :user, :recipe

  @@all = []
  @@int = 1

  def initialize(rating, user, recipe)
    @date = Date.today.strftime("%Y-%m-%d #{@@int}")
    @rating = rating
    @user = user
    @recipe = recipe


    @@all << self
  end

  def self.all
    @@all
  end

end # end of class
