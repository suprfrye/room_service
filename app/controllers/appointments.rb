require 'sinatra'

get '/users/:id/appointments/new' do
  @rooms = Room.all
  @groups = User.find(params[:id]).groups
  erb :"/appointments/new"
end

post '/users/:id/appointments/new' do
  new_appt = Appointment.new({group: Group.find_by(name: params[:group]),
              room: Room.find_by(name: params[:room]),
              start_datetime: DateTime.parse("#{params[:date]} #{params[:start_datetime]}"),
              end_datetime: DateTime.parse("#{params[:date]} #{params[:end_datetime]}")})
  if new_appt.save
    redirect "/users/#{params[:id]}"
  else
    redirect "/users/#{params[:id]}/appointments/new"
  end
end

get '/users/:id/appointments/:appt_id/edit' do
  @rooms = Room.all
  @groups = User.find(params[:id]).groups
  @appt = Appointment.find(params[:appt_id])
  erb :"/appointments/edit"
end

put '/users/:id/appointments/:appt_id/edit' do
  cur_appt = Appointment.find(params[:appt_id])
  cur_appt.update_attributes({group: Group.find_by(name: params[:group]),
              room: Room.find_by(name: params[:room]),
              start_datetime: DateTime.parse("#{params[:date]} #{params[:start_datetime]}"),
              end_datetime: DateTime.parse("#{params[:date]} #{params[:end_datetime]}")})
  if cur_appt.save
    redirect "/users/#{params[:id]}"
  else
    redirect "/users/#{params[:id]}/appointments/#{params[:appt_id]}/edit"
  end
end

delete '/users/:id/appointments/:appt_id/delete' do |id, appt_id|
  @cur_appt = Appointment.find(params[:appt_id])
  @cur_appt.destroy
  redirect "/users/#{params[:id]}"
end
