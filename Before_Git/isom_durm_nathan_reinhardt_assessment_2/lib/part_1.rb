# expect(my_reject([7, 6, 5, 4]) { |n| n.even? }).to eq([7, 5])
# expect(my_reject([-3, 5, 0, 8]) { |n| n > 0 }).to eq([-3, 0])

def my_reject(array, &prc)
    array.select { |el| prc.call(el) == false }
end

def my_one?(array, &prc)
    # array.one? { prc }
    # count = array.count(prc)
    count = array.count{ |el| prc.call(el) }
    if count == 1
        return true
    end

    false
end

# expect(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| "aeiou".include?(k) }).to eq({"a"=>0, "o"=>14})
# expect(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| v.even? }).to eq({"a"=>0, "c"=> 2, "o"=>14})

def hash_select(hash, &prc)
    new_hash = { }

    hash.each do |k, v|
        if prc.call(k, v)
            new_hash[k] = v
        end
    end

    new_hash
end

def xor_select(array, prc_1, prc_2)
    array.select{ |el| prc_1.call(el) == false && prc_2.call(el) == true || prc_1.call(el) == true && prc_2.call(el) == false }
end

def proc_count(v, array)
    array.count{ |el| el.call(v) }
end
