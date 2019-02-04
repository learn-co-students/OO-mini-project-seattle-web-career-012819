class Allergen
  attr_accessor :ingredient

  @@all=[]

  def initialize(ingredient)
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end#end of class
