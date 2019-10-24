require 'simplecov'
require 'simplecov-console'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'rspec'

require_relative './setup_test_database'
ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

# RSpec.configure do |config|
#   config.after(:suite) do
#     puts
#     puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
#     puts "\e[33mTry it now! Just run: rubocop\e[0m"
#   end
# end


# <ul>
#   <h1>Test </h1>
#   <% @items.each do |item| %>
#     <li class="grocery_list" id="item-<%= grocery_list.item %>">
#       <a>
#         <%= grocery_list.item %>
#         <%= grocery_list.category %>
#       </a>
#       <form action="/list/<%= grocery_list.item %>" method="post">
#         <input type='hidden' name='_method' value='DELETE'/>
#         <input type="submit" value="Delete" />
#       </form>
#     </li>
#   <% end %>
# </ul>
