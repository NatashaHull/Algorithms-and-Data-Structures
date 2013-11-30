class LinkedList
  def head
    @head
  end

  def find(item)
    head.find(item)
  end

  def delete(item)
    if item == head
      head = head.next_item
    else
      head.delete(item)
    end
  end

  def insert_after(f_item, new_item)
    if(f_item.nil?)
      n_item = LinkedListItem.new(new_item, head)
      head = n_item
    else
      first_item = find(f_item)
      first_item.insert_after(new_item) if first_item
    end
  end
end

class LinkedListItem
  attr_accessor :value, :next_item
  def initialize(val, n_item=nil)
    @value = val
    @next_item = n_item
  end

  def find(val)
    if value == val
      self
    else
      next_item.find(val) if !!next_item
    end
  end

  def delete(val)
    return unless next_item
    if next_item == val
      next_item = next_item.next_item
    else
      next_item.delete(val)
    end
  end

  def insert_after(val)
    next_item = LinkedListItem.new(val, next_item)
  end

  def ==(val)
    value == val
  end
end