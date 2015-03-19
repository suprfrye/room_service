require 'sinatra'

get '/' do

"Max"

end

get '/sealions' do
  SeaLion.all.to_json
end

get '/sealions/:id' do
sealion = SeaLion.find(params[:id])
sealion.to_json
end

post '/sealions' do
sealion = SeaLion.create(params)
redirect '/sealions'

end

put '/sealions/:id' do
sealion = SeaLion.find(params[:id])
sealion.update_attribute(params)
redirect '/sealions'
end

delete '/sealions/:id' do
  sealion =SeaLion.find(params[:id])
  sealion.destroy
  redirect '/sealions'
end