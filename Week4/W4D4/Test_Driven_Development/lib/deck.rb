require_relative 'card.rb'

class Deck

  def initialize
    @cards = []
    Card.possible_suits.each do |suit|
      Card.possible_values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    @cards = @cards.shuffle
  end

  def top_card
    @card[0]
  end

  def shift_card
    @cards.shift
  end

end