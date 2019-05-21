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
    count = 0
    current_node = @head
    index.times do |i|
      current_node = current_node.pointer
    end

    current_node
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

puts list.at(4).value 