require 'grocery_list'
require 'pg'

describe Grocery_List do
  describe '.remove' do
    it 'removes an item' do
      connection = PG.connect(dbname: 'grocery_app_test')
      result = connection.exec("SELECT * FROM grocery_list ORDER BY ID ASC")

      puts result[0]['item']


      grocery_list = Grocery_List.remove(item:'onion', category: 'vegetables')
      expect(grocery_list).to eq nil
    end
  end
end
