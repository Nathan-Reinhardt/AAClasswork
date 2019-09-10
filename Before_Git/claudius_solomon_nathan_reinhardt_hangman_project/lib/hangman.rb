class Hangman
  #Part 1
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5  
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    new_arr = []

    @secret_word.each_char.with_index do |el, i|
      if char == el
        new_arr << i
      end
    end

    new_arr
  end

  def fill_indices(char, arr)
    arr.each do |i| #[1]
      self.guess_word[i] = char
    end
    
    self.guess_word #[_, a, _]
  end

  #Part 2

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)

    if matches.empty?
      @remaining_incorrect_guesses -= 1
    end
    return true 
  end

  def ask_user_for_guess
    p "Enter a char:"
    letter = gets.chomp
    self.try_guess(letter)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      true
    else
      false
    end
  end
end
