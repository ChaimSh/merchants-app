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
  
  
  
    helpers do

   def logged_in?
     !!current_user
   end


   def current_user
     @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
     end
   end
   
     
  get '/signup' do
    if logged_in?
      redirect '/costumers'
    else
      erb :'/users/signup'
    end
  end
  
  post '/signup' do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/products'
    else
      redirect "/users/signup"
    end
  end
  
  
  
  get '/login' do
    if logged_in?
      redirect '/products'
    else
      erb :'/users/login'
    end
  end
  

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/products/index.html"

    else
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end



end
