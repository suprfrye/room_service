require 'sinatra'
require 'shotgun'

get '/rooms' do
@rooms = Room.all

erb :'rooms/index'
end

get '/rooms/:id' do
@room = Room.find_by(id: params[:id])
  if @room
  erb :"rooms/show"
  else
  [404, 'No post found']
  end
end


