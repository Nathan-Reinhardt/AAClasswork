class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(n)
        @age = n
    end

    def gBark
        @bark
    end

    def bark
        if age > 3
            return gBark.upcase
        else
            return gBark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(food)
        favorite_foods.each_with_index do |word, i|
            favorite_foods[i] = word.downcase
        end
        favorite_foods.include?(food.downcase)
    end
end
