require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.add' do
    it 'adds a new item' do
      grocery_list = Grocery_List.add(item: 'carrots', category: 'vegetables')
      expect(grocery_list).to be_a Grocery_List
      expect(grocery_list.item).to eq 'carrots'
      expect(grocery_list.category).to eq 'vegetables'
    end
  end
end
