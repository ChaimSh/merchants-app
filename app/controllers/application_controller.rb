require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end
  
  get '/signup' do
    if logged_in?
      redirect '/costumers/index.html'
    else
      erb :signup
    end
  end
  
  post '/signup' do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/products/index.html'
    else
      redirect "/signup"
    end
  end
  
  
  
  
  
  
    helpers do

   def logged_in?
     !!current_user
   end


   def current_user
     @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
     end
   end


end
