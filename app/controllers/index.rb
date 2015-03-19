require 'sinatra'

get '/' do

"Max"

end

get '/sea_lions' do
  Sealion.all.to_json
end

get '/sea_lions/:id'
 Sealion.find(params[:id]).to_json
end

post '/sea_lions' do
sealion = Sealion.create(params)
redirect '/sea_lions'

end

put '/sea_lions/:id' do
sealion = Sealion.find(params[:id])
sealion.update_attribute(params)
redirect '/sea_lions'
end

delete '/sea_lions/:id' do
  sealion =Sealion.find(params[:id])
  sealion.destroy
  redirect '/sea_lions'
end