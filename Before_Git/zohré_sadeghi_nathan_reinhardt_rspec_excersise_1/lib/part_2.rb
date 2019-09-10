def hipsterfy(word) 
    arr = word.split('')
    vowels = ["a", "e", "i", "o", "u"]
    index = -1
    
    (0...arr.length).each do |i|
        letter = arr[i]
        if vowels.include? letter
            index = i
        end
    end

    if index > -1
        arr.delete_at(index)
        return arr.join('')
    end
    
    word
end

def vowel_counts(str)
    str = str.downcase
    hash = { }
    vowels = ["a", "e", "i", "o", "u"]
    arr = str.split('')

    (0...arr.length).each do |i|
        if vowels.include? arr[i]
            if hash.has_key?(arr[i])
                hash[arr[i]] += 1
            else
                hash[arr[i]] = 1
            end
        end
    end

    hash
end

def caesar_cipher(message,n) 
    alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u ","v", "w", "x", "y", "z"]
    index = 0
    new_message = message.split("")

    (0...message.length).each do |i|
        char = message[i]
        if alphabet.include? char
            index = alphabet.index(char)
            index = (index + n) % 26
            char = alphabet[index]
            new_message[i] = char
        end
    end

    return new_message.join("")
end