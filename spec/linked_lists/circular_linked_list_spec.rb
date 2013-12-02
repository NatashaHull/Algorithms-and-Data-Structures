require 'rspec'
require 'linked_lists/circular_linked_lists.rb'

describe CircularLinkedList do
  context "sanity check" do
    it "creates a list" do
      CircularLinkedList.new
    end

    it "adds a head element to the list" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.head.should be_a(CircularLinkedListItem)
      list.head.value.should == 1
    end

    it "successfully replaces the head" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.insert_after(nil, 2)

      list.head.value.should == 2
    end

    it "finds elements in the list" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.find(1).value.should == 1
    end

    it "adds more elements to the list" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.insert_after(1, 2)
      list.insert_after(1, 3)
      list.insert_after(2, 4)
      list.find(4).value.should == 4
    end

    it "deletes elements in the list" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.insert_after(1, 2)
      list.insert_after(1, 3)
      list.insert_after(2, 4)
      list.delete(4)

      list.find(4).should be_nil
    end

    it "successfully removes the head from the list" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.insert_after(1, 2)
      list.insert_after(1, 3)
      list.insert_after(2, 4)
      list.delete(1)

      list.head.value.should == 3
    end

    it "successfully removes all the elements from the list" do
      list = CircularLinkedList.new
      list.insert_after(nil, 1)
      list.delete(1)

      list.head.should be_nil
    end
  end
end