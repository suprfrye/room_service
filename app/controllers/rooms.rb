require 'sinatra'
require 'shotgun'

get '/rooms' do
@rooms = Room.all
@time = Room.find_by(id: params[:group_id])

erb :'rooms/index'
end

# get '/rooms/:id' do
# @room = Room.find_by(id: params[:id])
#   if @room
#   erb :"rooms/show"
#   else
#   [404, 'No post found']
#   end

# end


