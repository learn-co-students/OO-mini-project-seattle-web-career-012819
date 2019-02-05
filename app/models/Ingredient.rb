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

  def most_common_allergen
    count = Hash.new(0)
    most_count = 0
    most_allergen = nil
    Allergen.all.each do |allergen|
      count[allergen.ingredient] += 1
      if count[allergen.ingredient] > most_count
        most_allergen = allergen.ingredient
        end
      end
      most_allergen
      #should return the ingredient instance that the highest number of users are allergic to
    end

  end
