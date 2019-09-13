class Array
  
  def my_uniq
    new_arr = []

    self.each do |ele|
      if !new_arr.include?(ele)
        new_arr << ele
      end
    end

    new_arr
  end

  def two_sum
    new_arr = []

    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        if self[i] + self[j] == 0
          new_arr << [i, j]
        end
      end
    end

    new_arr
  end

  def my_transpose
    big_arr = []

    self.length.times do |i|
      small_arr = []

      (0...self.length).each do |j|
        small_arr << self[j][i]
      end

      big_arr << small_arr
    end

    big_arr
  end

  def stock_picker
    highest_profit = 0
    highest_profit_indices = []

    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        if self[j] - self[i] > highest_profit
          highest_profit = self[j] - self[i]
          highest_profit_indices = [i, j]
        end
      end
    end

    highest_profit_indices
  end

end

#Towers of Hanoi

class Disc

  attr_reader :value

  def initialize(value)
    @value = value
  end

end

class Tower

  def initialize(*discs)
    @store = [discs]
  end
end

class Game

end