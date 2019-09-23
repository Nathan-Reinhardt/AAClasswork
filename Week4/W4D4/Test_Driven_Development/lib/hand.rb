require_relative "deck.rb"

class Hand

  def initialize(card_array)
    @hand = card_array
  end

  def show_hand
    print @hand
  end
  
  def pair
    @hand.each do |card|
      if @hand.count(card.value) == 2
        return 20 + card.value
      end
    end
    return 0
  end

  def three_of_a_kind
    @hand.each do |card|
      if @hand.count(card.value) == 3
        return 30 + card.value
      end
    end
    return 0
  end

  def flush
    @hand.each do |card|
      if @hand.count(card.suit) == 5
        #itterate through cards
        return 50 + card.value
      end
    end
    return 0
  end

  def four_of_a_kind
    @hand.each do |card|
      if @hand.count(card.value) == 4
        return 70 + card.value
      end
    end
    return 0
  end

  def full_house
    if pair != 0 && three_of_a_kind != 0
      return 60 + #itterate through cards
    end
  end

  #straight
  #royal_straight


end