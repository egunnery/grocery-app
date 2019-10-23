require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.add' do
    it 'adds a new item' do
      grocery_list = Grocery_List.create(item: 'Test')
      expect(grocery_list).to be_a Grocery_List
      expect(grocery_list.item). to eq 'Test'
    end
  end
end
