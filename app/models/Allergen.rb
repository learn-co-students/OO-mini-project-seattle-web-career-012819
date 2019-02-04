class Allergy

  attr_accessor :ingredient, :user
  @@all = []

  def initialize (ingredient, user)
    @ingredient = ingredient
    @user = user

    @@all << self
  end

  def self.all
    @@all
  end

end 
