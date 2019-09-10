def reverser (str, &prc)
    rev_str = str.reverse
    prc.call(rev_str)
end

def word_changer(sent, &prc)
    sent.split(" ").map {|word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    [prc_1.call(num), prc_2.call(num)].max
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each {|ele| new_arr << ele if prc_1.call(ele) && prc_2.call(ele)}
    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.each_with_index.map {|ele, index| index.even? ? prc_1.call(ele) : prc_2.call(ele)}
end
