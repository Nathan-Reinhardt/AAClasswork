class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head, @tail = Node.new, Node.new
    @head.next, @tail.prev = @tail, @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    ptr = @head
    while ptr != nil
      return ptr.val if ptr.key == key
      ptr = ptr.next
    end
    ptr
  end

  def include?(key)
    ptr = @head
    until ptr.nil?
      return true if ptr.key == key
      ptr = ptr.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = last
    last.next = new_node
    new_node.next = @tail
    @tail.prev = new_node
  end

  def update(key, val)
    ptr = @head
    until ptr.nil?
      if ptr.key == key
        ptr.val = val
      end
      ptr = ptr.next
    end
  end

  def remove(key)
    ptr = @head
    while ptr != nil
      if key == ptr.key
        prev_node = ptr.prev
        next_node = ptr.next
        prev_node.next = next_node
        next_node.prev = prev_node
        break
      end
      ptr = ptr.next
    end
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
