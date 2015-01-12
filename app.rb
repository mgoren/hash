require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/hash')

get('/') do
  erb(:index)
end

get('/hash') do
  a_hash = MyHash.new()
  a_hash.store(params.fetch('key1'), params.fetch('value1'))
  a_hash.store(params.fetch('key2'), params.fetch('value2'))
  a_hash.store(params.fetch('key3'), params.fetch('value3'))
  a_hash.store(params.fetch('key4'), params.fetch('value4'))
  a_hash.store(params.fetch('key5'), params.fetch('value5'))
  @result = a_hash.fetch(params.fetch('search'))
  erb(:hash)
end
