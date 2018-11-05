require 'sinatra/base'

require_relative './lib/user'


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

end
