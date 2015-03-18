require 'sinatra'

get '/' do

"Max"

end

post '/sea_lions' do

redirect '/'

end

put '/try_a_put' do

"HOORAY!"

redirect '/'

end

delete '/try_a_delete' do

puts params

redirect '/'

end