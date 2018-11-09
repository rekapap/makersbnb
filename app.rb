require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/booking'
require_relative './lib/sms_service'
require_relative './lib/sms_message'

require_relative './lib/mailer'


class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/users' do
   user = User.create_account(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'], phone_number: params['phone_number'])
   if user
    session[:user_id] = user.id
    Mailer.send(email: user.email, subject:"MakersBnB notification", message: "Thank you for joining MakersBnB")
    redirect '/spaces'
   else
    flash[:notice] = 'Email already exsists!'
    redirect '/'
   end
  end

  get '/spaces/new' do
    @space = Space.new
    erb :add_space
  end

  get '/spaces/:id/edit' do
    @space = Space.find(params[:id])
    erb :add_space
  end

  post '/add_space' do
    Space.create(description: params['description'], price: params['price'].to_f, user_id: session[:user_id])
    email = User.find(session[:user_id]).email
    Mailer.send(email: email, subject:"MakersBnB notification", message: "Your space has been added to MakersBnB")
    redirect '/spaces'
  end

  post '/:id/edit_space' do
    email = User.find(session[:user_id]).email
    space = Space.find(params[:id])
    space.update(description: params['description'], price: params['price'].to_f)
    Mailer.send(email: email, subject:"MakersBnB notification", message: "Your space on MakersBnB has been updated")
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
    @user = User.find(session[:user_id]).id
    @space = Space.find(params[:id])
    @space_owner = @space.user_id
    erb :'spaces/detail'
  end

  post '/request_booking' do
    if Booking.exists?(space_id: params['space_id'], date: params['date'], status: 'approved')
      flash[:notice] = "Booking not available for this date"
      redirect '/space/:id'
    else
      flash[:notice] = "Booking requested"
      @booking = Booking.create(space_id: params['space_id'], user_id: session[:user_id],  date: params['date'])

      user = User.find(session[:user_id])
      sms_message = SMSMessage.booking_sent(user, @booking)
      SMSService.new.send_sms(body: sms_message, to: user.phone_number)

      Mailer.send(email: @booking.space.user.email, subject:"MakersBnB notification", message: "You have received a booking request for Space: #{@booking.space.description}")
      Mailer.send(email: @booking.user.email, subject:"MakersBnB notification", message: "You have requested a booking for Space: #{@booking.space.description}")
      redirect '/spaces'
    end
  end

  get '/bookings' do

    user_id = session[:user_id]
    @user = User.find(user_id) unless user_id.nil?
    @bookings_made = User.find(session[:user_id]).booking_requests
    @bookings_received = User.find(session[:user_id]).bookings.where({status: 'pending'})

    erb :'/bookings/index'
  end

  post '/approve_booking/:id' do
    booking = Booking.find(params[:id])
    unless booking.status == 'pending'
      flash[:notice] = "No booking available"
    else
      ActiveRecord::Base.transaction do
        booking.status = 'approved'
        booking.save
        Booking.where({space_id: booking.space_id, date: booking.date, status: 'pending'}).update_all(status: 'rejected')
      end
      Mailer.send(email: booking.user.email, subject:"MakersBnB notification", message: "Your Booking has been confirmed")
      Mailer.send(email: booking.space.user.email, subject:"MakersBnB notification", message: "You have confirmed the booking")
      flash[:notice] = "Booking Approved"
      # confirmed
      confirmed_user = User.find(session[:user_id])
      sms_message = SMSMessage.booking_confirmed(confirmed_user, booking)
      SMSService.new.send_sms(body: sms_message, to: confirmed_user.phone_number)
      # denied
      rejected_bookings = Booking.where({space_id: booking.space_id, date: booking.date, status: 'rejected'})
      # p rejected_bookings.to_a.to_s
      rejected_users = []
      rejected_bookings.each do |booking|
        id = booking.user_id
        rejected_users << User.find(id)
      end
      rejected_users.each do |user|
        phone_number = user.phone_number
        sms_message = SMSMessage.booking_rejected(user, booking)
        SMSService.new.send_sms(body: sms_message, to: phone_number)
      end
    end
    redirect "/bookings/#{params[:id]}"
  end

  post '/reject_booking/:id' do
    booking = Booking.find(params[:id])
    unless booking.status == 'pending'
      flash[:notice] = "No booking available"
    else
      booking.status = 'rejected'
      booking.save
      Mailer.send(email: booking.user.email, subject:"MakersBnB notification", message: "Your Booking has been rejected")
      Mailer.send(email: booking.space.user.email, subject:"MakersBnB notification", message: "You have rejected the booking")
      flash[:notice] = "Booking Rejected"
      rejected_user = User.find(session[:user_id])
      sms_message = SMSMessage.booking_rejected(rejected_user, booking)
      SMSService.new.send_sms(body: sms_message, to: rejected_user.phone_number)
    end
    redirect "/bookings/#{params[:id]}"
  end

  get '/bookings/:id' do
    @booking = Booking.find(params[:id])
    erb :'/bookings/detail'
  end

end
