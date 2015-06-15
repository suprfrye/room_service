require 'sinatra'

get '/users/:id/rooms' do
  @rooms = Room.all
  @time = Room.find_by(id: params[:group_id])
  erb :'rooms/index'
end
