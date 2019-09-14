# my_min

#Phase 1 => Time complexity = O(n^2)

# def my_min(arr)
#   arr.each do |el|
#     count = 0
#     arr.each do |el2|
#       if el <= el2
#         count += 1
#       end
#     end
#     if count == arr.length
#       return el
#     end
#   end
# end


#Phase 2 => Time complexity = O(n)

def my_min(arr)
  min = arr[0]
  
  arr.each do |el|
    if el < min
      min = el
    end
  end
  
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)  # =>  -5

# Largest_contiguous_sum

# Phase 1 ==> Time Complexity:  0(n^2)

# def largest_contiguous_subsum(arr)
#   all_sums = []

#   (0...arr.length).each do |i|
#     subarr = []
#     arr_2 = arr[i..-1]

#     arr_2.each do |el|
#       subarr += [el]
#       all_sums += [subarr]
#     end
#   end

#   all_sums.map(&:sum).max #{ |sub_arr| sub_arr.sum }
#   #all_sums.max
# end

# list1 = [5, 3, -7]
# puts largest_contiguous_subsum(list1) # => 8

# list2 = [2, 3, -6, 7, -6, 7]
# puts largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

# list3 = [-5, -1, -3]
# puts largest_contiguous_subsum(list3) # => -1 (from [-1])

#Phase 2 ==> Time Complexity:  

def largest_contiguous_subsum(arr)
  # max = arr[0]
  # sum_2 = 0
  # res = []
  # arr_2 = arr
  # sum = []
  # i = 0

  # while !arr_2.empty?
  #   sum += [arr_2[i]]
  #   p sum
  #   sum_2 += arr_2[i]
  #   # puts sum_2
  #   if sum_2 > max
  #     max = sum_2
  #   end
  #   if sum.length == arr_2.length
  #     arr_2.shift
  #     sum = []
  #     sum_2 = 0
  #     i = 0
  #   end
  #   i += 1
  # end

  # max

  max = arr[0] #max
  bool = true
  i = 0
  j = 1
  sum_index = i
  answer = 0
  set_index = i + 1

  while bool
    if j != arr.length - 1
      
      if j == sum_index
        i = 0
        j += 1
        sum_index = i
        answer = 0
      end

      sum_index += 1
      answer += arr[i] + arr[sum_index]
      i += 1
    
    elsif j == arr.length - 1
      prev_index = i
      i = prev_index + 1
      if i == j
        answer += arr[j]
        bool = false
      else
        answer += arr[i] + arr[i + 1]
      end

    end

    if answer > max
      max = answer
      if i == j
        answer = 0
        set_index = i + 1
      end
    end

  end

  max

end

list = [5, 3, -7]
puts largest_contiguous_subsum(list) # => 8

list2 = [2, 3, -6, 7, -6, 7]
puts largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

list3 = [-5, -1, -3]
puts largest_contiguous_subsum(list3) # => -1 (from [-1])