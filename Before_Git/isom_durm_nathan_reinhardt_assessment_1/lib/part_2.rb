# expect(element_count(["cat", "dog", "cat", "cat"])).to eq({"cat" => 3, "dog"=>1})
# expect(element_count(["a", "b", "c", "c"])).to eq({"a" => 1, "b"=>1, "c"=>2})

def element_count(array)
    hash = {}

    array.each do |word|
        if hash.has_key?(word)
            hash[word] += 1
        else
            hash[word] = 1
        end
    end

    hash
end


# string_1 = "hello world"
# char_replace!(string_1, {"l"=>"7", "e"=>"a", " "=>"-", "o"=>"q"})
# expect(string_1).to eq("ha77q-wqr7d")


# string_2 = "pizza"
# char_replace!(string_2, {"z"=>"x", "t"=>"f", "e"=>"a"})
# expect(string_2).to eq("pixxa")


def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end
    str
end

def product_inject(array)
    array.inject { |acc, el| acc * el }
end
