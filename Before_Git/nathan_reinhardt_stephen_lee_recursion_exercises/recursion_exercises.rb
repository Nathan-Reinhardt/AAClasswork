### Warmup

# Write a recursive method, range, that takes a start and an end and returns an
# array of all numbers in that range, exclusive. For example, range(1, 5)
# should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start,last)
  return [] if last <= start
  # [a] + [b] => [a, b]
  [start] + range(start + 1, last)
end

# p "Testing range recursion"
# p range(1, 3)
# p range(3, 10)
# p range(5, 5)
# p range(1, 0)
# puts


# Write both a recursive and iterative version of sum of an array.
def r_sum(arr)
  return 0 if arr.empty?

  arr.first + r_sum(arr[1..-1])
end

def i_sum(arr)
  sum = 0

  arr.each do |num|
    sum += num
  end

  sum
end

# p "Testing sum recursion"
# p r_sum([1, 3])
# p r_sum([3, 4, 3, -10, 10])
# p r_sum([5, 4, 3, 2, 1])
# p r_sum([])
# puts

# p "Testing sum iteration"
# p i_sum([1, 3])
# p i_sum([3, 4, 3, -10, 10])
# p i_sum([5, 4, 3, 2, 1])
# p i_sum([])
# puts


### Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1

  base * exp(base, exponent - 1)
end

# p "Testing exponentiation recursion 1"
# p exp(2, 0)   # => 1
# p exp(2, 1)   # => 2
# p exp(2, 2)   # => 4
# p exp(2, 5)   # => 32
# p exp(5, 2)   # => 25
# puts


# recursion 2
# exp_2(b, 0) = 1
# exp_2(b, 1) = b
# exp_2(b, n) = exp_2(b, n / 2) ** 2             [for even n]
# exp_2(b, n) = b * (exp_2(b, (n - 1) / 2) ** 2) [for odd n]

def exp_2(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1

  if exponent % 2 == 0
    exp_2(base, exponent / 2) * exp_2(base, exponent / 2)
  else
    base * exp_2(base, (exponent - 1) / 2) * exp_2(base, (exponent - 1) / 2)
  end
end

# p "Testing exponentiation recursion 2"
# p exp_2(2, 0)   # => 1
# p exp_2(2, 1)   # => 2
# p exp_2(2, 2)   # => 4
# p exp_2(2, 5)   # => 32
# p exp_2(5, 2)   # => 25
# puts


### Deep Dup

def deep_dup(arr)
  return arr if !arr.is_a? Array

  dup = []

  arr.each { |el| dup << deep_dup(el) }

  return dup
end

# p "Testing deep dup recursion"
# p arr = [1, [2], [3, [4]]]
# p copy = deep_dup(arr)
# p arr == copy                                 # => true
# p arr.object_id != copy.object_id             # => true
# puts


### Fibonacci

# Write a recursive and an iterative Fibonacci method. The method should take
# in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able
# to do this just passing a single argument for the number of Fibonacci
# numbers requested.

def fib(n)                              # n = 7
  # return [] if n == 0
  # return [1] if n == 1
  # return [1, 1] if n == 2
  return [1, 1].take(n) if n <= 2

  arr = fib(n-1)                        # arr = fib(7 - 1) = [1, 1, 2, 3, 5, 8]
  arr << arr[-1] + arr[-2]              # arr << 8 + 5
  arr                                   # returns arr, which equals [1, 1, 2, 3, 5, 8, 13]
end

# p "Testing fibonacci recursion"
# p fib(0)    # => []
# p fib(1)    # => [1]
# p fib(2)    # => [1, 1]     #2nd 1 = fib(n-1)[-1]
# p fib(3)    # => [1, 1, 2]
# p fib(7)    # => [1, 1, 2, 3, 5, 8, 13]
# p fib(10)   # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
# puts


### Binary Search
# Write a recursive binary search: bsearch(array, target). Note that binary
# search only works on sorted arrays. Make sure to return the location of the
# found object (or nil if not found!). Hint: you will probably want to use
# subarrays.

def bsearch(arr, target)
  return nil if !arr.include?(target)
  mid_index = arr.length / 2

  if arr[mid_index] > target
    bsearch(arr[0...mid_index], target)
  elsif arr[mid_index] < target
    mid_index + bsearch(arr[mid_index..-1], target)
  else
    return mid_index 
  end
end

# p "Testing binary search recursion"
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# puts


### Merge Sort

def merge_sort(arr)
  return [] if arr.empty?
  return arr if arr.length < 2

  mid_idx = arr.length / 2
  left = arr.take(mid_idx)      # [38, 27, 43]
  right = arr.drop(mid_idx)     # [3, 9, 82, 10]

  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  new_arr = []

  while !left.empty? && !right.empty?
    if left.first < right.first
      new_arr << left.shift
    else
      new_arr << right.shift
    end
  end

  new_arr + left + right
end

# Notes
# 1st ex: 7 / 2 == 3    mid = 3
# 2nd ex: 8 / 2 == 4    mid = 70


# p "Testing merge sort recursion"
# p merge_sort([38, 27, 43, 3, 9, 82, 10])    # => [3, 9, 10, 27, 38, 43, 82]
# p merge_sort([23, 5, 9, 43, 70, 32, 55, 8]) # => [5, 8, 9, 23, 32, 43, 55, 70]
# puts


### Array Subsets

def subsets(arr)
  return [arr] if arr.empty?
  return [[], arr] if arr.length == 1

  prev_sets = subsets(arr[0...-1])
  new_sets = prev_sets.map do |subarr|
    subarr += [arr.last]
  end

  prev_sets + new_sets
end

# p "Testing subsets recursion"
# p subsets([])           # => [[]]
# p subsets([1])          # => [[], [1]]
# p subsets([1, 2])       # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])    # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# puts


### Permutations

def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift                   # first = 1
  perms = permutations(arr)           # arr = [2, 3]
  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_permutations
end

# p "Testing permutations recursion"
# p permutations([1, 2, 3])         # => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
# p permutations(["a", "b", "c"])   # => [["a", "b", "c"], ["a", "c", "b"], ["b", "a", "c"], ["b", "c", "a"], ["c", "a", "b"], ["c", "b", "a"]]
# puts


### Make Change

def greedy_make_change(amount, coins)
  return [amount] if amount == coins.first

  result = []               # []

  coin = coins.first          # 10
  new_amount = amount - coin

  if new_amount >= coin     # 14 >= 10 ->                    4 >= 1 ... 1 == 1
    result += [coin] + greedy_make_change(new_amount, coins)
  else                      #             4 < 10 -> 4 < 7 ->
    result += greedy_make_change(amount, coins[1..-1])
  end

  result
end

def make_better_change(amount, coins)

end

p "Testing make change recursion"
# p greedy_make_change(24, [10, 7, 1])    # => [10, 10, 1, 1, 1, 1]
# p greedy_make_change(31, [10, 7, 1])
# p make_better_change(24, [10, 7, 1])    # => [10, 7, 7]