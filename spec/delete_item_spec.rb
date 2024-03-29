require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.remove' do
    it 'removes an item' do
      connection = PG.connect(dbname: 'grocery_app_test')
      Grocery_List.remove(item:'onion', category: 'vegetables')
      result = connection.exec("SELECT * FROM grocery_list ORDER BY ID ASC")
      expect(result[0]['item']).to eq 'aubergine'
    end
  end
end
