def proper_factors(number)
    new_array = []

    i = 1

    while i < number
        if number % i == 0
            new_array << i
        end
        i += 1
    end
    
    new_array
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(number)
    if aliquot_sum(number) == number
        return true
    end

    false
end

def ideal_numbers(n)
    new_array = []
    i = 1
    while new_array.length < n
        if perfect_number?(i)
            new_array << i
        end
        i += 1
    end

    new_array
end