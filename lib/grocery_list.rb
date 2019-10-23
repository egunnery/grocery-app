require 'pg'

class Grocery_List
attr_reader :item

  def initialize(item:)
    @item = item
  end

  def self.all?
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'grocery_app_test')
    else
      connection = PG.connect(dbname: 'grocery_app')
    end
    result = connection.exec("SELECT * FROM grocery_list ORDER BY ID DESC")
    result.map do |grocery_list|
      test = Grocery_List.new(item: grocery_list['item'])
    end
  end

  def self.add(item:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'grocery_app_test')
    else
      connection = PG.connect(dbname: 'grocery_app')
    end

    result = connection.exec("INSERT INTO grocery_list (item) VALUES('#{item}') RETURNING item")
    Grocery_List.new(item: result[0]['item'])
  end
end
