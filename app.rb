require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/coin_combinations')
require('pry')

get('/') do
  erb(:index)
end

get('/answer') do
  @coin_answer = params.fetch("input").to_i().return_coins()
  erb(:answer)
end
