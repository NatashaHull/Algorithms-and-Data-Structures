require_relative 'linked_lists.rb'
class CircularLinkedList < LinkedList
  def find(item)
    head.find(item, head)
  end

  def delete(item)
    head.delete(item, head)
  end
end

class CircularLinkedListItem < LinkedListItem
  def initialize(val, n_item=nil)
    @value = val
    @next_item = n_item || self
  end

  def find(val, stop)
    return if next_item == stop
    super(val)
  end

  def delete(val, stop)
    return if next_item == stop
    super(val)
  end
end