class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    @size += 1
    if @head.nil? 
      @head = node
      @tail = node
    else
      @tail.pointer = node
      @tail = node
    end
  end

  def prepend(node)
    @size += 1
    if @head.nil?
      @head = node
      @tail = node
    else
      node.pointer = @head
      @head = node
    end
  end

  def at(index)
    current_node = @head
    index.times do |i|
      current_node = current_node.pointer
    end

    current_node
  end

  def pop
    new_tail = at(@size - 2)
    new_tail.pointer = nil
    @tail = new_tail
    @size -= 1
  end

  def contains?(target_value)
    current_node = @head
    size.times do
      if current_node.value == target_value
        return true
      end
      current_node = current_node.pointer
    end

    false
  end

  def find(target_value)
    current_node = @head
    size.times do |i|
      if current_node.value == target_value
        return i
      end
      current_node = current_node.pointer
    end

    nil
  end

  def to_s
    string = ""
    current_node = @head
    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.pointer
    end
    puts " nil "
  end
end

class Node
  attr_accessor :value, :pointer

  def initialize(value=nil, pointer=nil)
    @value = value
    @pointer = pointer
  end
end

list = LinkedList.new
list.append(Node.new(5))
list.append(Node.new(7))
list.append(Node.new(2))
list.append(Node.new(9))
list.prepend(Node.new(1))
list.prepend(Node.new(0))
list.to_s
list.pop
list.to_s
list.pop
list.to_s
list.pop
list.to_s

puts list.find(1)
puts "----------"
puts list.find(4)