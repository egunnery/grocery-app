require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.all' do
    it 'returns a list of items' do
      connection = PG.connect(dbname: 'grocery_app_test')

      grocery_list = Grocery_List.create(item: "Test")
      Grocery_List.create(item: "Testing testing 1 2 1 2")
      Grocery_List.create(item: "Test2")

      grocery_list = Grocery_List.all

      expect(grocery_list.length).to eq 3
      expect(grocery_list.first).to be_a Grocery_List
      expect(grocery_list.first.item).to eq 'Test2'
    end
  end
end
