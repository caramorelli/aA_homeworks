# Exercise 1 - Stack
#
# Let's write a Stack class. To do this, use the following framework:
#
  class Stack
    attr_reader :stack_arr
    def initialize
      # create ivar to store stack here!
      @stack_arr = []
    end

    def push(el)
      # adds an element to the stack
      stack_arr = stack_arr.concat([el])
      el
    end

    def pop
      # removes one element from the stack
      pop_ele = stack_arr.slice(-1...stack_arr.length)
      stack_arr = stack_arr.slice(0...-1)
      pop_el
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      stack_arr.last
    end

  end

# To test that your code works, create a new instance of the Stack class, and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!
#
# Exercise 2 - Queue
#
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.

class Queue
  attr_reader :queue_arr

  def initialize
    @queue_arr = []
  end

  def enqueue(el)
    queue_arr = queue_arr.concat([el])
    el
  end

  def dequeue
    pop_ele = queue_arr.slice(0...1)
    queue_arr = queue_arr.slice(1..-1)
    pop_el
  end

  def peek
    queue_arr.first
  end
end

#
# Test your code to ensure it follows the principle of FIFO.
#
# Exercise 3 - Map
#
# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

class Map
  attr_reader :map_arr

  def initialize
    @map_arr = []
  end

  def set(key, value)
    pair_indx = map_arr.index { |pairs| pairs[0] == key }
    pair_indx ? map_arr[pair_indx][1] = val : map_arr.push([key, val])
    val
  end

  def get(key)
    map_arr.each { |pairs| return pairs[1] if pairs[0] == key }
    nil
  end

  def delete(key)
    val = get(key)
    map_arr.reject! { |pairs| pairs[0] == key }
    val
  end

  def show
    deep_dup(map_arr)
  end

  private
  def deep_dup(arr)
    arr.map { |ele| ele.is_a?(Array) ? deep_dup(ele) : ele }
  end
end
#
# As always, test your code thoroughly to make sure all properties of maps are enforced.
