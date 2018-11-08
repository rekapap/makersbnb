require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/booking'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/users' do
   user = User.create_account(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'])
   if user
    session[:user_id] = user.id
    redirect '/spaces'
   else
    flash[:notice] = 'Email already exsists!'
   end
  end

  get '/spaces/new' do
    erb :add_space
  end

  post '/add_space' do
    Space.create(description: params['description'], price: params['price'].to_f, user_id: session[:user_id])
    redirect '/spaces'
  end

  get '/spaces' do
    user_id = session[:user_id]
    @user = User.find(user_id) unless user_id.nil?
    @spaces = Space.all()
    erb :'spaces/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/spaces'
  end

  get '/space/:id' do
   @space = Space.find(params[:id])
   erb :'spaces/detail'
  end

  post '/request_booking' do
    if Booking.exists?(space_id: params['space_id'], date: params['date'], status: 'approved')
      flash[:notice] = "Booking not available for this date"
      redirect '/space/:id'
    else
      flash[:notice] = "Booking requested"
      @booking = Booking.create(space_id: params['space_id'], user_id: session[:user_id],  date: params['date'])
      #call send_sms method here
      redirect '/spaces'
    end
  end

  get '/requests' do
    @bookings_requests = User.find(session[:user_id]).booking_requests
    @bookings = User.find(session[:user_id]).bookings.where({status: 'pending'})
    erb :'/requests/index'
  end

  post '/bookings/approve/:id' do
    booking = Booking.find(params[:id])
    unless booking.status == 'pending'
      flash[:notice] = "No booking available"
    else
      ActiveRecord::Base.transaction do
        booking.status = 'approved'
        booking.save
        Booking.where({space_id: booking.space_id, date: booking.date, status: 'pending'}).update_all(status: 'rejected')
      end
      flash[:notice] = "Booking Approved"
    end
    redirect "/users/#{session[:user_id]}/bookings/pending_review"
  end

  post '/bookings/reject/:id' do
    booking = Booking.find(params[:id])
    unless booking.status == 'pending'
      flash[:notice] = "No booking available"
    else
      booking.status = 'rejected'
      booking.save
      flash[:notice] = "Booking Rejected"
    end
    redirect "/users/#{session[:user_id]}/bookings/pending_review"
  end
end
