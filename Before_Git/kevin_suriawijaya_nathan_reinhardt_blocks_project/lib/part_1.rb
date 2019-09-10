def select_even_nums(arr)
    arr.select { |num| num.even? }
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays (multi_arr)
    multi_arr.count{|arr|arr.sum > 0}
end

def aba_translate(str)
    vowels = ["a", "e", "i", "o", "u"]
    new_str = ""
    str.each_char do |char|
        if vowels.include? (char)
            new_str += char + "b"
        end
        new_str += char
    end
    new_str
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end
