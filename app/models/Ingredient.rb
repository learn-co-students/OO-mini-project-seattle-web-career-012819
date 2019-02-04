class Ingredient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # Ingredient.most_common_allergen should return the ingredient instance
    # that the highest number of users are allergic to
    def self.most_common_allergen
      #get array of allergens
      arr = Allergen.all.collect {|element| element.ingredient}
      freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      allergen_name = arr.max_by { |v| freq[v] }
      allergen_name
    end
end
