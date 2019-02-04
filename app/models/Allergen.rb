class Allergen
  @@all = []
  attr_accessor :ingredient, :user
  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end
end