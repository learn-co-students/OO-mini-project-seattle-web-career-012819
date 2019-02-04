class Ingredient

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergy.all.select {|allergy| allergy.ingredient == self}
  end

  def allergic_user
    self.allergens.map {|allergen| allergen.user}
  end

  def self.most_common_allergen
    counter = 0
    array = []
    @@all.each do |ingredient_object|
      if ingredient_object.allergic_user.count > counter
        counter = ingredient_object.allergic_user.count
        array << ingredient_object
      end
    end
    array.pop
  end

end
