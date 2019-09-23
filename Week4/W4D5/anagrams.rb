class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use `Array#sort` or `Array#sort_by` in your implementation.**
  
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.count <= 1

    midpoint = self.count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

# p first_anagram?("gizmo", "sally") #=> false
# p first_anagram?("elvis", "lives") #=> true

# #funny case (goodluck finishing this print)
# p first_anagram?("abcdefghijklm", "efghijabcdklm") #=> true

def second_anagram?(string1, string2)
  string1.each_char do |char|
    # hold_str = ""
    hold_str = string2.dup
    string2.delete!(char)
    if hold_str != string2
      return false
    end
    # if string2 == ""
    #   return true
    # end
  end
  true
end

# p second_anagram?("gizmo", "sally") #=> false
# p second_anagram?("elvis", "lives") #=> true

def third_anagram?(string1, string2)
  alphabet = ("a".."z").to_a

  index1 = []
  index2 = []

  string1.each_char do |char|
    index1 << alphabet.index(char)
  end

  index1 = index1.merge_sort

  string2.each_char do |char|
    index2 << alphabet.index(char)
  end

  index2 = index2.merge_sort

  string1 = ""
  string2 = ""

  index1.each do |idx|
    string1 += alphabet[idx]
  end
  
  index2.each do |idx|
    string2 += alphabet[idx]
  end

  string1 == string2
end

p third_anagram?("gizmo", "sally") #=> false
p third_anagram?("elvis", "lives") #=> true