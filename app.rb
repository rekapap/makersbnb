require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/booking'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/users' do
   user = User.create(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'])
   session[:user_id] = user.id
   redirect '/spaces'
  end

  get '/spaces/new' do
    erb :add_space
  end

  post '/add_space' do
    Space.create(description: params['description'], price: params['price'].to_f)
    redirect '/spaces'
  end

  get '/spaces' do
    user_id = session[:user_id]
    @user = User.find(user_id)
    @spaces = Space.all()
    erb :'spaces/index'
  end

  get '/space/:id' do
   @space = Space.find(params[:id])
   erb :'spaces/detail'
  end

  post '/request_booking' do
    if Booking.exists?(space_id: params[:id], user_id: session[:user_id],  date: params['date'])
      flash[:notice] = "Booking not available for this date"
    else
      flash[:notice] = "Booking requested"
      @booking = Booking.create(space_id: params[:id], user_id: session[:user_id],  date: params['date'])
    end
    redirect "/space/#{params[:id]}"
  end

  get '/bookings/my_bookings'
    erb :'bookings/my_bookings'
  end

  # run! if app_file == $PROGRAM_NAME

end
