class Ingredient

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergy
    # allergy = Allergy.all.max_by {|allergy| Allergy.all.count(allergy)}
    # allergy.ingredient
    tally = Hash.new(0)
    most_count = 0
    most_thing = nil
    Allergy.all.each do |allergy|
      tally[allergy] +=1
      if tally[allergy] > most_count
        most_thing = allergy
        most_count = tally[allergy]
      end
    end
    most_thing.ingredient
  end


end
