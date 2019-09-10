class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  #Part 1
  
  attr_accessor :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |char| char.upcase }
    else
      raise "pegs are invalid"
    end
  end

  def self.random(length)
    keys = POSSIBLE_PEGS.keys
    pegs_arr = []
    length.times do
      pegs_arr << keys.sample
    end
    Code.new(pegs_arr)
  end

  def self.from_string(str)
    char_arr = str.split("")
    Code.new(char_arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  #Part 2

  def num_exact_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, i|
      if code[i] == self[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(code)
    count = 0
    code.pegs.each_with_index do |peg, i|
      if self.pegs.include?(peg)
        if code[i] != self[i]
          count += 1
        end
      end
    end
    count
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
