require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/space'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
   user = User.create(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'])
   session[:user_id] = user.id
   redirect '/spaces'
  end

  # get '/spaces' do
  #   user_id = session[:user_id]
  #   @user = User.find(user_id)
  #   erb :'spaces/index'
  # end

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

  # run! if app_file == $PROGRAM_NAME

end
