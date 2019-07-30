require 'rspec'
require 'pg'
require 'artist'
require 'stage'
require 'pry'

DB = PG.connect({:dbname => 'festival_spec'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM artists *;")
    DB.exec("DELETE FROM stages *;")
  end
end
