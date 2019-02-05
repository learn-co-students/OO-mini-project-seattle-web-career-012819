class Allergen
  #Allergen is a join between a user and an ingredient.
  @@all = []
  attr_reader :user, :ingredient

  def initialize(user,ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
    #should return all of the Allergen instances
  end


end
