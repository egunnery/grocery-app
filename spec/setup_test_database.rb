require 'pg'

p "Setting up test database..."

def setup_test_database

  connection = PG.connect(dbname: 'grocery_app_test')

  connection.exec("TRUNCATE grocery_list;")

end
