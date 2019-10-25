require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.reset' do
    it 'removes all items' do
      connection = PG.connect(dbname: 'grocery_app_test')
      result = connection.exec("SELECT * FROM grocery_list ORDER BY ID ASC")
      Grocery_List.add(item: "carrots", category: "vegetables")
      Grocery_List.add(item: "brocolli", category: "vegetables")
      Grocery_List.add(item: "Guinness", category: "alcohol")
      Grocery_List.add(item: "toilet roll", category: "toiletries")
      grocery_list = Grocery_List.reset
      grocery_list = Grocery_List.all?
      expect(grocery_list.length).to eq 0
    end
  end
end
