require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.all?' do
    it 'returns a list of items' do
      connection = PG.connect(dbname: 'grocery_app_test')

      Grocery_List.add(item: "carrots", category: "vegetables")
      Grocery_List.add(item: "brocolli", category: "vegetables")
      Grocery_List.add(item: "Guinness", category: "alcohol")
      Grocery_List.add(item: "toilet roll", category: "toiletries")

      grocery_list = Grocery_List.all?

      expect(grocery_list.length).to eq 5
      expect(grocery_list.first).to be_a Grocery_List
      expect(grocery_list.first.item).to eq 'aubergine'
      expect(grocery_list.first.category).to eq 'vegetables'
    end
  end
end
