require 'sinatra'

get '/' do
  @rooms = Room.all
  erb :index
end
