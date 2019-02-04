class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    user_recipes = []
    RecipeCard.all.each do |recipecard|
      if recipecard.user == self
        user_recipes << recipecard.recipe.name
      end
    end
    user_recipes
  end

end
