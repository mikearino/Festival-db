require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('./lib/artist')
require('pry')
also_reload('lib/**/*.rb')

Artist.clear

stage1 = Stage.new(1)
stage2 = Stage.new(2)
artist1 = Artist.new("The Beatles", 1, "3:00")
artist1.save()
artist2 = Artist.new("Black Sabbath", 1, "4:00")
artist2.save()
artist3 = Artist.new("Sublime", 2, "4:00")
artist3.save()
artist4 = Artist.new("Greatful Dead", 2, "3:00")
artist4.save()

get ('/') do
  redirect to ('/welcome')
end
get ('/welcome') do
  @artists = Artist.all
  erb(:welcome)
end
get ('/search_by_stage') do
  erb(:stage_search)
end
get ('/search_by_artist') do
  erb(:artist_search)
end
get ('/search_by_time') do
  erb(:time_search)
end
post ('/time_search') do
  @artists = Artist.find_by_time(params[:time])
  erb(:display)
end
post ('/stage_search') do
  @artists = Artist.find_by_stage(params[:stage_number].to_i)
  erb(:display)
end
post ('/artist_search') do
  @artists = Artist.find_by_name(params[:name])
  erb(:display)
end
get('/add_artist') do
  erb(:add_artist)
end
post ('/add_artist') do
  Artist.add(params[:name], params[:stage_number], params[:time])
  redirect to('/welcome')
end
get ('/artist/:name') do
binding.pry
  @artist = Artist.find(params[:name].to_s.gsub(':',''))
binding.pry
  erb(:artist)
end
