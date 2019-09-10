def partition(arr, num)
    result = []
    less = []
    greater = []

    (0...arr.length).each do |i|
        if arr[i] < num
            less << arr[i]
        else
            greater << arr[i]
        end
    end

    result << less
    result << greater
    result
end

def merge(hash1, hash2)
    result = {}
    
    hash1.each do |key1, value1|
        result[key1] = value1
    end
    
    hash2.each do |key2, value2|
        result[key2] = value2
    end
    
    result
end

def censor(sentence, arr)
    new_sentence = sentence.split(' ')
    vowels = ["a", "e", "i", "o", "u"]

    (0...new_sentence.length).each do |i|
        word = new_sentence[i]
        new_word = word.downcase

        if arr.include? new_word

            (0...new_word.length).each do |j|
                letter = new_word[j]

                if vowels.include? letter
                    letter = "*"
                    new_word[j] = letter 
                end
            end
        end

        (0...word.length).each do |k|
            if word[k] != new_word[k]
                new_word[k] = new_word[k].upcase
            end
        end

        new_sentence[i] = new_word
    end

    new_sentence.join(' ')
end



def power_of_two?(num) 
    if num % 2 != 0 && num != 1
        return false
    end

    i = 0

    while 2**i <= num
        if 2**i == num
            return true
        end
        i += 1
    end

    return false
end
