class UsersController < ApplicationController
  
  
  get '/signup' do
    if logged_in?
      redirect '/costumers/index.html'
    else
      erb :'/users/signup'
    end
  end
  
  post '/signup' do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/products/index.html'
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