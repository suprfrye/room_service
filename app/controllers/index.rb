require 'sinatra'

get '/' do
<<<<<<< HEAD
  erb :index
end
=======
  @rooms = Room.all
  erb :index
end
>>>>>>> c7b448679bdf93c69bc757e974d707fcd99001fe
