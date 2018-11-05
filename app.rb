require 'rake'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/space'

# Rake.application.load_rakefile

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  # get '/users/new' do
  #   erb :'users/new'
  # end

  post '/users' do
   user = User.create(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'])
   session[:user_id] = user.id
   redirect '/'
  end

  get '/spaces/new' do
    erb :add_space
  end

  post '/add_space' do
    Space.create(description: params['description'], price: params['price'].to_f)
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all()
    erb :space_list
  end

end
