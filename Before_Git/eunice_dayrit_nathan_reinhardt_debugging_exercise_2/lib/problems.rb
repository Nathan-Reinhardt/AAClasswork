# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end

    true
end

def largest_prime_factor(num)
    temp = num

    while true
        if num % temp == 0 && prime?(temp)
            return temp
        end

        temp -= 1
    end
end

def unique_chars?(str)
    stored = []

    str.each_char do |letter|
        if stored.include? letter
            return false
        else
            stored << letter
        end
    end

    true
end

def dupe_indices(arr)
    hash = { }

    arr.each_with_index do |el, curr|
        if hash.has_key? el
            hash[el] << curr
        else
            hash[el] = [curr]
        end
    end

    hash.select{ |k, v| v.length > 1 }
end

def create_hash(arr)
    hash = { }

    arr.each do |el|
        if hash.has_key? el
            hash[el] += 1
        else
            hash[el] = 1
        end
    end

    hash
end

def ana_array(arr1, arr2)
    hash_1 = create_hash(arr1)
    hash_2 = create_hash(arr2)

    if hash_1 == hash_2
        return true
    end

    false
end