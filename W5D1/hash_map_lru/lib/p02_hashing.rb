class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    bucket = self.length % 97
    self.each {|x| bucket = ((bucket ^ x) + x) % 97}
    bucket
  end
end

class String
  def hash
    bucket = self.length % 97
    self.each_char {|x| bucket = ((bucket ^ x.ord) + x.ord) % 97}
    bucket
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    bucket = self.length % 97
    self.each { |k,v| bucket += (k.hash + v.hash) % 97 }
    bucket
  end
end
