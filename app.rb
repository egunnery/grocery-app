require 'sinatra/base'
require './lib/grocery_list'

class ListManager < Sinatra::Base
  enable :sessions, :method_override

  get '/list' do
    @items = Grocery_List.all?
    erb :'homepage'
  end

  post '/list' do
    Grocery_List.add(item: params['item'], category: params['category']).to_s
    redirect '/list'
  end

  post '/list/reset' do
    Grocery_List.reset
    redirect '/list'

end

end
