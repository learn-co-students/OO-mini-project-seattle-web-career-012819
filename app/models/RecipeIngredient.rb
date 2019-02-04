class RecipeIngredient
  attr_accessor :ingredient, :recipe
  @@all = []

  def initialize(recipe, ingredient)
    #recipe object
    @recipe = recipe
    #ingredient object
    @ingredient = ingredient

    @@all << self
  end

  def self.all
    @@all
  end
end
