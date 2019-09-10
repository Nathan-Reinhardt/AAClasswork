def is_prime?(num)
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    num > 1 
end

# expect(nth_prime(1)).to eq(2)
# expect(nth_prime(2)).to eq(3)
# expect(nth_prime(3)).to eq(5)
# expect(nth_prime(4)).to eq(7)

def nth_prime(n)
    count = 0
    prime_number = 0
    i = 2
    while count < n
        if is_prime?(i)
            count += 1
            prime_number = i
        end
        i += 1
    end

    prime_number
end

# expect(prime_range(4, 17)).to match_array([5, 7, 11, 13, 17])
#       expect(prime_range(23, 31)).to match_array([23, 29, 31])
#       expect(prime_range(1990, 2000)).to match_array([1993, 1997, 1999])
#       expect(prime_range(-10, 1 )).to match_array([])

def prime_range(min, max)
    prime_numbers = []
    (min..max).each do |number|
        if is_prime?(number)
            prime_numbers << number
        end
    end
    
    prime_numbers
end
