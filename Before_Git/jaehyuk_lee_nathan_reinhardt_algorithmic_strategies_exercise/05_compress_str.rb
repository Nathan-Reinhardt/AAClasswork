# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
    count = 1

    i = 1
    while i <= str.length
        curr = str[i]
        prev = str[i - 1]

        if curr == prev
            count += 1
        else
            if count == 1
                new_str += prev
            else
                new_str += count.to_s + prev
                count = 1
            end
        end

        i += 1
    end

    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
