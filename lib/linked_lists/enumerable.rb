module LinkedListEnumerable
  def each(&blk)
    curr_el = head
    while curr_el
      blk.call(curr_el)
      curr_el = curr_el.next_item
    end
    self
  end

  def dup
    new_list = LinkedList.new
    tail = nil
    self.each do |el|
      new_list.insert_after(tail, el.value)
      tail = el
    end
    new_list
  end

  def map(&blk)
    self.dup.map!(&blk)
  end

  def map!(&blk)
    curr_el = head
    while curr_el
      curr_el.value = blk.call(curr_el)
      curr_el = curr_el.next_item
    end
    self
  end

  def select(&blk)
    self.dup.select!(&blk)
  end

  def select!(&blk)
    el = head
    while !!el
      delete(el) unless blk.call(el)
      el = el.next_item
    end
    self
  end
end