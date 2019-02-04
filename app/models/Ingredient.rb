class Ingredient
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_hash = {}
    Allergen.all.map { |allergen| allergen.ingredient }.each do |ingredient|
      !allergen_hash[ingredient] ? allergen_hash[ingredient] = 1 : allergen_hash[ingredient] += 1
    end
    allergen_hash.keys.sort_by { |key| allergen_hash[key] }.last
  end
end
