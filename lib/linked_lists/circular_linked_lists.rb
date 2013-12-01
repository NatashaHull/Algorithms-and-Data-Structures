require_relative 'linked_lists.rb'
class CircularLinkedList < LinkedList
  def find(item)
    head.find(item, head)
  end

  def delete(item)
    if item == head
      self.head = head.next_item
    else
      head.delete(item, head)
    end
  end

  def insert_after(f_item, new_item)
    if f_item.nil?
      n_item = CircularLinkedListItem.new(new_item, head)
      self.head = n_item
    else
      super(f_item, new_item)
    end
  end
end

class CircularLinkedListItem < LinkedListItem
  def initialize(val, n_item=nil)
    @value = val
    @next_item = n_item || self
  end

  def find(val, stop)
    return if (next_item == stop) && (value != val)
    if value == val
      self
    else
      next_item.find(val, stop) if !!next_item
    end
  end

  def delete(val, stop)
    return if next_item == stop
    if next_item == val
      self.next_item = next_item.next_item
    else
      next_item.delete(val, stop)
    end
  end

  def insert_after(val)
    self.next_item = CircularLinkedListItem.new(val, next_item)
  end
end