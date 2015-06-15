require 'sinatra'

get '/users/new' do
  erb :"users/new"
end

get '/users/login' do
  erb :"users/login"
end

get '/users/:id' do
  @current_user = User.find_by(id: params[:id])
  if @current_user
    erb :"users/show"
  else
    [404, "That user does not exist"]
  end
end

post '/users' do
  new_user = User.new(first_name: params[:first_name],
                        last_name: params[:last_name],
                        email_address: params[:email_address],
                        position: params[:position],
                        password: params[:password]
                         )
  if new_user.save
    redirect "/users/#{new_user.id}"
  else
    [402, "Sorry, Something went wrong"]
  end
end

post '/users/login' do
   @user_login = User.find_by(email_address: params[:email_address])

   if @user_login.password == params[:password]
    redirect "/users/#{@user_login.id}"
  else
    redirect "/users/login"
  end
end
