class Card

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def self.possible_suits
    ["♠️", "♡", "♣️", "♦️"]
  end
  
  def self.possible_values
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  end
end