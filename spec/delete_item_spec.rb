require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.remove' do
    it 'remove an item' do
      grocery_list = Grocery_List.add(item: 'parsnips', category: 'vegetables')
      grocery_list.remove('parsnips')
      expect(grocery_list.item).to eq ""
    end
  end
end
