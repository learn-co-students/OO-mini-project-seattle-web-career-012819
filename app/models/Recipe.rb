class Recipe
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    all_recipes = RecipeCard.all.map do |recipe_card|
      recipe_card.recipe
    end
    count = {}

    all_recipes.each do |recipe|
      if count.key?(recipe)
        count[recipe] += 1
      else
        count[recipe] = 1
      end
    end
    most_popular_recipe = count.max_by{|key, value| value}
    most_popular_recipe.first
  end

  def users
    recipes_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end

    recipes_cards.map do |recipe_card|
      recipe_card.user
    end.uniq
  end

  def ingredients
    recipes_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
       #puts recipe_ingredient
       recipe_ingredient.recipe == self
    end

    recipes_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end.uniq
  end

  def allergens
    ingredient_with_allergy = Allergen.all.map do |allergen|
      allergen.ingredient
    end.uniq

    self.ingredients.select do |ingredient|
      ingredient_with_allergy.include?(ingredient)
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
       RecipeIngredient.new(self, ingredient)
    end
  end

end
