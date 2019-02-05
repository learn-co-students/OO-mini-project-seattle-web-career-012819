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
#should return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    count = 0
    a_name = nil
    tally = Hash.new(0)
    Allergen.all.each do |allergy|
      tally[allergy.ingredient] += 1
      if tally[allergy.ingredient] > count
        count = tally[allergy.ingredient]
        a_name = allergy.ingredient
      end
    end
    a_name
  end
end # end of class
