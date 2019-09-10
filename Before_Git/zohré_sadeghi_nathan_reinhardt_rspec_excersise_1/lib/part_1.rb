def average(num_1, num_2) 
    return (num_1 + num_2) / 2.0
end

def average_array(arr)
    arr.sum/arr.length.to_f
end

def repeat(str, n) 
    i = 0
    newstr = ""
    while i < n 
        newstr += str
        i += 1
    end

    newstr
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    arr = sentence.split(' ')

    (0...arr.length).each do |i|
        if i % 2 == 0
            arr[i] = arr[i].upcase
        else
            arr[i] = arr[i].downcase
        end
    end

    arr.join(" ")
end