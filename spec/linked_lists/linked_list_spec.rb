require 'rspec'
require 'linked_lists/linked_lists.rb'
require_relative '../spec_helper'

describe LinkedList do
  context "sanity check" do
    it "creates a list" do
      LinkedList.new
    end

    it "adds a head element to the list" do
      list = LinkedList.new
      list.insert_after(nil, 1)
      list.head.should be_a(LinkedListItem)
      list.head.value.should == 1
    end

    it "successfully replaces the head" do
      list = LinkedList.new
      list.insert_after(nil, 1)
      list.insert_after(nil, 2)

      list.head.value.should == 2
    end

    it "finds elements in the list" do
      list = LinkedList.new
      list.insert_after(nil, 1)
      list.find(1).value.should == 1
    end

    it "adds more elements to the list" do
      list = generate_linked_list
      list.find(4).value.should == 4
    end

    it "deletes elements in the list" do
      list = generate_linked_list
      list.delete(4)

      list.find(4).should be_nil
    end

    it "successfully removes the head from the list" do
      list = generate_linked_list
      list.delete(1)

      list.head.value.should == 3
    end

    it "successfully removes all the elements from the list" do
      list = LinkedList.new
      list.insert_after(nil, 1)
      list.delete(1)

      list.head.should be_nil
    end
  end

  describe LinkedListEnumerable do
    subject(:list) { generate_linked_list }

    describe '#each' do
      it "iterates through the whole list" do
        values = []
        list.each { |el| values << (el.value + 1) }
        values.should == [2,4,3,5]
      end

      it "returns the initial list" do
        values = []
        list.each { |el| values << (el.value + 1) }
        list.should == list
      end

      it "doesn't change the list" do
        values = []
        list.each { |el| values << (el.value + 1) }
        list.each { |el| values << (el.value) }
        values.should == [2,4,3,5,1,3,2,4]
      end
    end

    describe '#dup' do
      let(:new_list) { list.dup }

      it "creates a new list" do
        new_list.should be_a(LinkedList)
        new_list.should_not == list
      end

      it "creates an identical list" do
        curr_el = list.head
        other_curr_el = new_list.head
        while curr_el || other_curr_el
          curr_el.should == other_curr_el
          curr_el = curr_el.next_item
          other_curr_el = other_curr_el.next_item
        end
      end
    end

    describe '#map' do
      it "iterates through the whole list" do
        values = list.map { |el| el.value + 1 }
        arr_values = []
        values.each { |el| arr_values << el.value }

        arr_values.should == [2,4,3,5]
      end

      it "returns a different list" do
        values = list.map { |el| el.value + 1 }
        list.should_not == values
      end

      it "doesn't change the list" do
        values = list.map { |el| el.value + 1 }
        arr_values = []
        list.each { |el| arr_values << el.value }
        
        arr_values.should == [1,3,2,4]
      end
    end

    describe '#select' do
    end
  end
end