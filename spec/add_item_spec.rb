require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.add' do
    it 'adds a new item' do
      connection = PG.connect(dbname: 'grocery_app_test')
      connection.exec("TRUNCATE grocery_list;")

      grocery_list = Grocery_List.add(item: 'onion', category: 'vegetables')
      grocery_list = Grocery_List.add(item: 'aubergine', category: 'vegetables')
      expect(grocery_list).to be_a Grocery_List
      expect(grocery_list.item).to eq 'aubergine'
      expect(grocery_list.category).to eq 'vegetables'
    end
  end
end
