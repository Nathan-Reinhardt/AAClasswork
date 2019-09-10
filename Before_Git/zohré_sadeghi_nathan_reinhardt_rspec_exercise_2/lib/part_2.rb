def palindrome?(str)
    new_str = ""
    i = str.length - 1
    
    while i >= 0
        new_str += str[i]
        i -= 1
    end

    if new_str == str
        return true
    end

    false
end

def substrings(str)
    result = []
    length = str.length

    (0...length).each do |i|
        new_str = ""

        (0...str.length).each do |j|
            new_str += str[j]
            result << new_str
        end

        str = str[1..-1]
    end

    result
end

def palindrome_substrings(str)
    result = []

    sub_strings = substrings(str)

    (0...sub_strings.length).each do |i|
        if palindrome?(sub_strings[i]) && sub_strings[i].length > 1
            result << sub_strings[i]
        end
    end

    result
end