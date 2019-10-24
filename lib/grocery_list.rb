require 'pg'

class Grocery_List
attr_reader :item, :category

  def initialize(item:, category:)
    @item = item
    @category = category
  end

  def self.all?
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'grocery_app_test')
    else
      connection = PG.connect(dbname: 'grocery_app')
    end
    result = connection.exec("SELECT * FROM grocery_list ORDER BY ID ASC")
    result.map do |grocery_list|
      test = Grocery_List.new(item: grocery_list['item'], category: grocery_list['category'])
    end
  end

  def self.add(item:, category:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'grocery_app_test')
    else
      connection = PG.connect(dbname: 'grocery_app')
    end

    result = connection.exec("INSERT INTO grocery_list (item, category) VALUES('#{item}', '#{category}') RETURNING item, category")
    Grocery_List.new(item: result[0]['item'], category: result[0]['category'])
  end


  def self.remove(item:, category:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'grocery_app_test')
    else
      connection = PG.connect(dbname: 'grocery_app')
    end

    connection.exec("DELETE FROM grocery_list WHERE (item, category) = ('#{item}', '#{category}')")

  end

  def self.reset

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'grocery_app_test')
    else
      connection = PG.connect(dbname: 'grocery_app')
    end
    connection.exec("TRUNCATE grocery_list")
  end
end
