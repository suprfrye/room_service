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
    [404, "Invalid Appointment Entry"]
  end
end
