class RecipeIngredient
  attr_accessor :recipe, :ingredient
  @@all = []

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient

    @@all << self
  end

  def self.all
    @@all
  end


    ##these are the attr_accessor
  # def recipe=(recipe)
  #   @recipe = recipe
  # end

  # def recipe
  #   @recipe
  # end

end # end of class
