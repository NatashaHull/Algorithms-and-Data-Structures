def generate_linked_list
  list = LinkedList.new
  list.insert_after(nil, 1)
  list.insert_after(1, 2)
  list.insert_after(1, 3)
  list.insert_after(2, 4)
  list
end