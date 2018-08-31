def naive_windowed_max_range(array, window_size)
  current_max_range = 0
  array.each_cons(window_size) do |window|
    min = window.min
    max = window.max
    current_max_range = max - min if max - min > current_max_range
  end
  current_max_range
end

class MyQueue
  def initialize
    @store = []
  end
  
  def enqueue(item)
    @store.push(item)
  end
  
  def dequeue
    @store.shift
  end
  
  def peek
    @store.first
  end
  
  def size
    @store.length
  end
  
  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader :min, :max
  
  def initialize
    @store = []
    @max = nil
    @min = nil
  end
  
  def pop
    popped_item = @store.pop
    if popped_item[:num] == @max
      @max = popped_item[:prev_max]
    end
    if popped_item[:num] == @min
      @min = popped_item[:prev_min]
    end
    popped_item[:num]
  end
  
  def push(item)
    @store.push({ num: item, prev_max: @max, prev_min: @min })
    @max = item if max.nil? || item > max
    @min = item if min.nil? || item < min
  end
  
  def peek
    @store.last
  end
  
  def size
    @store.length
  end
  
  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end
  
  def enqueue(item)
    @in_stack.push(item)
  end
  
  def dequeue
    if @out_stack.empty?
      @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
    @out_stack.pop
  end
  
  def size
    @in_stack.length + @out_stack.length
  end
  
  def empty?
    @in_stack.empty? && @out_stack.empty?
  end
end
