class LinkedList
  attr_accessor

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil? 
      @head = node
      @tail = node
    else
      @tail.pointer = node
      @tail = node
    end
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
list.to_s