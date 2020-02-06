class Dog

    def initialize (name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    # getters
    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def favorite_foods
        @favorite_foods
    end

    def bark
        return @bark.upcase if @age > 3
        @bark.downcase
    end

    # setters
    def age=(nage)
        @age = nage
    end

    # questions
    def favorite_food? (itm)
        @favorite_foods.map(&:downcase).include? itm.downcase
    end

end
