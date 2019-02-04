class Ingredient
  attr_reader :name
  @@all = []
  def initialize(name)
    @name=name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    all_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end

    count = {}

    all_ingredients.each do |ingredient|
      if count.key?(ingredient)
        count[ingredient] += 1
      else
        count[ingredient] = 1
      end
    end

    most_allergic_ingredient = count.max_by{|key, value| value}
    most_allergic_ingredient.first
  end

end#end of class
