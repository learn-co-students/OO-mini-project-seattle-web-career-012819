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

  def self.most_common_allergen
    newhash = Hash.new(0)
    Allergen.all.each {|allergen| newhash[allergen.ingredient] += 1}
    newhash.max_by{|allergen, number| number}[0]
  end
end
