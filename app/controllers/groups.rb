require 'sinatra'

get '/users/:id/groups/new' do
  @list = User.all
  erb :"groups/new"
end

get '/users/:id/groups/:group_id/edit' do
  @list = User.all
  @group = Group.find_by(id: params[:group_id])
  erb :"groups/edit"
end

post '/users/:id/groups/new' do
  user_id = params[:id]
  # if the group saves, this redirects to the appointment group
  group = Group.new(name: params[:name])
  list_user_id = params.keep_if { |k,v| v == 'on' }
  group.user = User.find_by(id: user_id)
  group.users = list_user_id.keys.map! { |id| User.find_by(id: id) }
  group.save

  redirect "/users/#{user_id}/appointments/new"
end

put '/users/:id/groups/:group_id/edit' do
  user_id = params[:id]
  group = Group.find_by(id: params[:group_id])
  list_user_id = params.keep_if { |k,v| v == 'on' }
  group.user = User.find_by(id: user_id)
  group.users = list_user_id.keys.map! { |id| User.find_by(id: id) }
  group.save

  redirect "/users/#{user_id}/appointments/new"
end
