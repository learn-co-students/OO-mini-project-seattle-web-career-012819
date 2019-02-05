class RecipeIngredient
  #RecipeIngredient is the join between an ingredient and a recipe.

  @@all = []
  attr_accessor :ingredient,:recipe
  
  def initailize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end


end
