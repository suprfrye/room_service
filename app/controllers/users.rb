require 'sinatra'

get '/users/:id' do
  @current_user = User.find_by(id: params[:id])
  "#{@current_user.first_name}"
# @current_user = User.find_by(id: params[:id])
#   if @current_user
#     erb :"users/show"
#   else
#     [404, "That user does not exist"]
#   end
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  new_user = User.create

end
